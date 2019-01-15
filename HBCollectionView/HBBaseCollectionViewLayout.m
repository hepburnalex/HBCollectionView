//
//  HBBaseCollectionViewLayout.m
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import "HBBaseCollectionViewLayout.h"

@interface HBBaseCollectionViewLayout() {
    CGFloat totalHeight;
}

@property (nonatomic, strong) NSMutableDictionary *decorationDict;
@property (nonatomic, strong) NSMutableDictionary *headerAttributes;
@property (nonatomic, strong) NSMutableDictionary *footerAttributes;
@property (nonatomic, strong) NSMutableArray *sectionItemAttributes;
@property (nonatomic, strong) NSMutableArray *decorationAttributes;
@property (nonatomic, strong) NSMutableArray *allItemAttributes;

@end

@implementation HBBaseCollectionViewLayout

- (NSMutableDictionary *)decorationDict {
    if (!_decorationDict) {
        _decorationDict = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    return _decorationDict;
}

- (NSMutableDictionary *)headerAttributes {
    if (!_headerAttributes) {
        _headerAttributes = [[NSMutableDictionary alloc] init];
    }
    return _headerAttributes;
}

- (NSMutableDictionary *)footerAttributes {
    if (!_footerAttributes) {
        _footerAttributes = [[NSMutableDictionary alloc] init];
    }
    return _footerAttributes;
}

- (NSMutableArray *)decorationAttributes {
    if (!_decorationAttributes) {
        _decorationAttributes = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _decorationAttributes;
}

- (NSMutableArray *)sectionItemAttributes {
    if (!_sectionItemAttributes) {
        _sectionItemAttributes = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _sectionItemAttributes;
}

- (NSMutableArray *)allItemAttributes {
    if (!_allItemAttributes) {
        _allItemAttributes = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _allItemAttributes;
}

- (void)prepareLayout{
    NSLog(@"prepareLayout");
    [super prepareLayout];
}

#pragma mark - Public

- (void)RegisterDecorationKindForSection:(NSString *)classname :(NSInteger)section {
    if (!classname) {
        return;
    }
    [self registerClass:NSClassFromString(classname) forDecorationViewOfKind:classname];
    [self.decorationDict setObject:classname forKey:@(section)];
}

- (void)reloadLayoutAttributes {
    [self.allItemAttributes removeAllObjects];
    [self.sectionItemAttributes removeAllObjects];
    [self.footerAttributes removeAllObjects];
    [self.headerAttributes removeAllObjects];
    [self.decorationAttributes removeAllObjects];
    
    NSMutableArray *layoutInfoArr = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray *decorationArr = [NSMutableArray arrayWithCapacity:10];
    //获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    
    totalHeight = 0;
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subLayoutArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        NSMutableArray *subDecorationArr = [NSMutableArray arrayWithCapacity:10];
        //创建header
        if (_headerFrameForSection) {
            CGRect headerFrame = _headerFrameForSection(section, totalHeight);
            if (!CGRectIsEmpty(headerFrame)) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
                UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:indexPath];
                attributes.frame = headerFrame;
                attributes.zIndex = -1;
                self.headerAttributes[@(section)] = attributes;
                [self.allItemAttributes addObject:attributes];
                totalHeight = CGRectGetMaxY(attributes.frame);
            }
        }
        float maxHeight = totalHeight;
        for (NSInteger row = 0; row < numberOfItems; row++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:row inSection:section];
            //创建cell
            if (_itemFrameForIndexPath) {
                CGRect itemFrame = _itemFrameForIndexPath(indexPath, totalHeight);
                if (!CGRectIsEmpty(itemFrame)) {
                    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
                    attributes.frame = itemFrame;
                    maxHeight = MAX(maxHeight, CGRectGetMaxY(attributes.frame));
                    [subLayoutArr addObject:attributes];
                    [self.allItemAttributes addObject:attributes];
                }
            }
            //创建背景
            NSString *kindname = self.decorationDict[@(indexPath.section)];
            if (kindname) {
                CGRect decorationFrame = _decorationFrameForIndexPath(indexPath, totalHeight);
                if (kindname && !CGRectIsEmpty(decorationFrame)) {
                    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:kindname withIndexPath:indexPath];
                    attributes.frame = decorationFrame;
                    attributes.zIndex = -1;
                    [subDecorationArr addObject:attributes];
                    [self.allItemAttributes addObject:attributes];
                }
            }
        }
        totalHeight = maxHeight;
        //添加到二维数组
        [layoutInfoArr addObject:subLayoutArr];
        [decorationArr addObject:subDecorationArr];
    }
    //存储布局信息
    [self.sectionItemAttributes addObjectsFromArray:layoutInfoArr];
    [self.decorationAttributes addObjectsFromArray:decorationArr];
}

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width, MAX(self.collectionView.frame.size.height, totalHeight));
}

//Decoration View的布局。
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"layoutAttributesForDecorationViewOfKind");
    if (indexPath.section >= self.decorationAttributes.count) {
        return nil;
    }
    if (indexPath.item >= [self.decorationAttributes[indexPath.section] count]) {
        return nil;
    }
    return (self.decorationAttributes[indexPath.section])[indexPath.item];
}

//Cell的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"layoutAttributesForItemAtIndexPath");
    if (indexPath.section >= self.sectionItemAttributes.count) {
        return nil;
    }
    if (indexPath.item >= [self.sectionItemAttributes[indexPath.section] count]) {
        return nil;
    }
    return (self.sectionItemAttributes[indexPath.section])[indexPath.item];
}

//背景图布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"layoutAttributesForSupplementaryViewOfKind");
    UICollectionViewLayoutAttributes *attribute = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        attribute = self.headerAttributes[@(indexPath.section)];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        attribute = self.footerAttributes[@(indexPath.section)];
    }
    return attribute;
}

//可见区域元素布局
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSLog(@"layoutAttributesForElementsInRect");
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attr in self.allItemAttributes) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [layoutAttributesArr addObject:attr];
        }
    }
    return layoutAttributesArr;
}

@end

//
//  HBBaseCollectionViewController.m
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import "HBBaseCollectionViewController.h"
#import "HBBaseCollectionModel.h"
#import "HBBaseCollectionViewCell.h"

@interface HBBaseCollectionViewController ()

@property(nonatomic, strong) NSMutableDictionary *modelDict;

@end

@implementation HBBaseCollectionViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelDict = [[NSMutableDictionary alloc] init];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = self.view.bounds;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}

#pragma mark - Public

- (void)RegisterItemClasses:(NSArray<NSString *> *)classnames {
    for (NSString *classname in classnames) {
        [self.collectionView registerClass:NSClassFromString(classname) forCellWithReuseIdentifier:classname];
    }
}

- (void)RegisterHeaderClasses:(NSArray<NSString *> *)classnames {
    for (NSString *classname in classnames) {
        [self.collectionView registerClass:NSClassFromString(classname) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:classname];
    }
}

- (HBBaseCollectionViewLayout *)LoadCollectionViewLayout:(NSString *)classname {
    id layout = [[NSClassFromString(classname) alloc] init];
    [self.collectionView setCollectionViewLayout:layout];
    return layout;
}

- (void)CleanModels {
    [self.modelDict removeAllObjects];
    [self.collectionView reloadData];
}

- (void)LoadSectionModels:(NSString *)classname models:(NSArray *)array section:(NSInteger)section {
    HBBaseCollectionModel *model = [[HBBaseCollectionModel alloc] init];
    model.identifier = classname;
    [model.modelList addObjectsFromArray:array];
    [self.modelDict setObject:model forKey:@(section)];
}

#pragma mark -- UICollectionViewDataSource
//Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _modelDict.count;
}

//UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    HBBaseCollectionModel *model = _modelDict[@(section)];
    return model.modelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HBBaseCollectionModel *model = _modelDict[@(indexPath.section)];
    HBBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.identifier forIndexPath:indexPath];
    cell.model = model.modelList[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath:%d %d", (int)indexPath.section, (int)indexPath.row);
}

@end

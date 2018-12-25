//
//  HBBaseCollectionViewController.m
//  TestCollectionView
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

- (void)AddSectionModels:(NSString *)name models:(NSArray *)array section:(NSInteger)section {
    HBBaseCollectionModel *model = [[HBBaseCollectionModel alloc] init];
    model.identifier = name;
    [model.modelList addObjectsFromArray:array];
    [self.modelDict setObject:model forKey:@(section)];
    
    //注册Cell
    [self.collectionView registerClass:NSClassFromString(name) forCellWithReuseIdentifier:name];
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

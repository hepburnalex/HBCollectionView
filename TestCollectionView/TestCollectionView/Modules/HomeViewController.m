//
//  HomeViewController.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/11.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "HomeViewController.h"
#import "LNRGroupHeaderView.h"
#import "LNRGroupViewLayout.h"
#import "LNRBookViewModel.h"

@interface HomeViewController ()

@property(nonatomic, strong) LNRBookViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"阅读";
    
    self.viewModel = [[LNRBookViewModel alloc] init];

    //注册ItemCell
    [self RegisterItemClasses:@[@"LNRMyBookCell", @"LNRRandomCell"]];
    //注册SectionHeader
    [self RegisterHeaderClasses:@[@"LNRGroupHeaderView"]];

    [self LoadCollectionViewLayout:@"LNRGroupViewLayout"];
    
    //加载数据
    [self LoadSectionModels:@"LNRMyBookCell" models:self.viewModel.models section:0];
    [self LoadSectionModels:@"LNRMyBookCell" models:self.viewModel.models section:1];
    [self LoadSectionModels:@"LNRRandomCell" models:self.viewModel.models section:2];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        NSArray *names = @[@"我的书架", @"精品推荐", @"随便看看"];
        LNRGroupHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"LNRGroupHeaderView" forIndexPath:indexPath];
        headerView.title = names[indexPath.section];
        headerView.OnMoreSelect = ^{
            NSLog(@"OnMoreSelect");
        };
        return headerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath:%d %d", (int)indexPath.section, (int)indexPath.row);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

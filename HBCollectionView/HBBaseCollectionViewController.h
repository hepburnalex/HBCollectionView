//
//  HBBaseCollectionViewController.h
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "HBRefreshCollectionView.h"
#import "HBBaseCollectionViewLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseCollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,  HBRefreshCollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) HBRefreshCollectionView *collectionView;

- (void)LoadSectionModels:(NSString *)classname models:(NSArray *)array section:(NSInteger)section;
- (void)RegisterItemClasses:(NSArray<NSString *> *)classnames;
- (void)RegisterHeaderClasses:(NSArray<NSString *> *)classnames;
- (HBBaseCollectionViewLayout *)LoadCollectionViewLayout:(NSString *)classname;
- (void)CleanModels;

@end

NS_ASSUME_NONNULL_END

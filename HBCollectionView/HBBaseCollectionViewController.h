//
//  HBBaseCollectionViewController.h
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseCollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView *collectionView;

- (void)LoadSectionModels:(NSString *)classname models:(NSArray *)array section:(NSInteger)section;
- (void)RegisterItemClasses:(NSArray<NSString *> *)classnames;
- (void)RegisterHeaderClasses:(NSArray<NSString *> *)classnames;
- (id)LoadCollectionViewLayout:(NSString *)classname;

@end

NS_ASSUME_NONNULL_END

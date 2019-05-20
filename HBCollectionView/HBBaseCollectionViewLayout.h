//
//  HBBaseCollectionViewLayout.h
//  HBCollectionView
//
//  Created by Hepburn on 2018/12/20.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, copy) NSInteger(^TypeOfSectionRow)(NSInteger section, NSInteger row);
@property (nonatomic, copy) CGRect(^headerFrameForSection)(NSInteger section, CGFloat top);
@property (nonatomic, copy) CGRect(^itemFrameForIndexPath)(NSIndexPath *indexPath, CGFloat top);
@property (nonatomic, copy) CGRect(^decorationFrameForIndexPath)(NSIndexPath *indexPath, CGFloat top);

- (void)reloadLayoutAttributes;
- (void)RegisterDecorationKindForSection:(NSString *)classname :(NSInteger)section;

@end

NS_ASSUME_NONNULL_END

//
//  LNRGroupHeaderView.h
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/18.
//  Copyright © 2018 ihope. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNRGroupHeaderView : UICollectionReusableView

@property(nonatomic, strong) UILabel *headerTitleLabel;
@property(nonatomic, strong) UIButton *moreBtn;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, copy) void(^OnMoreSelect)(void);

@end

NS_ASSUME_NONNULL_END

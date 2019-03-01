//
//  LNRRandomCell.h
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "HBBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNRRandomCell : HBBaseCollectionViewCell

@property(nonatomic, strong) UIImageView *bookImageView;
@property(nonatomic, strong) UILabel *bookNameLabel;
@property(nonatomic, strong) UILabel *bookDescribeLabel;

+ (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END

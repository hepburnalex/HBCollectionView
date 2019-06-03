//
//  LNRGroupViewLayout.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "LNRGroupViewLayout.h"
#import "LNRGroupBackView.h"
#import "HBBaseHeader.h"
#import "LNRRandomCell.h"

#define Interval_default CGFloatAutoFit(15)

@interface LNRGroupViewLayout()
@end

@implementation LNRGroupViewLayout

- (void)prepareLayout{
    NSLog(@"prepareLayout");
    [super prepareLayout];
    //注册Decoration View
    
    [self RegisterDecorationKindForSection:@"LNRGroupBackView" :0];
    
    self.headerFrameForSection = ^CGRect(NSInteger section, CGFloat top) {
        return CGRectMake(0, top, kScreenWidth, CGFloatAutoFit(60));
    };
    self.itemFrameForIndexPath = ^CGRect(NSIndexPath * _Nonnull indexPath, CGFloat top) {
        if (indexPath.section == 0) {
            CGFloat fWidth = (kScreenWidth - Interval_default*2 - CGFloatAutoFit(20))/3;
            CGFloat fHeight = CGFloatAutoFit(180);
            CGFloat fLeft = Interval_default + (fWidth+CGFloatAutoFit(10))*(indexPath.row%3);
            CGFloat fTop = top+(indexPath.row/3)*fHeight;
            return CGRectMake(fLeft, fTop, fWidth, fHeight);
        }
        else if (indexPath.section == 1) {
            CGFloat fWidth = (kScreenWidth - Interval_default*2 - CGFloatAutoFit(20))/3;
            CGFloat fHeight = CGFloatAutoFit(160);
            CGFloat fLeft = Interval_default + (fWidth+CGFloatAutoFit(10))*(indexPath.row%3);
            CGFloat fTop = top+(indexPath.row/3)*fHeight;
            return CGRectMake(fLeft, fTop, fWidth, fHeight);
        }
        else if (indexPath.section == 2) {
            CGFloat fWidth = kScreenWidth;
            CGFloat fHeight = [LNRRandomCell cellHeight];
            CGFloat fLeft = 0;
            CGFloat fTop = top+indexPath.row*fHeight;
            return CGRectMake(fLeft, fTop, fWidth, fHeight);
        }
        return CGRectZero;
    };
    self.decorationFrameForIndexPath = ^CGRect(NSIndexPath * _Nonnull indexPath, CGFloat top) {
        if (indexPath.section == 0 && indexPath.row%3 == 0) {
            CGFloat fHeight = CGFloatAutoFit(180);
            CGFloat fTop = top+(indexPath.row/3)*fHeight;
            return CGRectMake(0, fTop, kScreenWidth, fHeight);
        }
        else {
            return CGRectZero;
        }
    };
    [self reloadLayoutAttributes];
}

@end



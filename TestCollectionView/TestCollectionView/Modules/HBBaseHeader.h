//
//  BaseHeader.h
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h

#import <Masonry.h>

#define UIViewAutoresizingFlexibleFourMargin UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin

#define UIViewAutoresizingFlexibleFullMargin UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight

///字体
#define UIBoldFont(a) [UIFont fontWithName:@"Helvetica-Bold" size:CGFloatAutoFit(a)]
#define UISystemFont(a) [UIFont systemFontOfSize:CGFloatAutoFit(a)]

#define CGFloatAutoFit(a) a*([UIScreen mainScreen].bounds.size.width/375.)


#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height

#define WS(weakSelf)  __weak __typeof (&*self)weakSelf = self

#endif /* BaseHeader_h */

//
//  LNRGroupBackView.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "LNRGroupBackView.h"
#import "HBBaseHeader.h"

@implementation LNRGroupBackView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"qrshujia"];
        float fWidth = kScreenWidth;
        float fHeight = fWidth*image.size.height/image.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height-fHeight, fWidth, fHeight)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        imageView.image = image;
        [self addSubview:imageView];
    }
    
    return self;
}

@end

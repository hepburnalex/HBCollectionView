//
//  LNRMyBookCell.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "LNRMyBookCell.h"
#import "HBBaseHeader.h"
#import "LNRBookModel.h"

@implementation LNRMyBookCell

-(UIImageView *)bookImageView{
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] init];
        _bookImageView.layer.masksToBounds = YES;
        _bookImageView.layer.cornerRadius = CGFloatAutoFit(10);
        _bookImageView.layer.shouldRasterize = YES;
        _bookImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _bookImageView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.bookImageView];
        [self.bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(CGFloatAutoFit(140));
        }];
    }
    return self;
}

//重写
-(void)setModel:(id)model{
    [super setModel:model];
    LNRBookModel *tmpModel = (LNRBookModel *)model;
    self.bookImageView.image = [UIImage imageNamed:tmpModel.imagename];
}

@end

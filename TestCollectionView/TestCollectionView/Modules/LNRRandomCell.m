//
//  LNRRandomCell.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "LNRRandomCell.h"
#import "HBBaseHeader.h"
#import "LNRBookModel.h"

@implementation LNRRandomCell

- (UIImageView *)bookImageView{
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mybook01"]];
        _bookImageView.layer.masksToBounds = YES;
        _bookImageView.layer.cornerRadius = CGFloatAutoFit(10);
        _bookImageView.layer.shouldRasterize = YES;
        _bookImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _bookImageView;
}

- (UILabel *)bookNameLabel{
    if (!_bookNameLabel) {
        _bookNameLabel = [UILabel new];
        _bookNameLabel.textColor = [UIColor blackColor];
        _bookNameLabel.font = UIBoldFont(16);
        _bookNameLabel.text = @"神笔马良故事";
    }
    return _bookNameLabel;
}

- (UILabel *)bookDescribeLabel{
    if (!_bookDescribeLabel) {
        _bookDescribeLabel = [UILabel new];
        _bookDescribeLabel.textColor = [UIColor grayColor];
        _bookDescribeLabel.font = UISystemFont(14);
        _bookDescribeLabel.text = @"经典童话故事帮助宝贝成长";
        _bookDescribeLabel.numberOfLines = 0;
    }
    return _bookDescribeLabel;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.bookImageView];
        [self.contentView addSubview:self.bookNameLabel];
        [self.contentView addSubview:self.bookDescribeLabel];
        
        [self.bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(CGFloatAutoFit(15));
            make.top.mas_equalTo(self.contentView);
            make.width.mas_equalTo(CGFloatAutoFit(96));
            make.height.mas_equalTo(CGFloatAutoFit(125));
        }];
        
        [self.bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bookImageView.mas_right).offset(CGFloatAutoFit(10));
            make.top.mas_equalTo(self.bookImageView);
            make.right.mas_equalTo(self.contentView).offset(-CGFloatAutoFit(15));
        }];
        
        [self.bookDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bookNameLabel);
            make.top.mas_equalTo(self.bookNameLabel.mas_bottom).offset(CGFloatAutoFit(5));
            make.width.mas_equalTo(self.bookNameLabel);
            make.height.mas_equalTo(CGFloatAutoFit(100));
        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.top.mas_equalTo(self.mas_bottom).offset(-12);
            make.left.mas_equalTo(self.bookImageView.mas_right).offset(15);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

//重写
- (void)setModel:(id)model{
    [super setModel:model];
    LNRBookModel *tmpModel = (LNRBookModel *)model;
    self.bookNameLabel.text = tmpModel.title;
    self.bookDescribeLabel.text = tmpModel.introduce;
    self.bookImageView.image = [UIImage imageNamed:tmpModel.imagename];
}

+ (CGFloat)cellHeight {
    return CGFloatAutoFit(150);
}

@end

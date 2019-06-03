//
//  LNRGroupHeaderView.m
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/18.
//  Copyright © 2018 ihope. All rights reserved.
//

#import "LNRGroupHeaderView.h"
#import "HBBaseHeader.h"

@implementation LNRGroupHeaderView

-(UILabel *)headerTitleLabel {
    if (!_headerTitleLabel) {
        _headerTitleLabel = [UILabel new];
        _headerTitleLabel.font = UIBoldFont(22);
        _headerTitleLabel.textColor = [UIColor blackColor];
        _headerTitleLabel.preferredMaxLayoutWidth = kScreenWidth/2;
    }
    return _headerTitleLabel;
}

-(UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreBtn.frame = CGRectMake(0, 0, 70, 40);
        [_moreBtn setImage:[UIImage imageNamed:@"flagright"] forState:UIControlStateNormal];
        [_moreBtn setTitle:@"更多 " forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = UISystemFont(14);
        [_moreBtn addTarget:self action:@selector(OnMoreClick) forControlEvents:UIControlEventTouchUpInside];
        [_moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_moreBtn.imageView.frame.size.width, 0, _moreBtn.imageView.frame.size.width)];
        [_moreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _moreBtn.titleLabel.bounds.size.width, 0, -_moreBtn.titleLabel.bounds.size.width)];
    }
    return _moreBtn;
}

- (void)OnMoreClick {
    if (_OnMoreSelect) {
        _OnMoreSelect();
    }
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headerTitleLabel];
        [self addSubview:self.moreBtn];

        [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self).offset(CGFloatAutoFit(15));
        }];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.mas_equalTo(self);
            make.width.mas_equalTo(80);
        }];
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.headerTitleLabel.text = title;
}

@end

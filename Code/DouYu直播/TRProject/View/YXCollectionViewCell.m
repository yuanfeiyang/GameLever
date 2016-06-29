//
//  YXCollectionViewCell.m
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXCollectionViewCell.h"

@implementation YXCollectionViewCell

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.titleLb.mas_top).equalTo(0);
        }];
        [self view];
    }
    return _iconImage;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.equalTo(0);
            make.height.equalTo(30);
            
        }];
    }
    return _titleLb;
}

- (UIImageView *)iconL{
    if (!_iconL) {
        _iconL = [UIImageView new];
        
        [self.view addSubview:_iconL];
        [_iconL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(18, 18));
        }];
    }
    return _iconL;
}

- (UILabel *)topLbName{
    if (!_topLbName) {
        _topLbName = [UILabel new];
        _topLbName.textColor = [UIColor whiteColor];
        _topLbName.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:_topLbName];
        [_topLbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.left.equalTo(self.iconL.mas_right).equalTo(0);
            make.width.equalTo(100);
        }];
    }
    return _topLbName;
}
- (UILabel *)topLbNum{
    if (!_topLbNum) {
        _topLbNum = [UILabel new];
        _topLbNum.textColor = [UIColor whiteColor];
        _topLbNum.font = [UIFont systemFontOfSize:16];
        _topLbNum.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:_topLbNum];
        [_topLbNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(0);
    
        }];
    }
    return _topLbNum;
}
- (UIImageView *)iconR{
    if (!_iconR) {
        _iconR = [UIImageView new];
        [self.view addSubview:_iconR];
        [_iconR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.right.equalTo(self.topLbNum.mas_left).equalTo(0);
            make.size.equalTo(CGSizeMake(18, 18));
        }];
    }
    return _iconR;
}
- (UIView *)view{
    if (!_view) {
        _view = [UIView new];
        _view.backgroundColor = kRGBColor(0, 0, 0, 0.4);
        [self.iconImage addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(25);
        }];
    }
    return _view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self view];
    }
    return self;
}

@end

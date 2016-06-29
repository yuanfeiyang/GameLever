//
//  YXCollectionReusableView.m
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXCollectionReusableView.h"

@implementation YXCollectionReusableView

- (UIImageView *)iconImageL{
    if (!_iconImageL) {
        _iconImageL = [[UIImageView alloc]init];
        _iconImageL.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageL];
        [_iconImageL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
           // make.top.equalTo(12);
            make.bottom.equalTo(-8);
            make.width.equalTo(20);
            make.height.equalTo(20);
            
        }];
    }
    return _iconImageL;
}

- (UILabel *)headerLbL{
    if (!_headerLbL) {
        _headerLbL = [UILabel new];
        [self addSubview:_headerLbL];
        [_headerLbL mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.equalTo(8);
            make.left.equalTo(self.iconImageL.mas_right).equalTo(8);
            make.bottom.equalTo(-8);
        }];
        
    }
    return _headerLbL;
}

- (UILabel *)headerLbR{
    if (!_headerLbR) {
        _headerLbR = [UILabel new];
        [self addSubview:_headerLbR];
        
        [_headerLbR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-8);
            //make.top.equalTo(8);
        }];
    }
    return _headerLbR;
}

- (UIImageView *)iconImageR{
    if (!_iconImageR) {
        _iconImageR = [UIImageView new];
        _iconImageR.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageR];
        [_iconImageR mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.equalTo(12);
            make.right.equalTo(self.headerLbR.mas_left).equalTo(-8);
            make.bottom.equalTo(-8);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        
    }
    return _iconImageR;
}
- (UIControl *)control{
    if (!_control) {
        _control = [UIControl new];
        _control.backgroundColor = [UIColor clearColor];
        [self addSubview:_control];
        [_control mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-8);
            make.top.equalTo(8);
            make.width.equalTo(80);
        }];
    }
    return _control;
}

@end

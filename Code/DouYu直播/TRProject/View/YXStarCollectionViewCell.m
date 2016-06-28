//
//  YXStarCollectionViewCell.m
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarCollectionViewCell.h"

@implementation YXStarCollectionViewCell

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.left.equalTo(8);
            make.right.equalTo(-8);
            make.bottom.equalTo(self.lableBottom.mas_top).equalTo(-4);
            make.size.equalTo(CGSizeMake(80 , 80));
        }];
        _iconImage.layer.cornerRadius = 40;
        _iconImage.clipsToBounds = YES;
    }
    return _iconImage;
}

- (UILabel *)lableBottom{
    if (!_lableBottom) {
        _lableBottom = [UILabel new];
        _lableBottom.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lableBottom];
        [_lableBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _lableBottom;
}
@end

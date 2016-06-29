//
//  YXCollectionViewCell.h
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXCollectionViewCell : UICollectionViewCell

/**  */
@property (nonatomic) UIImageView *iconImage;
/** <#属性描述#> */
@property (nonatomic) UIImageView *iconL;
/** <#属性描述#> */
@property (nonatomic) UIImageView *iconR;
/** <#属性描述#> */
@property (nonatomic) UILabel *topLbName;
/** <#属性描述#> */
@property (nonatomic) UILabel *topLbNum;
/** <#属性描述#> */
@property (nonatomic) UILabel *titleLb;
/** <#属性描述#> */
@property (nonatomic) UIView *view;

@end

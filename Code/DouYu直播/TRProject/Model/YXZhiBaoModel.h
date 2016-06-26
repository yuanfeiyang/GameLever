//
//  YXZhiBaoModel.h
//  TRProject
//
//  Created by spare on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXBasicModel.h"

@interface YXZhiBaoModel : YXBasicModel


@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<YXQuanMingTVLinkObject *> *data;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end


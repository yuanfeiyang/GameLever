//
//  YXGameModel.m
//  TRProject
//
//  Created by spare on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameModel.h"

@implementation YXGameModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [YXQuanMingTVLinkObject class]};
}


@end



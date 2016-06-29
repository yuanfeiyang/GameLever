//
//  YXSearchModel.m
//  TRProject
//
//  Created by spare on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSearchModel.h"

@implementation YXSearchModel



@end

@implementation YXSearchModelData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items" : [YXSearchModelDataItems class]};
}

@end

@implementation YXSearchModelDataItems

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"categoryId" : @"category_id",
             @"categoryName" : @"category_name",
             @"categorySlug" : @"category_slug",
             @"playStatus" : @"play_status",
             };
}

@end

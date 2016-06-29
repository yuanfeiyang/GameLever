//
//  YXBasicModel.m
//  TRProject
//
//  Created by spare on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXBasicModel.h"

@implementation YXBasicModel

@end

@implementation YXQuanMingTVLinkObject
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"weightAdd" : @"weight_add",
             @"followAdd" : @"follow_add",
             @"playCount" : @"play_count",
             @"negativeView" : @"negative_view",
             @"coinAdd" : @"coin_add",
             @"defaultImage" : @"default_image",
             @"createAt" : @"create_at",
             @"categoryName" : @"category_name",
             @"newStartTime" : @"new_start_time",
             @"recommendImage" : @"recommend_image",
             @"lockedView" : @"locked_view",
             @"astEndAt" : @"ast_end_at",
             @"videoQuality" : @"video_quality",
             @"firstPlayAt" : @"first_play_at",
             @"followBak" : @"follow_bak",
             @"playAt" : @"play_at",
             @"appShufflingImage" : @"app_shuffling_image",
             @"categoryId" : @"category_id",
             @"categorySlug" : @"category_slug",
             };
    
}

@end


@implementation YXQuanMingTVMobileIndex
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id",
             @"slotId" : @"slot_id",
             @"createAt" : @"create_at",
             @"linkObject" : @"link_object",
             @" " : @" ",
             @" " : @" ",
             @" " : @" ",
             };
    
}

@end

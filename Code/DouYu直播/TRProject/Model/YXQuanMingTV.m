//
//  YXQuanMingTV.m
//  TRProject
//
//  Created by spare on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXQuanMingTV.h"

@implementation YXQuanMingTV
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"mobileWebgame" : [YXQuanMingTVMobileIndex class],
             @"mobileMinecraft" : [YXQuanMingTVMobileIndex class],
             @"mobileTvgame" : [YXQuanMingTVMobileIndex class],
             @"mobileSport" : [YXQuanMingTVMobileIndex class],
             @"mobileStar" : [YXQuanMingTVMobileIndex class],
             @"mobileRecommendation" : [YXQuanMingTVMobileIndex class],
             @"mobileIndex" : [YXQuanMingTVMobileIndex class],
             @"mobileLol" : [YXQuanMingTVMobileIndex class],
             @"mobileBeauty" : [YXQuanMingTVMobileIndex class],
             @"mobileHeartstone" : [YXQuanMingTVMobileIndex class],
             @"mobileBlizzard" : [YXQuanMingTVMobileIndex class],
             @"list" : [YXQuanMingTVList class],
             @"mobileDota2" : [YXQuanMingTVMobileIndex class],
             @"mobileDnf" : [YXQuanMingTVMobileIndex class],
             };

}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"mobileWebgame" : @"moblie-webgame",
             @"mobileMinecraft" : @"moblie-minecraft",
             @"mobileTvgame" : @"mobile-tvgame",
             @"mobileSport" : @"moblie-sport",
             @"mobileStar" : @"mobile-star",
             @"mobileRecommendation" : @"mobile-recommendation",
             @"mobileIndex" : @"mobile-index",
             @"mobileLol" : @"mobile-lol",
             @"mobileBeauty" : @"mobile-beauty",
             @"mobileHeartstone" : @"mobile-heartstone",
             @"mobileBlizzard" : @"moblie-blizzard",
             @"mobileDota2" : @"mobile-dota2",
             @"mobileDnf" : @"moblie-dnf",
             };



}

@end


@implementation YXQuanMingTVList


@end




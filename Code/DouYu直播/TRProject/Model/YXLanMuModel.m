//
//  YXLanMuModel.m
//  TRProject
//
//  Created by spare on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLanMuModel.h"

@implementation YXLanMuModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"firstLetter" : @"first_letter",
             @"ID" : @"id"
             };

}
@end



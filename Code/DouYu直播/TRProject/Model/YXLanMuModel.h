//
//  YXLanMuModel.h
//  TRProject
//
//  Created by spare on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YXLanMuModel : NSObject

@property (nonatomic, copy) NSString *slug;
//first_letter->firstLetter
@property (nonatomic, copy) NSString *firstLetter;

@property (nonatomic, assign) NSInteger status;
//id->ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *name;


@end



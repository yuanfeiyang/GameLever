//
//  YXLanMuViewModel.h
//  TRProject
//
//  Created by spare on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXQuanMingNetManager.h"
#import "YXLanMuModel.h"

@interface YXLanMuViewModel : NSObject

- (void)getWithLanMuCompletionHandler:(void(^)(NSError *error))completionHandler;

/** <#属性描述#> */
@property (nonatomic) NSArray<YXLanMuModel *> *LanMuList;

/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;

- (NSString *)nameForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)lolForRow:(NSInteger)row;

@end

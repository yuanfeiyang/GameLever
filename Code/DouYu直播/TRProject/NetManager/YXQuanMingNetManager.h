//
//  YXQuanMingNetManager.h
//  TRProject
//
//  Created by spare on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXQuanMingNetManager : NSObject
//推荐
+ (id)getQuanMingCompletionHandler:(void(^)(id model,NSError *error))completionHandler;
//直播列表
+ (id)getZhiBaoWithPage:(NSString *)page CompletionHandler:(void(^)(id model,NSError *error))completionHandler;
//栏目列表
+ (id)getLanMuCompletionHandler:(void(^)(id model,NSError *error))completionHandler;
//游戏列表
+ (id)getGameWithPage:(NSString *)page GameName:(NSString*)gameName CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getSearchWithNick:(NSString *)nick CompletionHandler:(void(^)(id model,NSError *error))completionHandler;



@end

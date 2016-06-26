//
//  YXQuanMingNetManager.m
//  TRProject
//
//  Created by spare on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXQuanMingNetManager.h"
#import "YXQuanMingTV.h"
#import "YXZhiBaoModel.h"
#import "YXLanMuModel.h"
#import "YXGameModel.h"
@implementation YXQuanMingNetManager
+ (id)getQuanMingCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return  [self GET:kQuanMingPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        
        
        
        !completionHandler ?: completionHandler([YXQuanMingTV parseJSON:jsonObject],error);
    }];
    
}

+ (id)getZhiBaoWithPage:(NSString *)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kzhiBaoPath,page];
    
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXZhiBaoModel parseJSON:jsonObject],error);
    }];
    
}

+ (id)getLanMuCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kLanMuPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXLanMuModel parseJSON:jsonObject],error);
    }];
}

+ (id)getGameWithPage:(NSString *)page GameName:(NSString*)gameName CompletionHandler:(void (^)(id, NSError *))completionHandler{
    
    NSString *path = [NSString stringWithFormat:kGamePath,gameName,page];
    
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXGameModel parseJSON:jsonObject],error);
    }];
    
}
@end

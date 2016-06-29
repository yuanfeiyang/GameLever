//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "YXQuanMingNetManager.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [YXQuanMingNetManager getQuanMingCompletionHandler:^(id model, NSError *error) {
//        NSLog(@"");
//    }];
    
//    [YXQuanMingNetManager getZhiBaoWithPage:1 CompletionHandler:^(id model, NSError *error) {
//        NSLog(@"");
//    }];
    
//    [YXQuanMingNetManager getLanMuCompletionHandler:^(id model, NSError *error) {
//        NSLog(@"");
//    }];
//    [YXQuanMingNetManager getGameWithPage:1 CompletionHandler:^(id model, NSError *error) {
//        NSLog(@"");
//    }];
    //全局默认配置
    [self setupGlobalConfig];
    return YES;
}

@end

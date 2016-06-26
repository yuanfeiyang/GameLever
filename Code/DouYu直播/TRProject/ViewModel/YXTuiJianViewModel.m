//
//  YXTuiJianViewModel.m
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTuiJianViewModel.h"

@implementation YXTuiJianViewModel
- (void)getTuiJianCompletionHandler:(void (^)(NSError *))completionHandler{
    [YXQuanMingNetManager getQuanMingCompletionHandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
        _TuiJianModel = model;
        !completionHandler ?: completionHandler(error);
        }
    }];
}

@end

//
//  YXLanMuViewModel.m
//  TRProject
//
//  Created by spare on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLanMuViewModel.h"

@implementation YXLanMuViewModel
//请求数据
- (void)getWithLanMuCompletionHandler:(void (^)(NSError *))completionHandler{
    [YXQuanMingNetManager getLanMuCompletionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"error");
        }else{
        _LanMuList = model;
        }
        !completionHandler ?: completionHandler(error);
        
    }];
    
}
//总共多少个
- (NSInteger)rowNumber{
    return self.LanMuList.count;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:self.LanMuList[row].image];
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.LanMuList[row].name;
}
- (NSString *)lolForRow:(NSInteger)row{
    return self.LanMuList[row].slug;
}
- (NSArray<YXLanMuModel *> *)LanMuList{
    if (!_LanMuList) {
        _LanMuList = [NSArray new];
    }
    return _LanMuList;
}
@end

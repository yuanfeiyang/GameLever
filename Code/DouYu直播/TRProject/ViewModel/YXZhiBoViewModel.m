//
//  YXZhiBoViewModel.m
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXZhiBoViewModel.h"

@implementation YXZhiBoViewModel
- (NSMutableArray<YXQuanMingTVLinkObject *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
//- (instancetype)initWithGameName:(NSString *)gameName{
//    if (self = [super init]) {
//        _gameName = gameName;
//    }
//    return self;
//}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    NSString *tmpStr = @"";
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page+1;
        tmpStr = [NSString stringWithFormat:@"_%ld",tmpPage];
    }
    
    [YXQuanMingNetManager getZhiBaoWithPage:tmpStr CompletionHandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            _ZhiBoModel = model;
            if (requestMode == VMRequestModeRefresh) {
                [_dataList removeAllObjects];
            }
            [_dataList addObjectsFromArray:_ZhiBoModel.data];
            _page = tmpPage;
            _isOnNumber = _dataList.count != 0;
        }
        !completionHandler ?: completionHandler(error);
    }];

}

- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:self.dataList[row].thumb];
}
- (NSString *)numberForRow:(NSInteger)row{
    NSInteger tmpNum = self.dataList[row].view.intValue;
    if (tmpNum>10000) {
        return [NSString stringWithFormat:@"%.lf万",tmpNum/10000.0];
    }
    return @(tmpNum).stringValue;
}
- (NSString *)leftLbForRow:(NSInteger)row{
    return self.dataList[row].nick;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}
- (NSURL *)idVideoForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:kBaoFangPath,self.dataList[row].uid]];
    
}
@end

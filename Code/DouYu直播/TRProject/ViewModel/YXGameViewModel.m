//
//  YXGameViewModel.m
//  TRProject
//
//  Created by spare on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameViewModel.h"
#import "YXQuanMingNetManager.h"
@implementation YXGameViewModel
- (NSMutableArray<YXQuanMingTVLinkObject *> *)gameList{
    if (!_gameList) {
        _gameList = [NSMutableArray new];
    }
    return _gameList;
}
- (instancetype)initWithGameName:(NSString *)gameName{
    if (self = [super init]) {
        _gameName = gameName;
    }
    return self;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    NSString *tmpStr = @"";
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page+1;
        tmpStr = [NSString stringWithFormat:@"_%ld",tmpPage];
    }
    
    [YXQuanMingNetManager getGameWithPage:tmpStr GameName:_gameName CompletionHandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            _gameModel = model;
            if (requestMode == VMRequestModeRefresh) {
                [_gameList removeAllObjects];
            }
            [_gameList addObjectsFromArray:_gameModel.data];
            _page = tmpPage;
            _isOnNumber = _gameList.count != 0;
        }
        !completionHandler ?: completionHandler(error);
    }];

}
- (NSInteger)rowNumber{
    return self.gameList.count;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:self.gameList[row].thumb];
}
- (NSString *)numberForRow:(NSInteger)row{
    NSInteger tmpNum = self.gameList[row].view.intValue;
    if (tmpNum>10000) {
        return [NSString stringWithFormat:@"%.lf万",tmpNum/10000.0];
    }
    return @(tmpNum).stringValue;
}
- (NSString *)leftLbForRow:(NSInteger)row{
    return self.gameList[row].nick;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.gameList[row].title;
}
- (NSURL *)idVideoForRow:(NSInteger)row{
    return [NSString stringWithFormat:kBaoFangPath,self.gameList[row].uid].yx_URL;
    
}
@end

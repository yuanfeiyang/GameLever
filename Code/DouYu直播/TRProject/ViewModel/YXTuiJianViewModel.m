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
        _List = _TuiJianModel.list;
        _tuiJianList = @[_TuiJianModel.mobileRecommendation,
                             _TuiJianModel.mobileLol,
                             _TuiJianModel.mobileBeauty,
                             _TuiJianModel.mobileTvgame,
                             _TuiJianModel.mobileHeartstone,
                             _TuiJianModel.mobileDota2,
                             _TuiJianModel.mobileBlizzard,
                             _TuiJianModel.mobileDnf,
                             _TuiJianModel.mobileSport,
                             _TuiJianModel.mobileMinecraft,
                             _TuiJianModel.mobileWebgame
                             ];
        
        !completionHandler ?: completionHandler(error);
        }
    }];
}
- (NSInteger)sectionNumber{
    return self.tuiJianList.count;
}
- (NSInteger)rowInSection:(NSInteger)section{
    return self.tuiJianList[section].count;
}
- (NSURL *)iconURLInSection:(NSInteger)section ForRow:(NSInteger)row{
    return self.tuiJianList[section][row].linkObject.thumb.yx_URL;
}
- (NSString *)numberInSection:(NSInteger)section ForRow:(NSInteger)row{
    NSInteger tmpNum = self.tuiJianList[section][row].linkObject.view.intValue;
    if (tmpNum>10000) {
        return [NSString stringWithFormat:@"%.lf万",tmpNum/10000.0];
    }
    return self.tuiJianList[section][row].linkObject.view;
}
- (NSString *)leftLbInSection:(NSInteger)section ForRow:(NSInteger)row{
    return self.tuiJianList[section][row].linkObject.nick;
}
- (NSString *)titleInSection:(NSInteger)section ForRow:(NSInteger)row{
    return self.tuiJianList[section][row].linkObject.title;
}
- (NSURL *)idVideoInSection:(NSInteger)section ForRow:(NSInteger)row{
    return [NSString stringWithFormat:kBaoFangPath,self.tuiJianList[section][row].linkObject.uid].yx_URL;
}
- (NSString *)categorySlugInSection:(NSInteger)section{
    return self.tuiJianList[section][0].linkObject.categorySlug;
}
- (NSString *)nameInSection:(NSInteger)section{
    return self.tuiJianList[section][0].linkObject.categoryName;
}
//组标题
- (NSString *)sectionTitle:(NSInteger)section{
    
    return self.List[section+2].name;
}

- (NSURL *)iconTopIndex:(NSInteger)index{
    return self.TuiJianModel.mobileIndex[index].thumb.yx_URL;
}
- (NSString *)titleTopIndex:(NSInteger)index{
    return self.TuiJianModel.mobileIndex[index].title;
}
- (NSURL *)videoInSection:(NSInteger)section ForRow:(NSInteger)row{
    return [NSString stringWithFormat:kBaoFangPath,self.tuiJianList[section][row].linkObject.uid].yx_URL;
}
@end

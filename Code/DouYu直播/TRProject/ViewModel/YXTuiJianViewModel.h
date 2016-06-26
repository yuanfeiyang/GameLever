//
//  YXTuiJianViewModel.h
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXQuanMingTV.h"
#import "YXQuanMingNetManager.h"
@interface YXTuiJianViewModel : NSObject
- (void)getTuiJianCompletionHandler:(void(^)(NSError *error))completionHandler;
/** <#属性描述#> */
@property (nonatomic) YXQuanMingTV *TuiJianModel;
//精彩推荐
/** <#属性描述#> */
@property (nonatomic) NSInteger jingCaiRowNum;



@end

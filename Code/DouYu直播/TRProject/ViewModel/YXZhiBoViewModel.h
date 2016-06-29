//
//  YXZhiBoViewModel.h
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXZhiBaoModel.h"
#import "TRBaseViewModel.h"
#import "YXQuanMingNetManager.h"
@interface YXZhiBoViewModel : TRBaseViewModel

//- (instancetype)initWithGameName:(NSString *)gameName;
/** <#属性描述#> */
//@property (nonatomic) NSString *gameName;
/** <#属性描述#> */
@property (nonatomic) NSInteger page;
/** <#属性描述#> */
@property (nonatomic) YXZhiBaoModel *ZhiBoModel;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<YXQuanMingTVLinkObject *> *dataList;
/** <#属性描述#> */
@property (nonatomic) BOOL isOnNumber;
/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;
// 图片
- (NSURL *)iconURLForRow:(NSInteger)row;
//房间人数
- (NSString *)numberForRow:(NSInteger)row;
//左标题
- (NSString *)leftLbForRow:(NSInteger)row;
//正标题
- (NSString *)titleForRow:(NSInteger)row;
//
- (NSURL *)idVideoForRow:(NSInteger)row;


@end

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

/** <#属性描述#> */
@property (nonatomic) NSArray<YXQuanMingTVList *> *List;

/** <#属性描述#> */
@property (nonatomic) NSArray<NSArray<YXQuanMingTVMobileIndex *>*> *tuiJianList;

/** 多少组 */
@property (nonatomic) NSInteger sectionNumber;
/** 每组多少行 */
- (NSInteger)rowInSection:(NSInteger)section;


// 图片
- (NSURL *)iconURLInSection:(NSInteger)section ForRow:(NSInteger)row;
//房间人数
- (NSString *)numberInSection:(NSInteger)section ForRow:(NSInteger)row;
//左标题
- (NSString *)leftLbInSection:(NSInteger)section ForRow:(NSInteger)row;
//正标题
- (NSString *)titleInSection:(NSInteger)section ForRow:(NSInteger)row;
//
- (NSURL *)idVideoInSection:(NSInteger)section ForRow:(NSInteger)row;
//组标题
- (NSString *)sectionTitle:(NSInteger)section;

@end

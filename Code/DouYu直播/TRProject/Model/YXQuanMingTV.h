//
//  YXQuanMingTV.h
//  TRProject
//
//  Created by spare on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXBasicModel.h"

@class YXQuanMingTVList,YXQuanMingTVLinkObject,YXQuanMingTVMobileIndex;
@interface YXQuanMingTV : YXBasicModel

//moblie-webgame->mobileWebgame
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileWebgame;
//moblie-minecraft->mobileMinecraft
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileMinecraft;
//mobile-tvgame->mobileTvgame
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileTvgame;
//moblie-sport->mobileSport
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileSport;
//mobile-star->mobileStar
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileStar;
//mobile-recommendation->mobileRecommendation
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileRecommendation;
//mobile-index->mobileIndex
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileIndex;
//mobile-lol->mobileLol
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileLol;
//mobile-beauty->mobileBeauty
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileBeauty;
//mobile-heartstone->mobileHeartstone
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileHeartstone;
//moblie-blizzard->mobileBlizzard
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileBlizzard;

@property (nonatomic, strong) NSArray<YXQuanMingTVList *> *list;

//mobile-dota2->mobileDota2
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileDota2;
//moblie-dnf->mobileDnf
@property (nonatomic, strong) NSArray<YXQuanMingTVMobileIndex *> *mobileDnf;


@end




@interface YXQuanMingTVList : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *name;

@end









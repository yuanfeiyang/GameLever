//
//  YXFirstTopReusableView.h
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXTuiJianViewModel.h"

@interface YXFirstTopReusableView : UICollectionReusableView <iCarouselDelegate,iCarouselDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

/** <#属性描述#> */
@property (nonatomic) UIImageView *iconImageL;
/** <#属性描述#> */
@property (nonatomic) UIControl *control;

/** <#属性描述#> */
@property (nonatomic) UIImageView *iconImageR;
/** <#属性描述#> */
@property (nonatomic) UILabel *headerLbL;
/** <#属性描述#> */
@property (nonatomic) UILabel *headerLbR;

/** <#属性描述#> */
@property (nonatomic)  iCarousel *ic;

/** <#属性描述#> */
@property (nonatomic) UILabel *labelT;
/** <#属性描述#> */
@property (nonatomic) UIView *viewT;
/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;
/** <#属性描述#> */
//@property (nonatomic) UIView *centerView;
/** <#属性描述#> */
@property (nonatomic) UIView *topView;
/** <#属性描述#> */
@property (nonatomic) UIView *LineView;
/** <#属性描述#> */
@property (nonatomic)  UICollectionView *collectionView;
/** <#属性描述#> */
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;


/** <#属性描述#> */
@property (nonatomic) NSArray<YXQuanMingTVMobileIndex *> *mobileStarList;
/** <#属性描述#> */
@property (nonatomic) NSArray<YXQuanMingTVMobileIndex *> *mobileIndexList;
/** <#属性描述#> */
@property (nonatomic) YXTuiJianViewModel *tuiJianVM;

- (void)getHeaderViewWithMobileIndexList:(NSArray *)mobileIndexList MobileStarList:(NSArray *)mobileStarList CompletionHandler:(void(^)())completionHandler;


@end

//
//  YXSearchViewController.h
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXZhiBaoModel.h"
#import "YXQuanMingNetManager.h"
#import "YXSearchModel.h"

@interface YXSearchViewController : UICollectionViewController

/** <#属性描述#> */
//@property (nonatomic) NSMutableArray<YXQuanMingTVLinkObject *> *searchDataList;

/** <#属性描述#> */
@property (nonatomic) NSArray<YXSearchModelDataItems *> *searchList;

/** <#属性描述#> */
@property (nonatomic) YXSearchModel *searchModel;


@end

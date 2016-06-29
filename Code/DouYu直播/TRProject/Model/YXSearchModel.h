//
//  YXSearchModel.h
//  TRProject
//
//  Created by spare on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YXSearchModelData,YXSearchModelDataItems;
@interface YXSearchModel : NSObject

/** <#属性描述#> */
@property (nonatomic,assign ) NSInteger code;
/** <#属性描述#> */
@property (nonatomic, strong)  YXSearchModelData *data;


@end

@interface YXSearchModelData : NSObject
/** <#属性描述#> */
@property (nonatomic,strong) NSArray<YXSearchModelDataItems *> *items;
/** <#属性描述#> */
@property (nonatomic,assign) NSInteger pageNb;
/** <#属性描述#> */
@property (nonatomic,assign) NSInteger total;

@end


@interface YXSearchModelDataItems : NSObject
/** <#属性描述#> */
@property (nonatomic,copy) NSString *avatar;
/** category_id->categoryId */
@property (nonatomic, assign) NSInteger categoryId;
/** category_name->categoryName */
@property (nonatomic, copy) NSString *categoryName;
/** category_slug->categorySlug */
@property (nonatomic, copy) NSString *categorySlug;
/** <#属性描述#> */
@property (nonatomic, copy) NSString *nick;
/** play_status->playStatus */
@property (nonatomic, assign) NSInteger playStatus;
/** <#属性描述#> */
@property (nonatomic, copy) NSString *thumb;
/** <#属性描述#> */
@property (nonatomic, copy) NSString *title;
/** <#属性描述#> */
@property (nonatomic, copy) NSString  *uid;
/** <#属性描述#> */
@property (nonatomic, assign) NSInteger view;



@end

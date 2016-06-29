//
//  YXGameListCodeViewController.m
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameListCodeViewController.h"
#import "YXGameViewModel.h"
#import "YXCollectionViewCell.h"
@interface YXGameListCodeViewController ()
/** <#属性描述#> */
@property (nonatomic) YXGameViewModel *gameViewMV;
@end

@implementation YXGameListCodeViewController
- (YXGameViewModel *)gameViewMV{
    if (!_gameViewMV) {
        _gameViewMV = [[YXGameViewModel alloc]initWithGameName:_gameStr];
    }
    return _gameViewMV;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(214, 214, 214, 1.0);
    self.navigationItem.title = _titleName;
    [self.collectionView registerClass:[YXCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.gameViewMV getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
                if (self.gameViewMV.isOnNumber) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.gameViewMV getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.collectionView reloadData];
                if (!self.gameViewMV.isOnNumber) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.collectionView.mj_footer endRefreshing];
        }];
        
    }];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

  return self.gameViewMV.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.iconImage setImageURL:[self.gameViewMV iconURLForRow:indexPath.row]];

    cell.iconL.image = [UIImage imageNamed:@"主播名@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.3996.000.00."];
    cell.iconR.image = [UIImage imageNamed:@"观看人数@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.41481.000.00."];
    cell.titleLb.text = [self.gameViewMV titleForRow:indexPath.row];
    cell.topLbName.text = [self.gameViewMV leftLbForRow:indexPath.row];
    cell.topLbNum.text = [self.gameViewMV numberForRow:indexPath.row];

    
    return cell;
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

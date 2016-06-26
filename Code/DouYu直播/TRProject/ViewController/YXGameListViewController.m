//
//  YXGameListViewController.m
//  TRProject
//
//  Created by spare on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameListViewController.h"
#import "YXGameViewModel.h"

@import AVFoundation;
@import AVKit;

@interface YXGameListViewController ()<UICollectionViewDelegateFlowLayout>
/** <#属性描述#> */
@property (nonatomic) YXGameViewModel *gameViewMV;
@end

@implementation YXGameListViewController
- (YXGameViewModel *)gameViewMV{
    if (!_gameViewMV) {
        _gameViewMV = [[YXGameViewModel alloc]initWithGameName:_gameStr];
    }
    return _gameViewMV;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _titleName;
   
    
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


- (IBAction)leftClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*219/310+30;
    return CGSizeMake(width, height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.gameViewMV.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *leftLb = (UILabel *)[cell.contentView viewWithTag:200];
    UILabel *numLb = (UILabel *)[cell.contentView viewWithTag:300];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:400];
    [iconImage setImageURL:[self.gameViewMV iconURLForRow:indexPath.row]];
    leftLb.text = [self.gameViewMV leftLbForRow:indexPath.row];
    numLb.text = [self.gameViewMV numberForRow:indexPath.row];
    titleLb.text = [self.gameViewMV titleForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *avpVC = [[AVPlayerViewController alloc]init];
    avpVC.player = [[AVPlayer alloc]initWithURL:[self.gameViewMV idVideoForRow:indexPath.row]];
    [self.navigationController pushViewController:avpVC animated:YES];
    [avpVC.player play];
    
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

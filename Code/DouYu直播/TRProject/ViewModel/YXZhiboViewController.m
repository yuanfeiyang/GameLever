//
//  YXZhiboViewController.m
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXZhiboViewController.h"
#import "YXZhiBoViewModel.h"
#import "YXZhiBaoModel.h"
#import "YXSearchViewController.h"

@import AVFoundation;
@import AVKit;

@interface YXZhiboViewController ()<UICollectionViewDelegateFlowLayout,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
/** <#属性描述#> */
@property (nonatomic) YXZhiBoViewModel *zhiBoVM;

@end

@implementation YXZhiboViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - LazyLoad 懒加载

- (YXZhiBoViewModel *)zhiBoVM{
    if (!_zhiBoVM) {
        _zhiBoVM = [YXZhiBoViewModel new];
    }
    return _zhiBoVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.zhiBoVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
                if (self.zhiBoVM.isOnNumber) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.zhiBoVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.collectionView reloadData];
                if (!self.zhiBoVM.isOnNumber) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.collectionView.mj_footer endRefreshing];
        }];
        
    }];

    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *avpVC = [[AVPlayerViewController alloc]init];
    avpVC.player = [AVPlayer playerWithURL:[self.zhiBoVM idVideoForRow:indexPath.row]];
    [self.navigationController pushViewController:avpVC animated:YES];
    [avpVC.player play];

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
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    YXSearchViewController *seVC = segue.destinationViewController;
//    seVC.searchDataList = self.zhiBoVM.dataList;
//    
//    
//}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*219/310+30;
    return CGSizeMake(width, height);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    if (collectionView == self.collectionV) {
//        NSLog(@"33333  %ld",self.nameList.count);
//        return self.nameList.count;
//        
//    }
    return self.zhiBoVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *leftLb = (UILabel *)[cell.contentView viewWithTag:200];
    UILabel *numLb = (UILabel *)[cell.contentView viewWithTag:300];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:400];
//    if (collectionView == self.collectionV) {
//        NSLog(@"jfgfjdfgdfj");
//        [iconImage setImageURL:[NSURL URLWithString:self.nameList[indexPath.row].thumb]];
//        leftLb.text = self.nameList[indexPath.row].nick;
//        titleLb.text = self.nameList[indexPath.row].title;
//        NSInteger tmpNum = self.nameList[indexPath.row].view.intValue;
//        if (tmpNum>10000) {
//            numLb.text = [NSString stringWithFormat:@"%.lf万",tmpNum/10000.0];
//        }else{
//            numLb.text =  @(tmpNum).stringValue;
//        }
//        
//    }else{
    
        [iconImage setImageURL:[self.zhiBoVM iconURLForRow:indexPath.row]];
        leftLb.text = [self.zhiBoVM leftLbForRow:indexPath.row];
        numLb.text = [self.zhiBoVM numberForRow:indexPath.row];
        titleLb.text = [self.zhiBoVM titleForRow:indexPath.row];
//    }
    
    
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

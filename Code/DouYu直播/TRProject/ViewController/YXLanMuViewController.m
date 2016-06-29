//
//  YXLanMuViewController.m
//  TRProject
//
//  Created by spare on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLanMuViewController.h"
#import "YXLanMuViewModel.h"
#import "YXGameListViewController.h"
@interface YXLanMuViewController ()<UICollectionViewDelegateFlowLayout>
/** <#属性描述#> */
@property (nonatomic) YXLanMuViewModel *lanMuVM;
@end

@implementation YXLanMuViewController

static NSString * const reuseIdentifier = @"Cell";
- (YXLanMuViewModel *)lanMuVM{
    if (!_lanMuVM) {
        _lanMuVM = [YXLanMuViewModel new];
    }
    return _lanMuVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.lanMuVM getWithLanMuCompletionHandler:^(NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            [self.collectionView reloadData];
        }
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-41)/3;
    CGFloat height = width * 321/227+30;
    return CGSizeMake(width, height);

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.lanMuVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *lable = (UILabel *)[cell.contentView viewWithTag:200];
    [iconImage setImageURL:[self.lanMuVM iconURLForRow:indexPath.row]];
    lable.text = [self.lanMuVM nameForRow:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"Search"]) {
        
    }else{
        
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        YXGameListViewController *vc = segue.destinationViewController;
        vc.gameStr = [self.lanMuVM lolForRow:indexPath.row];
        vc.titleName = [self.lanMuVM nameForRow:indexPath.row];
    }

    
    
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

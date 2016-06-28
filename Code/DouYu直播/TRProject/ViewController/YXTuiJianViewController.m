//
//  YXTuiJianViewController.m
//  TRProject
//
//  Created by spare on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTuiJianViewController.h"
#import "YXTuiJianViewModel.h"
#import "YXCollectionReusableView.h"
#import "YXGameListViewController.h"
#import "YXGameListCodeViewController.h"
#import "YXFirstTopReusableView.h"
@import AVFoundation;
@import AVKit;

@interface YXTuiJianViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/** <#属性描述#> */
@property (nonatomic) YXTuiJianViewModel *tuiJianVM;

@end


CGFloat num = 0;

@implementation YXTuiJianViewController


static NSString * const reuseIdentifier = @"Cell";
#pragma mark - iCarousel Delegate

#pragma mark - LazyLoad 懒加载


- (YXTuiJianViewModel *)tuiJianVM{
    if (!_tuiJianVM) {
        _tuiJianVM = [YXTuiJianViewModel new];
    }
    return _tuiJianVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[YXCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView registerClass:[YXFirstTopReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    [self.tuiJianVM getTuiJianCompletionHandler:^(NSError *error) {
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(kScreenW, 400);
    }
    return CGSizeMake(kScreenW, 50);
    
}


- (void)controlClicked:(UIControl *)sender{
    NSLog(@"111111");
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*219/310+30;
    flowLayout.itemSize = CGSizeMake(width, height);
    YXGameListCodeViewController *gameVC = [[YXGameListCodeViewController alloc]initWithCollectionViewLayout:flowLayout];
//    if (!sender.tag) {
//        if (num >= 4) {
//            num = 0;
//        }
//        num+=2;
//        [self.collectionView reloadData];
//        
//    }else{
    gameVC.titleName = [self.tuiJianVM nameInSection:sender.tag];
    gameVC.gameStr = [self.tuiJianVM categorySlugInSection:sender.tag];
    [self.navigationController pushViewController:gameVC animated:YES];
        
//    }
    
    

}

- (void)topControlerClicked:(UIControl *)sender{
    if (num >= 4) {
        num = 0;
    }else{
    num+=2;
    }
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     UICollectionReusableView *reusableview = nil ;
    if (kind == UICollectionElementKindSectionHeader) {
       
        
        if (indexPath.section == 0) {
            YXFirstTopReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            header.control.tag = indexPath.section;
            [header.control addTarget:self action:@selector(topControlerClicked:) forControlEvents:UIControlEventTouchUpInside];
            [header getHeaderViewWithMobileIndexList:self.tuiJianVM.TuiJianModel.mobileIndex MobileStarList:self.tuiJianVM.TuiJianModel.mobileStar CompletionHandler:^{
                [header.ic reloadData];
                
               
            }];
            header.iconImageR.image = [UIImage imageNamed:@"刷新-按下@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45740.000.00."];
            header.headerLbR.text = @"换一换";
            header.iconImageL.image = [UIImage imageNamed:@"栏目标题@2x.png"];
            header.headerLbL.text = [self.tuiJianVM sectionTitle:indexPath.section];
            reusableview = header;
            
        }else{
            YXCollectionReusableView  *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
            headerView.iconImageL.image = [UIImage imageNamed:@"栏目标题@2x.png"];
            headerView.headerLbL.text = [self.tuiJianVM sectionTitle:indexPath.section];
            headerView.control.tag = indexPath.section;
            [headerView.control addTarget:self action:@selector(controlClicked:) forControlEvents:UIControlEventTouchUpInside];
            headerView.iconImageR.image = [UIImage imageNamed:@"更多@2x.png"];
            headerView.headerLbR.text = @"更多";
            reusableview = headerView;
        }
       
        
        
//        UIImageView *headerIconL = (UIImageView *)[view viewWithTag:1000];
//        UIImageView *headerIconR = (UIImageView *)[view viewWithTag:4000];
//        UILabel *headerLbL = (UILabel *)[view viewWithTag:2000];
//        UILabel *headerLbR = (UILabel *)[view viewWithTag:3000];
        
//        headerLbL.text = [self.tuiJianVM sectionTitle:indexPath.section];
//        headerIconL.image = [UIImage imageNamed:@"栏目标题@2x.png"];
//        if (indexPath.section == 0) {
//           // headerIconR.image = [UIImage imageNamed:@"刷新-按下@2x.png"];
//            headerLbR.text = @"换一换";
//        }else{
//            headerIconR.image = [UIImage imageNamed:@"更多@2x.png"];
//            headerLbR.text = @"更多";
//        }
//
//        reusableview = view;
   }
    
//    if (kind == UICollectionElementKindSectionFooter){
//        
//        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
//        
//        reusableview = footerview;
//        
//    }
    
return reusableview;

}
 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*201/348+30;
    return CGSizeMake(width, height);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.tuiJianVM.sectionNumber;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    //return [self.tuiJianVM rowInSection:section];
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *leftLb = (UILabel *)[cell.contentView viewWithTag:200];
    UILabel *numLb = (UILabel *)[cell.contentView viewWithTag:300];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:400];
    if (indexPath.section == 0) {
        [iconImage setImageURL:[self.tuiJianVM iconURLInSection:indexPath.section ForRow:indexPath.row+num]];
        leftLb.text = [self.tuiJianVM leftLbInSection:indexPath.section ForRow:indexPath.row+num];
        numLb.text = [self.tuiJianVM numberInSection:indexPath.section ForRow:indexPath.row+num];
        titleLb.text = [self.tuiJianVM titleInSection:indexPath.section ForRow:indexPath.row+num];
    }else{
   
    
    [iconImage setImageURL:[self.tuiJianVM iconURLInSection:indexPath.section ForRow:indexPath.row]];
    leftLb.text = [self.tuiJianVM leftLbInSection:indexPath.section ForRow:indexPath.row];
    numLb.text = [self.tuiJianVM numberInSection:indexPath.section ForRow:indexPath.row];
    titleLb.text = [self.tuiJianVM titleInSection:indexPath.section ForRow:indexPath.row];
    }
    
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *playVC = [[AVPlayerViewController alloc]init];
    playVC.player = [[AVPlayer alloc]initWithURL:[self.tuiJianVM videoInSection:indexPath.section ForRow:indexPath.row]];
    [self.navigationController pushViewController:playVC animated:YES];
    [playVC.player play];

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

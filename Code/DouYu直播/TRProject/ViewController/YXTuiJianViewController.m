//
//  YXTuiJianViewController.m
//  TRProject
//
//  Created by spare on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTuiJianViewController.h"
#import "YXTuiJianViewModel.h"

@interface YXTuiJianViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/** <#属性描述#> */
@property (nonatomic) YXTuiJianViewModel *tuiJianVM;
@end

@implementation YXTuiJianViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - LazyLoad 懒加载
- (YXTuiJianViewModel *)tuiJianVM{
    if (!_tuiJianVM) {
        _tuiJianVM = [YXTuiJianViewModel new];
    }
    return _tuiJianVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark <UICollectionViewDataSource>
/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UIImageView *headerIconL = (UIImageView *)[view viewWithTag:1000];
        UIImageView *headerIconR = (UIImageView *)[view viewWithTag:4000];
        UILabel *headerLbL = (UILabel *)[view viewWithTag:2000];
        UILabel *headerLbR = (UILabel *)[view viewWithTag:3000];
        
        headerLbL.text = [self.tuiJianVM sectionTitle:indexPath.section];
        headerIconL.image = [UIImage imageNamed:@"栏目标题@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.22935.000.00."];
        if (indexPath.section == 0) {
            headerIconR.image = [UIImage imageNamed:@"刷新-按下@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45740.000.00."];
            headerLbR.text = @"换一换";
        }else{
            headerIconR.image = [UIImage imageNamed:@"更多@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.4253.000.00."];
            headerLbR.text = @"更多";
        }

        return view;
    }
    
    return nil;

}
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*201/348+30;
    return CGSizeMake(width, height);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.tuiJianVM.sectionNumber;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.tuiJianVM rowInSection:section];;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *leftLb = (UILabel *)[cell.contentView viewWithTag:200];
    UILabel *numLb = (UILabel *)[cell.contentView viewWithTag:300];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:400];
    
   
    
    [iconImage setImageURL:[self.tuiJianVM iconURLInSection:indexPath.section ForRow:indexPath.row]];
    leftLb.text = [self.tuiJianVM leftLbInSection:indexPath.section ForRow:indexPath.row];
    numLb.text = [self.tuiJianVM numberInSection:indexPath.section ForRow:indexPath.row];
    titleLb.text = [self.tuiJianVM titleInSection:indexPath.section ForRow:indexPath.row];
    
    
    
    
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

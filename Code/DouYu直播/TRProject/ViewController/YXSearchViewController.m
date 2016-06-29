//
//  YXSearchViewController.m
//  TRProject
//
//  Created by spare on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSearchViewController.h"
@import AVFoundation;
@import AVKit;

@interface YXSearchViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

//@property (nonatomic) NSMutableArray<YXQuanMingTVLinkObject *> *nameList;


@end

@implementation YXSearchViewController

static NSString * const reuseIdentifier = @"Cell";

//- (NSMutableArray<YXQuanMingTVLinkObject *> *)nameList{
//    if (!_nameList) {
//        _nameList = [NSMutableArray new];
//    }
//    return _nameList;
//}

- (IBAction)leftClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchClick:(id)sender {
    //NSLog(@"%@",self.nameList);
    self.searchBar.text = @"";
    [self.collectionView reloadData];
}

//搜索栏内容发生变化时触发
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [YXQuanMingNetManager getSearchWithNick:searchText CompletionHandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            _searchModel = model;
            _searchList = _searchModel.data.items;
        }
        
    }];
    
    
    
//    [self.nameList removeAllObjects];
//    NSLog(@"%@",searchText);
//    [_searchDataList enumerateObjectsUsingBlock:^(YXQuanMingTVLinkObject * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj.nick containsString:searchText]) {
//            [self.nameList addObject:obj];
//            //NSLog(@"22222 %@",obj.nick);
//            //NSLog(@"33333 %@",self.nameList);
//        }
//    }];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *avpVC = [[AVPlayerViewController alloc]init];
    avpVC.player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:kBaoFangPath,self.searchList[indexPath.row].uid]]];
    [self.navigationController pushViewController:avpVC animated:YES];
    [avpVC.player play];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.searchList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW-30)/2;
    CGFloat height = width*219/310+30;
    return CGSizeMake(width, height);
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *iconImage = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *leftLb = (UILabel *)[cell.contentView viewWithTag:200];
    UILabel *numLb = (UILabel *)[cell.contentView viewWithTag:300];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:400];
    
    [iconImage setImageURL:[NSURL URLWithString:self.searchList[indexPath.row].thumb]];
    leftLb.text = self.searchList[indexPath.row].nick;
    titleLb.text = self.searchList[indexPath.row].title;
    NSInteger tmpNum = self.searchList[indexPath.row].view;
    if (tmpNum>10000) {
        numLb.text = [NSString stringWithFormat:@"%.lf万",tmpNum/10000.0];
    }else{
        numLb.text =  @(tmpNum).stringValue;
    }
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

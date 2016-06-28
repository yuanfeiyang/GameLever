
//
//  YXFirstTopReusableView.m
//  TRProject
//
//  Created by spare on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXFirstTopReusableView.h"
#import "YXStarCollectionViewCell.h"
#import "YXLanMuViewController.h"
@import AVFoundation;
@import AVKit;

@implementation YXFirstTopReusableView{
    NSTimer *_timer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [_timer invalidate];
        _timer = nil;
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
        
       
        [self collectionView];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[YXStarCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        

        
    }
    return self;
}

- (void)getHeaderViewWithMobileIndexList:(NSArray *)mobileIndexList MobileStarList:(NSArray *)mobileStarList CompletionHandler:(void (^)())completionHandler{
    _mobileIndexList = mobileIndexList;
    _mobileStarList = mobileStarList;
    
    !completionHandler ?: completionHandler();
}

#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.mobileIndexList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleToFill;
        iv.tag = 100;
        
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv setImageURL:self.mobileIndexList[index].linkObject.thumb.yx_URL];
    self.labelT.text = self.mobileIndexList[index].linkObject.title;
    return view;
    
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    AVPlayerViewController *playVC = [[AVPlayerViewController alloc]init];
    playVC.player = [[AVPlayer alloc]initWithURL:[NSString stringWithFormat:kBaoFangPath,self.mobileIndexList[index].linkObject.uid].yx_URL];
    [self.viewController presentViewController:playVC animated:YES completion:nil];
    [playVC.player play];
    
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = kRGBColor(0, 0, 0, 0.5);
        [self.ic addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _topView;
}

//- (UIView *)centerView{
//    if (!_centerView) {
//        _centerView = [UIView new];
//        _centerView.backgroundColor =[UIColor redColor];
//        [self addSubview:_centerView];
//        [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.viewT.mas_bottom).equalTo(0);
//            make.left.right.equalTo(0);
//            make.bottom.equalTo(self.iconImageL.mas_top).equalTo(0);
//        }];
//    }
//    return _centerView;
//}

- (UIView *)viewT{
    if (!_viewT) {
        _viewT = [UIView new];
        [self addSubview:_viewT];
        [_viewT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(kScreenW * 188/340);
        }];
        
    }
    return _viewT;
}

- (iCarousel *)ic{
    if (!_ic) {
        _ic = [[iCarousel alloc]init];
        [self.viewT addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
        [self pc];
       
    }

    return _ic;
}

- (UILabel *)labelT{
    if (!_labelT) {
        _labelT = [UILabel new];
        //_labelT.textAlignment = NSTextAlignmentCenter;
        _labelT.textColor =[UIColor whiteColor];
        [self.topView addSubview:_labelT];
        [_labelT mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(8);
            make.bottom.equalTo(-8);
            make.top.equalTo(8);
            
        }];
    }
    return _labelT;
}

- (UIPageControl *)pc{
    if (!_pc) {
        _pc = [UIPageControl new];
        _pc.pageIndicatorTintColor = [UIColor redColor];
        _pc.currentPageIndicatorTintColor = [UIColor blueColor];
        _pc.numberOfPages = self.mobileIndexList.count;
        [self.topView addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(-8);
            //make.bottom.equalTo(-8);
            make.centerY.equalTo(self.labelT);
        }];
    }
    return _pc;
}

- (UIImageView *)iconImageL{
    if (!_iconImageL) {
        _iconImageL = [[UIImageView alloc]init];
        _iconImageL.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageL];
        [_iconImageL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            // make.top.equalTo(12);
            make.bottom.equalTo(-8);
            make.width.equalTo(20);
            make.height.equalTo(20);
            
        }];
    }
    return _iconImageL;
}

- (UILabel *)headerLbL{
    if (!_headerLbL) {
        _headerLbL = [UILabel new];
        [self addSubview:_headerLbL];
        [_headerLbL mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.equalTo(8);
            make.left.equalTo(self.iconImageL.mas_right).equalTo(8);
            make.bottom.equalTo(-8);
        }];
        
    }
    return _headerLbL;
}

- (UILabel *)headerLbR{
    if (!_headerLbR) {
        _headerLbR = [UILabel new];
        [self addSubview:_headerLbR];
        
        [_headerLbR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-8);
            //make.top.equalTo(8);
        }];
    }
    return _headerLbR;
}

- (UIImageView *)iconImageR{
    if (!_iconImageR) {
        _iconImageR = [UIImageView new];
        _iconImageR.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageR];
        [_iconImageR mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.equalTo(12);
            make.right.equalTo(self.headerLbR.mas_left).equalTo(-8);
            make.bottom.equalTo(-8);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        
    }
    return _iconImageR;
}
- (UIControl *)control{
    if (!_control) {
        _control = [UIControl new];
        _control.backgroundColor = [UIColor clearColor];
        [self addSubview:_control];
        [_control mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-8);
            make.top.equalTo(self.collectionView.mas_bottom).equalTo(-8);
            make.width.equalTo(80);
        }];
    }
    return _control;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = 100;
        CGFloat height = 110;
        _flowLayout.itemSize = CGSizeMake(width, height);
        
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.viewT.mas_bottom).equalTo(0);
            make.left.right.equalTo(0);
            make.bottom.equalTo(self.LineView.mas_top).equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIView *)LineView{
    if (!_LineView) {
        _LineView = [UIView new];
        _LineView.backgroundColor = kRGBColor(180, 180, 180, 1.0);
        [self addSubview:_LineView];
        [_LineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImageL.mas_top).equalTo(-10);
            make.left.right.equalTo(0);
            make.height.equalTo(2);
        }];
    }
    return _LineView;
}

#pragma mark - <#代理#> Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mobileStarList.count+1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXStarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (indexPath.row == self.mobileStarList.count) {
        cell.lableBottom.text = @"全部";
        cell.iconImage.image = [UIImage imageNamed:@"栏目-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45456.000.00."];
    }else{
        [cell.iconImage setImageURL:self.mobileStarList[indexPath.row].thumb.yx_URL];
        cell.lableBottom.text = self.mobileStarList[indexPath.row].title;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.mobileStarList.count) {
        UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        YXLanMuViewController *lanMuVC = [mainSb instantiateViewControllerWithIdentifier:@"YXLanMuViewController"];
        [self.viewController.navigationController pushViewController:lanMuVC animated:YES];
        
    }else{
    AVPlayerViewController *playVC = [[AVPlayerViewController alloc]init];
    playVC.player = [[AVPlayer alloc]initWithURL:[NSString stringWithFormat:kBaoFangPath,self.mobileStarList[indexPath.row].linkObject.uid].yx_URL];
    [self.viewController presentViewController:playVC animated:YES completion:nil];
    [playVC.player play];
    }
}
@end

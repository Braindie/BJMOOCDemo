//
//  HomeViewController.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/2.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"
//#import "SMPageControl.h"

@interface HomeViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>{

//
//    UIScrollView *myScrollView;
//    UIImageView *bottomInfoImgView;
//    UILabel *scrollImgTitle;
//    UIPageControl *myPageControl;
//
//
//    SMPageControl *myPageCon;

}


@property (nonatomic, strong) UIScrollView  * myScrollView;     //滚动广告底图
@property (nonatomic, strong) UIPageControl * myPageControl;    //翻页控件


@property (nonatomic, strong) UIScrollView *backgroundView;
@property (nonatomic, strong) UICollectionView *collectionView;




@property (nonatomic ,strong) NSMutableArray *collectionData;

@property (nonatomic ,strong) NSMutableArray *dataArr1;
@property (nonatomic ,strong) NSArray *dataArr2;


@end

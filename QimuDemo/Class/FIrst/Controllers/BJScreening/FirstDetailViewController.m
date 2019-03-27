//
//  FirstDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "BunnyCollectionView.h"

#import "TYCyclePagerView.h"
#import "TYCyclePagerCollectionViewCell.h"

#import "BJMenuRightView.h"

#import "BJMenuBarView.h"

@interface FirstDetailViewController ()<BunnyCollectionViewDelegate,BunnyCollectionViewDataSource,BJMenuRightViewDelegate,BJMenuRightViewDataSource,BJMenuBarViewDelegate,BJMenuBarViewDataSource,TYCyclePagerViewDataSource,TYCyclePagerViewDelegate>

@property (nonatomic, strong) BJMenuRightView *superMenuView;//界面筛选
@property (nonatomic, assign) BOOL isOpen;//界面筛选

@property (nonatomic, strong) TYCyclePagerView *pagerView;

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.isCustomBack = YES;
    self.navigationItem.title = @"筛选";

    //右上筛选列表
    self.isNavCtrlSetRight = YES;
    [self.rightButton setTitle:@"筛选" forState:UIControlStateNormal];
    [self addRightMenuView];

    
    //banner
    [self addPagerView];
    

    //筛选条
    [self addBarMenuView];

    
    //左对齐布局
    [self addLeftLayoutCollection];

}

#pragma mark - banner
- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
//    pagerView.layer.borderWidth = 1;
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    [pagerView registerNib:[UINib nibWithNibName:@"TYCyclePagerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    _pagerView = pagerView;
    
    [self loadData];
}

//- (void)addPageControl {
//    TYPageControl *pageControl = [[TYPageControl alloc]init];
//    //pageControl.numberOfPages = _datas.count;
//    pageControl.currentPageIndicatorSize = CGSizeMake(8, 8);
//    //    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
//    //    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
//    //    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
//    [_pagerView addSubview:pageControl];
//    _pageControl = pageControl;
//}

- (void)loadData {
    // load data to _datas
//    _pageControl.numberOfPages = _datas.count;
    [_pagerView reloadData];
}

#pragma mark TYCyclePagerViewDataSource & TYCyclePagerViewDelegate
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView{
    return 3;
}

- (__kindof UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index{
    TYCyclePagerCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH - 80, 130);
    layout.layoutType =  TYCyclePagerTransformLayoutLinear;
    layout.itemHorizontalCenter = YES;
    return layout;
}



- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog (@"%s",__func__);
}




#pragma mark - barMenuView
- (void)addBarMenuView{
    BJMenuBarView *barView = [[BJMenuBarView alloc] initWithOrigin:CGPointMake(0, 200) andHeight:35];
    barView.delegate = self;
    barView.dataSource = self;
    barView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:barView];
}

#pragma mark BJMenuBarViewDataSource & BJMenuBarViewDelegate
- (NSArray *)titleForRowAtIndexPathMenu:(BJMenuBarView *)menu{
    return @[@"全部", @"充值", @"提现", @"筛选"];
}

- (NSArray *)cellTitelForRowAtIndexPathMenu:(BJMenuBarView *)menu{
    return @[@"全部", @"充值", @"提现", @"投资", @"回款本息", @"投资支出"];
}

//点击了默认按钮
- (void)clickDefaultAction{
    
}
//点击了年利率按钮
- (void)clickRateActionIsUp:(BOOL)isUp{
    
}
//点击了期限按钮
- (void)clickTimeActionIsUp:(BOOL)isUp{
    
}
//点击筛选确定或重置按钮
- (void)clickSelectActionWithType:(NSInteger)type withRate:(NSInteger)rate withTime:(NSInteger)time{
    
}


#pragma mark - leftLayoutCollection
- (void)addLeftLayoutCollection{
    
    BunnyCollectionView *view = [[BunnyCollectionView alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, 300)];
    view.dataSource = self;
    view.delegate = self;
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
}

#pragma mark BunnyCollectionViewDataSource
- (NSArray *)arrayInCollectionView:(BunnyCollectionView *)view{
    return @[@"工薪族工薪族",@"私营业主工薪族",@"网店买卖工薪族",@"学生工薪族",@"其他工薪族",@"有缴纳工薪族工有缴纳工薪族工有缴纳工薪族工有缴纳工薪族工薪族工薪族工薪族",@"网店买卖工薪族"];
}

- (void)currentSelectedItem:(NSString *)model{
    NSLog(@"%@",model);
}




#pragma mark - rightMenuView
- (void)addRightMenuView{
    _superMenuView = [[BJMenuRightView alloc] initWithMenuOrigin:CGPointMake(SCREEN_WIDTH-30, 64) withMenuHeight:150 withMenuWidth:100];
    _superMenuView.delegate = self;
    _superMenuView.dataSource = self;
}

- (void)rightButtonAction:(UIButton *)button{
    if (!self.isOpen) {
        [self.superMenuView showMenu];
        self.isOpen = YES;
    } else {
        [self.superMenuView cancleMenu];
        self.isOpen = NO;
    }
}

#pragma mark BJMenuRightViewDataSource & BJMenuRightViewDelegate
- (NSArray *)menu:(BJMenuRightView *)menu cellForRowAtIndexPath:(NSInteger)index {
    return @[@"全部", @"充值", @"提现", @"投资", @"回款本息", @"投资支出"];
}

// 点击Cell代理事件
- (void)menu:(BJMenuRightView *)menu didSelectRowAtIndexPath:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}

// 点击蒙版代理事件
- (void)menuCheckCancleShow:(BJMenuRightView *)menu{
    self.isOpen = NO;
    //    [_rightBtn setImage:[UIImage imageNamed:@"orange_down"] forState:UIControlStateNormal];
}



@end

//
//  BJCarouselViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/4/1.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJCarouselViewController.h"
#import "TYCyclePagerView.h"
#import "TYCyclePagerCollectionViewCell.h"

@interface BJCarouselViewController ()<TYCyclePagerViewDataSource,TYCyclePagerViewDelegate>

@property (nonatomic, strong) TYCyclePagerView *pagerView;

@end

@implementation BJCarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.isCustomBack = YES;
    self.navigationItem.title = @"筛选";
    
    //banner
    [self addPagerView];
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


@end

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
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 200)];
//    pagerView.layer.borderWidth = 1;
    pagerView.isInfiniteLoop = YES;
//    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    [pagerView registerNib:[UINib nibWithNibName:@"TYCyclePagerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    _pagerView = pagerView;
    
    
    [_pagerView reloadData];
}


#pragma mark TYCyclePagerViewDataSource & TYCyclePagerViewDelegate
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView{
    return 5;
}

- (__kindof UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index{
    TYCyclePagerCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH - 100, 130);
    layout.itemSpacing = 30;
    layout.layoutType =  TYCyclePagerTransformLayoutNormal;
    layout.itemHorizontalCenter = NO;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog (@"%s",__func__);
}


@end

//
//  BJLeftAlignedViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/4/1.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJLeftAlignedViewController.h"
#import "BunnyCollectionView.h"


@interface BJLeftAlignedViewController ()<BunnyCollectionViewDelegate,BunnyCollectionViewDataSource>

@end

@implementation BJLeftAlignedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.isCustomBack = YES;
    self.navigationItem.title = @"";
    
    //左对齐布局
    [self addLeftLayoutCollection];
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


@end

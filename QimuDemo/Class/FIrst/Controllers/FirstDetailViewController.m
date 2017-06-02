//
//  FirstDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "BunnyCollectionView.h"

@interface FirstDetailViewController ()<BunnyCollectionViewDelegate,BunnyCollectionViewDataSource>

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isNavCtrlSet = YES;
    
    self.navigationItem.title = @"详情";
    
    
    
    BunnyCollectionView *view = [[BunnyCollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 500)];
    view.dataSource = self;
    view.delegate = self;
    [self.view addSubview:view];
    
    
    
    
}

#pragma mark - 
- (NSArray *)arrayInCollectionView:(BunnyCollectionView *)view{
    return @[@"工薪族",@"私营业主",@"网店买卖",@"学生",@"其他",@"有缴纳"];
}

- (void)currentSelectedItem:(NSString *)model{
    NSLog(@"%@",model);
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

@end

//
//  FirstRightDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/21.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "FirstRightDetailViewController.h"
#import "BJBarChartView.h"
//#import "BJChartModel.h"
#import "BJKChartView.h"

@interface FirstRightDetailViewController ()

@end

@implementation FirstRightDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图表";
    self.isCustomBack = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    BJBarChartView *view = [[BJBarChartView alloc] initWithFrame:CGRectMake(20, 64+30, SCREEN_WIDTH-20*2, 200)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    
    BJKChartView *kview = [[BJKChartView alloc] initWithFrame:CGRectMake(20, 350, SCREEN_WIDTH-20*2, 200)];
    kview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:kview];
    
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

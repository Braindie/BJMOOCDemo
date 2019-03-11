//
//  BJBarChartViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJBarChartViewController.h"
#import "BJBarChartView.h"

@interface BJBarChartViewController ()

@end

@implementation BJBarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"柱状图";
    self.isCustomBack = YES;
    
    BJBarChartView *view = [[BJBarChartView alloc] initWithFrame:CGRectMake(20, 64+30, SCREEN_WIDTH-20*2, 200)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.center = self.view.center;
    [self.view addSubview:view];
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

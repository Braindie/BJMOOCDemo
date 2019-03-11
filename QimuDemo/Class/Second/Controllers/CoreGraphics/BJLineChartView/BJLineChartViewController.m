//
//  BJLineChartViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJLineChartViewController.h"
#import "BJKChartView.h"

@interface BJLineChartViewController ()

@end

@implementation BJLineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"折线图";
    self.isCustomBack = YES;
    

    BJKChartView *kview = [[BJKChartView alloc] initWithFrame:CGRectMake(20, 350, SCREEN_WIDTH-20*2, 200)];
    kview.backgroundColor = [UIColor blackColor];
    kview.center = self.view.center;
    [self.view addSubview:kview];
    
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

//
//  SecondLeftDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/9.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "SecondLeftDetailViewController.h"
#import "BJWaveView.h"
#import "BJLoadingView.h"

@interface SecondLeftDetailViewController ()

@end

@implementation SecondLeftDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"波浪";
    self.isCustomBack = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    BJWaveView *waveView = [[BJWaveView alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 50)];
    [self.view addSubview:waveView];
    
    
    BJLoadingView *view = [[BJLoadingView alloc] initWithFrame:CGRectMake(50, 300, 40, 31)];
    [self.view addSubview:view];
    [view startLoading];

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

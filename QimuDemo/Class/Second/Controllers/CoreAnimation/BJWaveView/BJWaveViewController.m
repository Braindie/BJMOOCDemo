//
//  BJWaveViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJWaveViewController.h"
#import "BJWaveView.h"
#import "BJLoadingView.h"

@interface BJWaveViewController ()
@property (nonatomic, strong) BJWaveView *waveView;
@property (nonatomic, strong) BJLoadingView *loadingView;
@end

@implementation BJWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"波浪图";
    self.isCustomBack = YES;

    
    //波浪图
    self.waveView = [[BJWaveView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50)];
    [self.view addSubview:self.waveView];
    [self.waveView startLoading];
    

    //转场动画（layer图片）
    self.loadingView = [[BJLoadingView alloc] initWithFrame:CGRectMake(50, 200, 40, 31)];
    self.loadingView.center = self.view.center;
    [self.view addSubview:self.loadingView];
    [self.loadingView startLoading];

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.waveView stopLoading];
    
    [self.loadingView stopLoading];
}


@end

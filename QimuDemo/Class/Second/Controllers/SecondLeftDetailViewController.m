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
#import "BJRingtLoadingView.h"

@interface SecondLeftDetailViewController ()
@property (nonatomic, strong) UIButton *likeBtn;

@property (nonatomic, strong) BJRingtLoadingView *loadingView;
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
    
    
    _loadingView = [[BJRingtLoadingView alloc] initWithFrame:CGRectMake(150, 300, 100, 100)];
    [self.view addSubview:_loadingView];
    
    
//    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    likeBtn.frame = CGRectMake(50, 400, 50, 50);
//    [likeBtn setImage:[UIImage imageNamed:@"du"] forState:UIControlStateNormal];
//    [likeBtn setImage:[UIImage imageNamed:@"blue"] forState:UIControlStateSelected];
//    [likeBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:likeBtn];
    
    self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeBtn.frame = CGRectMake(50, 400, 50, 50);
    //        btn.backgroundColor = LINE_GRAY_COLOREE;
    [self.likeBtn setImage:[UIImage imageNamed:@"du"] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"blue"] forState:UIControlStateSelected];
    self.likeBtn.selected = NO;
    self.likeBtn.tag = 200+1;
    [self.likeBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.likeBtn];

}

- (void)clickAction:(UIButton *)sender{
    
    
    if (sender.isSelected == NO) {
        sender.selected = YES;
        [self.loadingView pauseAnimation];

    }else{
        sender.selected = NO;
        [self.loadingView resumeAnimation];

    }
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.2)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [sender.layer addAnimation:k forKey:@"SHOW"];
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

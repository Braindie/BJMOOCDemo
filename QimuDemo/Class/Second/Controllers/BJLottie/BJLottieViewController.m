//
//  BJLottieViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2019/12/13.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJLottieViewController.h"
#import <Lottie/Lottie.h>


@interface BJLottieViewController ()

@end

@implementation BJLottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 本地加载
//    LOTAnimationView *view = [LOTAnimationView animationNamed:@"LottieLogo1"];
    
    // 网络加载
    LOTAnimationView *view = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://gitee.com/Braindie/BJ-Resource/raw/master/LottieLogo1.json"]];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    view.center = self.view.center;
    [self.view addSubview:view];
    [view play];
}

@end

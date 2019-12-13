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
        
    LOTAnimationView *view = [LOTAnimationView animationNamed:@"LottieLogo1"];
    view.frame = CGRectMake(0, 0, 300, 300);
    view.center = self.view.center;
    [self.view addSubview:view];
    [view play];
}

@end

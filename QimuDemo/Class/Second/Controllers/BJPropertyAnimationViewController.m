//
//  BJPropertyAnimationViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/5.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJPropertyAnimationViewController.h"

@interface BJPropertyAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *quareView;
@property (nonatomic, strong) UIViewPropertyAnimator *propertyAnimation;
@end

@implementation BJPropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"UIViewPropertyAnimator";
    self.isCustomBack = YES;

    
    self.quareView.frame = CGRectMake(0, 0, 80, 80);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    self.propertyAnimation = [[UIViewPropertyAnimator alloc] initWithDuration:0.5 curve:UIViewAnimationCurveEaseIn animations:^{
//        self.quareView.center = self.view.center;
//    }];
//    [self.propertyAnimation startAnimation];
    
    
    UICubicTimingParameters *parameters = [[UICubicTimingParameters alloc] initWithControlPoint1:CGPointMake(0.45, 1.0) controlPoint2:CGPointMake(0.55, 0)];
    self.propertyAnimation = [[UIViewPropertyAnimator alloc] initWithDuration:0.5 timingParameters:parameters];
    [self.propertyAnimation addAnimations:^{
        self.quareView.center = self.view.center;
    }];
    [self.propertyAnimation startAnimation];
}



- (void)dealloc
{
    NSLog(@"销毁了");
}

@end

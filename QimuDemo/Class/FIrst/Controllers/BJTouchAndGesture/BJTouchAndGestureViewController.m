//
//  BJTouchAndGestureViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/8.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTouchAndGestureViewController.h"
#import "BJTouchBaseView.h"
#import "BJTouchTestView.h"
#import "BJTouchTestButton.h"

@interface BJTouchAndGestureViewController ()
@property (nonatomic, strong) BJTouchBaseView *baseView;
@property (nonatomic, strong) BJTouchTestView *testView;
@property (nonatomic, strong) BJTouchTestButton *testBtn;
@end

@implementation BJTouchAndGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.isCustomBack = YES;
    
    self.baseView = [[BJTouchBaseView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.baseView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.baseView];
    
    
    self.testView = [[BJTouchTestView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    self.testView.backgroundColor = [UIColor grayColor];
    [self.baseView addSubview:self.testView];
    
    
    self.testBtn = [BJTouchTestButton buttonWithType:UIButtonTypeCustom];
    self.testBtn.frame = CGRectMake(100, 200, 100, 100);
    self.testBtn.backgroundColor = [UIColor redColor];
    [self.testBtn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [self.baseView addSubview:self.testBtn];
    
//    self.testBtn.userInteractionEnabled = NO;//1
//    self.testBtn.hidden = YES;//2
//    self.testBtn.alpha = 0.01;//3
    
    [self.testBtn addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
    [self.testBtn addTarget:self action:@selector(btnAction2:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnAction1:(UIButton *)sender{
    NSLog(@"===> testBtn1");
}
- (void)btnAction2:(UIButton *)sender{
    NSLog(@"===> testBtn2");
}

@end

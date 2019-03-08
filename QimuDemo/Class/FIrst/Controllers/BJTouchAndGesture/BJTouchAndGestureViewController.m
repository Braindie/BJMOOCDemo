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

@interface BJTouchAndGestureViewController ()
@property (nonatomic, strong) BJTouchBaseView *baseView;
@property (nonatomic, strong) BJTouchTestView *testView;
@property (nonatomic, strong) UIButton *testBtn;
@end

@implementation BJTouchAndGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.isCustomBack = YES;
    
    self.baseView = [[BJTouchBaseView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.baseView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.baseView];
    
    
    self.testView = [[BJTouchTestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testView.backgroundColor = [UIColor grayColor];
    [self.baseView addSubview:self.testView];
    
    
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.testBtn.frame = CGRectMake(0, 200, 100, 100);
    [self.testBtn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [self.baseView addSubview:self.testBtn];
    
    
    [self.testBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction:(UIButton *)sender{
    NSLog(@"===> testBtn");
}

@end

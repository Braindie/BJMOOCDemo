//
//  CenterTabBarController.m
//  Demo
//
//  Created by zwj on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


@property (nonatomic ,assign) BOOL isCustomBack;

@property (nonatomic ,assign) BOOL isNavCtrlSetLeft;
@property (nonatomic ,assign) BOOL isNavCtrlSetRight;


@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

//设置的左右按钮事件
- (void)leftButtonAction:(UIButton *)button;

- (void)rightButtonAction:(UIButton *)button;

@end

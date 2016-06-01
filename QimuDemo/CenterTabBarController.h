//
//  CenterTabBarController.m
//  Demo
//
//  Created by zwj on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UnReadCountService.h"



@interface CenterTabBarController : UITabBarController<UINavigationControllerDelegate>
{
      //选中按钮背景图片
      UIImageView *_selectedImageView;
      
      
}

@property (nonatomic ,strong) UIImageView *tabbarView;//自定义标签栏

@property (nonatomic ,strong) UIImageView *unReadCountView;

//@property (nonatomic ,retain) UnReadCountService *unReadCountService;

@end

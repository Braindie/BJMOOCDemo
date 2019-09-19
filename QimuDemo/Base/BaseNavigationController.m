//
//  CenterTabBarController.m
//  Demo
//
//  Created by zwj on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
      
      self = [super initWithRootViewController:rootViewController];
      if (self) {
        //注册通知
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNameChanged:) name:kThemeNotification object:nil];
      }
      
      return self;
}


- (void)dealloc{
      
      //移除通知
//      [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeNotification object:nil];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      
      //设置导航栏的透明度
//      self.navigationBar.translucent = NO;
    
      //设置导航栏背景图片
//      [self themeNameChanged:nil];
    
}


#pragma mark - 主题切换通知事件
- (void)themeNameChanged:(NSNotification *)notif{
    
      
//      设置导航栏背景图片
//      UIImage *image = [[ThemeManager shareThemeManager] getThemeImageWithImageName:@"mask_titlebar.png"];
    UIImage *image = [UIImage imageNamed:@"5.31.03.png"];


    CGImageRef endImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(10, 0, self.view.frame.size.width, 64));
    image = [UIImage imageWithCGImage:endImageRef];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//      释放cf类库的对象
    CFRelease(endImageRef);
}

//有问题
//#pragma mark - UINavigationControllerDelegate
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    if (navigationController.viewControllers.count == 1) {
//        // 当前导航控制器的子视图控制器个数为1的时候显示标签栏
//        viewController.hidesBottomBarWhenPushed = YES;
//    }else{
//        viewController.hidesBottomBarWhenPushed = NO;
//    }
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end

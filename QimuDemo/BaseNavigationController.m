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
      self.navigationBar.translucent = NO;
      
      //设置导航栏背景图片
      [self themeNameChanged:nil];
      
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

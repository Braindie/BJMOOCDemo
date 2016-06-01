//
//  BaseViewController.m
//  WXWeibo
//
//  Created by 朱思明 on 15/6/6.
//  Copyright (c) 2015年 朱思明. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 自定义标题
- (void)setTitle:(NSString *)title
{
      [super setTitle:title];
      
      // 自定义标题
      UILabel *titleLabel = [ThemeControl createThemeLabelWithTextColorKey:@"Msg_Text_color" frame:CGRectMake(0, 0, 120, 44)];
      titleLabel.font = [UIFont boldSystemFontOfSize:18];
      titleLabel.textAlignment = NSTextAlignmentCenter;
      titleLabel.text = title;
      self.navigationItem.titleView = titleLabel;
      
}




#pragma mark - 使用左右设置按钮
- (void)setIsNavCtrlSet:(BOOL)isNavCtrlSet
{
      if (_isNavCtrlSet != isNavCtrlSet) {
            _isNavCtrlSet = isNavCtrlSet;
            
            // 创建左右设置按钮
            if (_isNavCtrlSet == YES) {
                  _isNavCtrlSet = isNavCtrlSet;
                  // 01 创建左侧按钮
                  UIButton *leftButton = [ThemeControl createThemeButtonWithTitleImageName:@"group_btn_all_on_title.png" bgImageName:@"button_title.png" title:@"设 置" frame:CGRectMake(0, 0, 100, 44)];
                  // 设置文本的大小和位置
                  leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
                  leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
                  // 设置标题图片的位置
                  leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
                  
                  [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
                  
                  // 创建右侧按钮
                  UIButton *rightButton = [ThemeControl createThemeButtonWithTitleImageName:@"button_icon_plus.png" bgImageName:@"button_m.png" title:nil frame:CGRectMake(0, 0, 44, 44)];
                  [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
            }
      }
}

//设置的左右按钮事件
- (void)leftButtonAction:(UIButton *)button
{
      // 显示左侧视图控制器
      [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)rightButtonAction:(UIButton *)button
{
      // 现实右侧视图控制器
      [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}




#pragma mark - 使用自定义返回按钮
- (void)setIsCustomBack:(BOOL)isCustomBack{
      
      if (_isCustomBack != isCustomBack) {
            _isCustomBack = isCustomBack;
            
            //如果——isCustomBack == yes 我们就使用自定义初始化按钮
            if (_isCustomBack == YES) {
                  // 创建主题按钮
                  UIButton *backButton = [ThemeControl createThemeButtonWithTitleImageName:nil bgImageName:@"titlebar_button_back_9.png" title:@"返回" frame:CGRectMake(0, 0, 60, 44)];
                  //设置字体大小
                  backButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
                  //backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);

                  //添加事件
                  [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
                  //设置导航栏上
                  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
            }
      }
}

//返回按钮事件
- (void)backAction:(UIButton *)button{
      [self.navigationController popViewControllerAnimated:YES];
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

//
//  CenterTabBarController.m
//  Demo
//
//  Created by zwj on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import "BaseViewController.h"
//#import "UIViewController+MMDrawerController.h"

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
//      UILabel *titleLabel = [ThemeControl createThemeLabelWithTextColorKey:@"Msg_Text_color" frame:CGRectMake(0, 0, 120, 44)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
      titleLabel.font = [UIFont boldSystemFontOfSize:18];
      titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;;
      self.navigationItem.titleView = titleLabel;
      
}




#pragma mark - 使用左右设置按钮
- (void)setIsNavCtrlSet:(BOOL)isNavCtrlSet
{
      if (_isNavCtrlSet != isNavCtrlSet) {
            _isNavCtrlSet = isNavCtrlSet;
            
            // 创建右设置按钮
            if (_isNavCtrlSet == YES) {
                  _isNavCtrlSet = isNavCtrlSet;
                  // 01 创建左侧按钮
                UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
                leftButton.frame = CGRectMake(0, 0, 30, 30);
//                leftButton.titleLabel.text = @"我的";
//                [leftButton setTitle:@"我的" forState:UIControlStateSelected];
//                [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [leftButton setImage:[UIImage imageNamed:@"btn_set.png"] forState:UIControlStateNormal];
                  // 设置文本的大小和位置
                  leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
//                  leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
                  // 设置标题图片的位置
//                  leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);

                  [leftButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];

                  // 创建右侧按钮
                UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
                rightButton.frame = CGRectMake(0, 0, 30, 30);
                [rightButton setImage:[UIImage imageNamed:@"btn_set.png"] forState:UIControlStateNormal];
                [rightButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];

                UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
                UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithCustomView:rightButton];

                self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn1,btn2, nil];

            }
      }
}

//设置的左右按钮事件
- (void)leftButtonAction:(UIButton *)button
{
      // 显示左侧视图控制器
//      [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    NSLog(@"按钮二");
}

- (void)rightButtonAction:(UIButton *)button
{
      // 现实右侧视图控制器
//      [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    NSLog(@"按钮一");
}




#pragma mark - 使用自定义返回按钮
- (void)setIsCustomBack:(BOOL)isCustomBack{
      
      if (_isCustomBack != isCustomBack) {
            _isCustomBack = isCustomBack;
            
            //如果——isCustomBack == yes 我们就使用自定义初始化按钮
            if (_isCustomBack == YES) {
                  // 创建主题按钮
//                  UIButton *backButton = [ThemeControl createThemeButtonWithTitleImageName:nil bgImageName:@"titlebar_button_back_9.png" title:@"返回" frame:CGRectMake(0, 0, 60, 44)];

                UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
                backButton.titleLabel.text = @"返回";
                backButton.backgroundColor = [UIColor orangeColor];
//                [backButton setImage:[UIImage imageNamed:@"titlebar_button_back_9.png"] forState:UIControlStateNormal];
                  //设置字体大小
                  backButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
                  backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);

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

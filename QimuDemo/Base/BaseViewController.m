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
   UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
   titleLabel.font = [UIFont boldSystemFontOfSize:18];
   titleLabel.textAlignment = NSTextAlignmentCenter;
   titleLabel.text = title;;
   self.navigationItem.titleView = titleLabel;
}




#pragma mark - 使用左右设置按钮
- (void)setIsNavCtrlSetLeft:(BOOL)isNavCtrlSetLeft{
    _isNavCtrlSetLeft = isNavCtrlSetLeft;
    if (_isNavCtrlSetLeft) {
        // 创建左侧按钮
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.frame = CGRectMake(0, 0, 30, 30);
        [self.leftButton setImage:[UIImage imageNamed:@"home_icon_list"] forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
        
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:btn1, nil];
    }
}
- (void)setIsNavCtrlSetRight:(BOOL)isNavCtrlSetRight{
    _isNavCtrlSetRight = isNavCtrlSetRight;
    if (_isNavCtrlSetRight) {
        // 创建右侧按钮
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.frame = CGRectMake(0, 0, 30, 30);
        [self.rightButton setImage:[UIImage imageNamed:@"home_icon_list"] forState:UIControlStateNormal];
        [self.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
        
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn2, nil];
    }
}


//设置的左右按钮事件
- (void)leftButtonAction:(UIButton *)button
{
      // 显示左侧视图控制器
}

- (void)rightButtonAction:(UIButton *)button
{
      // 现实右侧视图控制器
}




#pragma mark - 使用自定义返回按钮
- (void)setIsCustomBack:(BOOL)isCustomBack{
      
      if (_isCustomBack != isCustomBack) {
            _isCustomBack = isCustomBack;
            
            //如果——isCustomBack == yes 我们就使用自定义初始化按钮
            if (_isCustomBack == YES) {
                  // 创建主题按钮
                UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
                backButton.backgroundColor = [UIColor clearColor];
                [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
                backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
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

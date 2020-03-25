//
//  BJBaseASViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/25.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJBaseASViewController.h"

@interface BJBaseASViewController ()

@end

@implementation BJBaseASViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

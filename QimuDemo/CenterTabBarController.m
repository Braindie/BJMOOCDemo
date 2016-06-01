//
//  CenterTabBarController.m
//  Weibo
//
//  Created by wxhl on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import "CenterTabBarController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "MoreViewController.h"

#import "AppDelegate.h"



@interface CenterTabBarController ()

@end

@implementation CenterTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      
      //初始化子视图控制器
      [self _initViews];
      
      //自定义标签栏
      [self _initCustomTabBarView];
      
      //创建多线程
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //创建定时器
            [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
            //保持多线程活跃状态
            [[NSRunLoop currentRunLoop] run];
      });
}

- (void)timeAction:(NSTimer *)timer{
      
      //如果首页由于网络问题没有实现数据就不需要实现未读消息提示了
      //获取首页所在的导航控制器对象
      BaseNavigationController *homeNavCtrl = [self.viewControllers firstObject];
      //获取首页视图控制器
      HomeViewController *homeVC = [homeNavCtrl.viewControllers firstObject];
      if (homeVC.dataList.count == 0) {
            return;
      }
      
      NSLog(@"------");
      
      //开始做网络请求
      if (_unReadCountService == nil) {
            //创建未读消息网络请求
            _unReadCountService = [[UnReadCountService alloc] initWithApiUrl:@"2/remind/unread_count.json"];
            _unReadCountService.httpMethod = @"GET";
      }
      //设置参数
      AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
      _unReadCountService.wb_token = appDelegate.wb_token;
      _unReadCountService.uid = [appDelegate.wb_userId longLongValue];
      //开始网络请求
      
      [_unReadCountService requestWeiboFinishBlock:^(id result) {
            // 获取当前用户的未读微博数
            int status = [result[@"status"] intValue];
            if (status >= 1) {
                  // 显示微博未读数视图
                  [self loadUnReadWeiboCountViewWithWeiboCount:status];
            } else {
                  // 隐藏微博未读数视图
                  _unReadCountView.hidden = YES;
            }
            
      } failureBlock:^(NSError *error) {
            
      }];
}

#pragma mark - 未读微博提示视图
- (void)loadUnReadWeiboCountViewWithWeiboCount:(NSInteger)count
{
      // 1.创建提示视图
      if (_unReadCountView == nil) {
            
            _unReadCountView = [ThemeControl creatThemeImageViewWithImageName:@"number_notify_9.png" frame:CGRectMake(kScreenWidth / 5 - 32, 0, 32, 32)];
            
            [_tabbarView addSubview:_unReadCountView];
            // 创建标题文本
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:_unReadCountView.bounds];
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:12];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.tag = 2015;
            [_unReadCountView addSubview:titleLabel];
      }
      
      // 2.设置文本的内容
      UILabel *titleLabel = (UILabel *)[_unReadCountView viewWithTag:2015];
      titleLabel.text = [NSString stringWithFormat:@"%ld",count];
      
      // 3.显示动画
      _unReadCountView.hidden = NO;
      
}



// 2.自定义标签栏
- (void)_initCustomTabBarView
{
      self.tabBar.hidden = YES;
      
      // 1.创建自定义标签栏
      _tabbarView = [ThemeControl creatThemeImageViewWithImageName:@"mask_navbar.png" frame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
      _tabbarView.backgroundColor = [UIColor clearColor];
      // 开启事件
      _tabbarView.userInteractionEnabled = YES;
      
      [self.view addSubview:_tabbarView];
      
      

      // 2.创建标签控制器的选项按钮
      NSArray *imageNames = @[@"home_tab_icon_1.png",
                              @"home_tab_icon_2.png",
                              @"home_tab_icon_3.png",
                              @"home_tab_icon_4.png",
                              @"home_tab_icon_5.png"];
      float itemWith = kScreenWidth / imageNames.count;
      for (int i = 0; i < imageNames.count; i++) {
            // 创建选项按钮
            UIButton *item = [ThemeControl createThemeButtonWithTitleImageName:imageNames[i] bgImageName:nil frame:CGRectMake(i * itemWith, 0, itemWith, 49)];
            // 设置tag
            item.tag = i;
      
            // 设置事件
            [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
            [_tabbarView addSubview:item];
      
            // 如果当前创建的是第一个选项按钮
            if (i == 0) {
                  // 创建选中按钮的背景图片
                  _selectedImageView = [ThemeControl creatThemeImageViewWithImageName:@"home_bottom_tab_arrow.png" frame:CGRectMake(0, 0, 64, 45)];
            
                  // 设置图片
                  [_tabbarView insertSubview:_selectedImageView atIndex:0];
                  // 设置选中按钮的位置
                  _selectedImageView.center = item.center;
      }
   }
}

// 初始化子视图控制器
- (void)_initViews
{
      // 1.创建首页视图控制器
      HomeViewController *homeVC = [[HomeViewController alloc] init];
      
      // 2.创建消息
      MessageViewController *messageVC = [[MessageViewController alloc] init];
      
      // 3.创建个人中心
      ProfileViewController *profileVC = [[ProfileViewController alloc] init];
      
      // 4.创建广场
      DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
      
      // 5.创建更多
      MoreViewController *moreVC = [[MoreViewController alloc] init];
      
      // 6.创建所有控制器集合的数组
      NSArray *viewCtrls = @[homeVC,messageVC,profileVC,discoverVC,moreVC];
      
      // 7.为每个视图控制器创建一个导航控制器
      NSMutableArray *baseNavs = [NSMutableArray array];
      for (UIViewController *viewCtrl in viewCtrls) {
            // 创建导航控制器
            BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:viewCtrl];
            baseNav.delegate = self;
            // 添加到数组中
            [baseNavs addObject:baseNav];
      }
      
      // 8.把所有的导航控制器给标签控制器
      self.viewControllers = baseNavs;
}

#pragma mark - 标签栏按钮事件
- (void)itemAction:(UIButton *)item{
      
      self.selectedIndex = item.tag;
      
      //设置选中背景视图跟随动画
      [UIView animateWithDuration:.35 animations:^{
            _selectedImageView.center = item.center;
      }];
}




#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
      if (navigationController.viewControllers.count == 1) {
            // 当前导航控制器的子视图控制器个数为1的时候显示标签栏
            self.tabbarView.hidden = NO;
      } else if (navigationController.viewControllers.count == 2) {
            // 当前导航控制器的子视图控制器个数为2的时候隐藏标签栏
            self.tabbarView.hidden = YES;
      }
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

//
//  CenterTabBarController.m
//  Demo
//
//  Created by zwj on 15-6-6.
//  Copyright (c) 2015年 Braindie. All rights reserved.
//

#import "CenterTabBarController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"
#import "SecondViewCtrl.h"
#import "ThirdViewCtroller.h"
#import "PatternViewController.h"
#import "FiveViewCtrl.h"
//#import "MessageViewController.h"
//#import "ProfileViewController.h"
//#import "DiscoverViewController.h"
//#import "MoreViewController.h"

#import "AppDelegate.h"



@interface CenterTabBarController ()

@end

@implementation CenterTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

      [self _initCustomTabBarView];
}


- (void)_initCustomTabBarView{
    //不加这句tabbar会跳
    self.tabBar.translucent = NO;

    
    UINavigationController *mainPage = [self controllerWithBarTitle:@"布局"
                                                        class:[HomeViewController class]
                                                normalImgName:@"wode1_1"
                                              selectedImgName:@"AccountYes"
                                                          tag:1001];
    
    UINavigationController *licai= [self controllerWithBarTitle: @"动画"
                                                          class:[SecondViewCtrl class]
                                                  normalImgName:@"wode1_1"
                                                selectedImgName:@"AccountYes"
                                                            tag:1002];
    
    
    UINavigationController *community=[self controllerWithBarTitle: @"网络"
                                                             class:[ThirdViewCtroller class]
                                                     normalImgName:@"wode1_1"
                                                   selectedImgName:@"AccountYes"
                                                               tag:1003];
    
    
    UINavigationController *wode =[self controllerWithBarTitle:@"架构"
                                                         class:[PatternViewController class]
                                                 normalImgName:@"wode1_1"
                                               selectedImgName:@"AccountYes"
                                                           tag:1004];
    
    UINavigationController *zhan =[self controllerWithBarTitle:@"功能"
                                                         class:[FiveViewCtrl class]
                                                 normalImgName:@"wode1_1"
                                               selectedImgName:@"AccountYes"
                                                           tag:1005];
    
    self.viewControllers=@[mainPage,licai,community,wode,zhan];
    
//    [self.tabBar setBackgroundColor:[UIColor orangeColor]];
    
}


-(UINavigationController *)controllerWithBarTitle:(NSString *)title
                                            class:(Class)_class
                                    normalImgName:(NSString *)normalName
                                  selectedImgName:(NSString *)selectedName
                                              tag:(NSInteger)tag{
    
    UIViewController *returnVC=[[_class alloc] init];
    BaseNavigationController *nav=[[BaseNavigationController alloc] initWithRootViewController:returnVC];

    UITabBarItem *item=nil;
    item= [[UITabBarItem alloc] initWithTitle:title
                                        image:[[UIImage imageNamed:normalName]
                                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                selectedImage:[[UIImage imageNamed:selectedName]
                                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item.tag=tag;
    [item setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    [nav setTabBarItem:item];
    
    return nav;
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

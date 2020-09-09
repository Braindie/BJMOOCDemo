//
//  QMTabBarController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/2/24.
//  Copyright © 2020 ll. All rights reserved.
//

#import "QMTabBarController.h"

#import "HomeViewController.h"
#import "SecondViewCtrl.h"
#import "ThirdViewCtroller.h"
#import "PatternViewController.h"
#import "FiveViewCtrl.h"

@interface QMTabBarController ()

@end

@implementation QMTabBarController

- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;
    UIOffset titlePositionAdjustment = UIOffsetMake(0, 0);
    CYLTabBarController *vc = [CYLTabBarController tabBarControllerWithViewControllers:[self viewControllers]
                                                         tabBarItemsAttributes:[self tabBarItemsAttributesForController]
                                                               imageInsets:imageInsets
                                                       titlePositionAdjustment:titlePositionAdjustment
                                                                    context:nil];
    // 自定义选中字体的文字颜色
    [self coustomTabBarAppearance];
    self.navigationController.navigationBar.hidden = YES;
    return (self = (QMTabBarController *)vc);
}

- (NSArray *)viewControllers {
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UIViewController *navVC1 = [[CYLBaseNavigationController alloc] initWithRootViewController:vc1];
    [vc1 cyl_setHideNavigationBarSeparator:YES];
    
    SecondViewCtrl *vc2 = [[SecondViewCtrl alloc] init];
    UIViewController *navVC2 = [[CYLBaseNavigationController alloc] initWithRootViewController:vc2];
    [vc2 cyl_setHideNavigationBarSeparator:YES];
    
    ThirdViewCtroller *vc3 = [[ThirdViewCtroller alloc] init];
    UIViewController *navVC3 = [[CYLBaseNavigationController alloc] initWithRootViewController:vc3];
    [vc3 cyl_setHideNavigationBarSeparator:YES];
    
    PatternViewController *vc4 = [[PatternViewController alloc] init];
    UIViewController *navVC4 = [[CYLBaseNavigationController alloc] initWithRootViewController:vc4];
    [vc4 cyl_setHideNavigationBarSeparator:YES];
    
    FiveViewCtrl *vc5 = [[FiveViewCtrl alloc] init];
    UIViewController *navVC5 = [[CYLBaseNavigationController alloc] initWithRootViewController:vc5];
    [vc5 cyl_setHideNavigationBarSeparator:YES];
    
    NSArray *vcs = @[navVC1, navVC2, navVC3, navVC4, navVC5];
    return vcs;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *itemDic1 = @{
                               CYLTabBarItemTitle : @"Layout",
                               CYLTabBarItemImage : @"accountNormal",
                               CYLTabBarItemSelectedImage : @"accountSelect"
                               };
    
    NSDictionary *itemDic2 = @{
                               CYLTabBarItemTitle : @"Draw",
                               CYLTabBarItemImage : @"accountNormal",
                               CYLTabBarItemSelectedImage : @"accountSelect"
                               };
    
    NSDictionary *itemDic3 = @{
                               CYLTabBarItemTitle : @"Data",
                               CYLTabBarItemImage : @"accountNormal",
                               CYLTabBarItemSelectedImage : @"accountSelect"
                               };
    
    NSDictionary *itemDic4 = @{
                               CYLTabBarItemTitle : @"Frame",
                               CYLTabBarItemImage : @"accountNormal",
                               CYLTabBarItemSelectedImage : @"accountSelect"
                               };
    
    NSDictionary *itemDic5 = @{
                               CYLTabBarItemTitle : @"Func",
                               CYLTabBarItemImage : @"accountNormal",
                               CYLTabBarItemSelectedImage : @"accountSelect"
                               };
    
    NSArray *items = @[itemDic1, itemDic2, itemDic3, itemDic4, itemDic5];
    return items;
}

- (void)coustomTabBarAppearance {
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:151.f/255.f green:151.f/255.f blue:151.f/255.f alpha:1.f];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:208.f/255.f green:89.f/255.f blue:90.f/255.f alpha:1.f];
    
    UITabBarItem *tabbar = [UITabBarItem appearance];
    [tabbar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabbar setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end

//
//  BJSelectVCManager.m
//  QimuDemo
//
//  Created by 张文军 on 2019/12/13.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJSelectVCManager.h"

@implementation BJSelectVCManager

+ (void)showVC:(UIViewController *)vc {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFromeRootViewController:rootViewController];
    [currentVC.navigationController pushViewController:vc animated:YES];
    
}

// 递归：获取当前控制器
+ (UIViewController *)getCurrentVCFromeRootViewController:(UIViewController *)rootVC {
    UIViewController *currentVC = nil;

    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFromeRootViewController:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        currentVC = [self getCurrentVCFromeRootViewController:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

@end

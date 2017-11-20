//
//  AppDelegate.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/2.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterTabBarController.h"
//#import "GuideViewController.h"

#define kname @"12345"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //这是一段无效的话，我要验证git是否改变

    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor blackColor];
    [_window makeKeyAndVisible];


      NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/isFirst.plist"];

      NSDictionary *isFirstdic = [NSDictionary dictionaryWithContentsOfFile:filePath];
      BOOL isFirst = [[isFirstdic objectForKey:@"isFirst"] boolValue];
    
    self.window.rootViewController = [[CenterTabBarController alloc] init];

//      if (!isFirst) {
//
//            self.window.rootViewController = [[GuideViewController alloc] init];
//      }else{
//
//            self.window.rootViewController = [[CenterTabBarController alloc] init];
//      }

        NSDictionary *dic = @{@"isFirst":@YES};
      [dic writeToFile:filePath atomically:YES];



//    //4.创建菜单视图控制器
//    CenterTabBarController *menuVC = [[CenterTabBarController alloc] init];
//    self.window.rootViewController = menuVC;











    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

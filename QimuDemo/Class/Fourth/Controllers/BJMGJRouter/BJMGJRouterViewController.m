//
//  BJMGJRouterViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2019/12/13.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJMGJRouterViewController.h"

@implementation BJMGJRouterViewController

+ (void)load {
    [MGJRouter registerURLPattern:@"bj://router" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"%@", routerParameters);
        BJMGJRouterViewController *vc = [[BJMGJRouterViewController alloc] init];
        [BJSelectVCManager showVC:vc];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"MGJRouter";
}

@end

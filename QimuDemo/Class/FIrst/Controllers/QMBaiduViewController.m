//
//  QMBaiduViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2017/12/27.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "QMBaiduViewController.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@interface QMBaiduViewController ()

@end

@implementation QMBaiduViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"百度鹰眼";
    self.view.backgroundColor = [UIColor whiteColor];
    
    BTKServiceOption *sop = [[BTKServiceOption alloc] initWithAK:@"asdf1234asdf1234" mcode:@"com.yingyan.sdk" serviceID:100000 keepAlive:false];
    [[BTKAction sharedInstance] initInfo:sop];

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

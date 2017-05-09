//
//  FirstDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "BunnyCollectionView.h"

@interface FirstDetailViewController ()

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isNavCtrlSet = YES;
    
    self.navigationItem.title = @"详情";
    
    
    
    BunnyCollectionView *view = [[BunnyCollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 500)];
    [self.view addSubview:view];
    
    
    
    
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

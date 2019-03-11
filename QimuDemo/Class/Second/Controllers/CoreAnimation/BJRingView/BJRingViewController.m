//
//  BJRingViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJRingViewController.h"
#import "BJRingtLoadingView.h"

@interface BJRingViewController ()
@property (nonatomic, strong) BJRingtLoadingView *loadingView;

@end

@implementation BJRingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"圆环";
    self.isCustomBack = YES;
    
    
    //转场动画（layer实现）
    _loadingView = [[BJRingtLoadingView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    _loadingView.center = self.view.center;
    [self.view addSubview:_loadingView];

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

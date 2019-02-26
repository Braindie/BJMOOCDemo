//
//  FourthViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "FourthViewCtrl.h"
#import "FourthVM.h"

@interface FourthViewCtrl()

@property (nonatomic, strong) UITableView *fourthTableView;

@property (nonatomic, strong) FourthVM *viewModel;

@end

@implementation FourthViewCtrl

#pragma mark - lifeCycle
- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    self.navigationItem.title = @"MVVM";
    
    //创建视图
    [self.view addSubview:self.fourthTableView];

    

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.viewModel requestDataComplete:^(BOOL success) {
        if (success) {
            [hud hideAnimated:YES];
            [self.fourthTableView reloadData];
        }
    }];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - lazy
- (UITableView *)fourthTableView{
    if (!_fourthTableView) {
        _fourthTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _fourthTableView.delegate = self.viewModel;
        _fourthTableView.dataSource = self.viewModel;
        _fourthTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_fourthTableView registerClass:NSClassFromString(@"FourthCell") forCellReuseIdentifier:@"FourthCell"];
    }
    return _fourthTableView;
}

//在VM中处理数据，数据处理后给View
- (FourthVM *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FourthVM alloc] init];
    }
    return _viewModel;
}






@end

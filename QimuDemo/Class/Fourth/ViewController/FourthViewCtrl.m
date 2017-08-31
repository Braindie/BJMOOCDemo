//
//  FourthViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "FourthViewCtrl.h"
#import "FourthVM.h"
#import "FourthSevice.h"

@interface FourthViewCtrl()

@property (nonatomic, strong) UITableView *fourthTableView;

/**
 *   数据处理VM
 */
@property (nonatomic, strong) FourthVM *viewModel;
/**
 *   界面分流VM
 */
@property (nonatomic, strong) FourthSevice *serivce;
@end

@implementation FourthViewCtrl


- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    self.navigationItem.title = @"MVVM";
    

    //创建视图
    [self.view addSubview:self.fourthTableView];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (UITableView *)fourthTableView{
    if (!_fourthTableView) {
        _fourthTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _fourthTableView.delegate = self.serivce;
        _fourthTableView.dataSource = self.serivce;
        _fourthTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_fourthTableView registerClass:NSClassFromString(@"FourthCell") forCellReuseIdentifier:@"FourthCell"];
    }
    return _fourthTableView;
}

//自定义初始化方法，在VM中处理数据，数据处理后给View
- (FourthVM *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FourthVM alloc] initWithName:@"Braindie" price:@"15" discount:@"no"];
    }
    return _viewModel;
}

//tableView的代理给了另一个VM
- (FourthSevice *)serivce{
    if (!_serivce) {
        _serivce = [[FourthSevice alloc] init];
        _serivce.viewModel = self.viewModel;
    }
    return _serivce;
}



@end

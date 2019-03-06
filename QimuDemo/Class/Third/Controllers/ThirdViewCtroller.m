//
//  ThirdViewCtroller.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdViewCtroller.h"

#import "BJNetworkViewController.h"
#import "BJDataEncryptionViewController.h"

@interface ThirdViewCtroller ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *thirdTableView;
@end

@implementation ThirdViewCtroller



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSetLeft = NO;
    self.isNavCtrlSetRight = NO;
    self.isCustomBack = YES;
    self.navigationItem.title = @"网络与数据";

    //创建视图
    self.thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"AFN与NSURLSession";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"数据持久化";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"数据解析";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"数据加密";
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BJNetworkViewController *vc = [[BJNetworkViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){

    }else if (indexPath.row == 2){

    }else if (indexPath.row == 3){
        BJDataEncryptionViewController *vc = [[BJDataEncryptionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end

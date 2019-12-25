//
//  FiveViewCtrl.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/7/4.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FiveViewCtrl.h"

#import "FiveDetailViewController.h"
#import "FirstTableViewController.h"
#import "BJPictureSelectedViewController.h"
#import "BJTestMemoryLeakViewController.h"


@interface FiveViewCtrl ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FiveViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.isNavCtrlSetLeft = YES;
    self.isNavCtrlSetRight = NO;
    self.navigationItem.title = @"功能";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
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
        cell.textLabel.text = @"获取通讯录";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"图片选择器";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"蓝牙";
    }else if (indexPath.row == 3) {
        cell.textLabel.text = @"检测内存泄漏";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FiveDetailViewController *vc = [[FiveDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        BJPictureSelectedViewController *vc = [[BJPictureSelectedViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        FirstTableViewController *vc = [[FirstTableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3) {
        BJTestMemoryLeakViewController *vc = [[BJTestMemoryLeakViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

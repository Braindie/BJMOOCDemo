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
#import "BJFMDBViewController.h"
#import "BJImageLoadViewController.h"
#import "BJTableViewHeightViewController.h"
#import "BJDataAnalysisViewController.h"

@interface ThirdViewCtroller ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *thirdTableView;
@end

@implementation ThirdViewCtroller

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSetLeft = NO;
    self.isNavCtrlSetRight = NO;
    self.navigationItem.title = @"网络与数据";

    //创建视图
    self.thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 2;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"AFN与NSURLSession";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"图片加载、渲染";
        }
    } else if(indexPath.section == 1) {
        if (indexPath.row == 0){
            cell.textLabel.text = @"数据持久化（FMDB）";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"UITableView 缓存高度";
        }
    } else if(indexPath.section == 2) {
        if (indexPath.row == 0){
            cell.textLabel.text = @"数据加密";
        }
    } else if(indexPath.section == 3) {
        if (indexPath.row == 0){
            cell.textLabel.text = @"数据解析";
        }
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            BJNetworkViewController *vc = [[BJNetworkViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            BJImageLoadViewController *vc = [[BJImageLoadViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    } else if(indexPath.section == 1) {
        if (indexPath.row == 0){
            BJFMDBViewController *vc = [[BJFMDBViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            BJTableViewHeightViewController *vc = [[BJTableViewHeightViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            BJDataEncryptionViewController *vc = [[BJDataEncryptionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }

    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            BJDataAnalysisViewController *vc = [[BJDataAnalysisViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


@end

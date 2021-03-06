//
//  PatternViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import "PatternViewController.h"
#import "FourthViewCtrl.h"
#import "MVPViewController.h"
#import "BJMGJRouterViewController.h"

@interface PatternViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *myDataArr;

@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation PatternViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isNavCtrlSetLeft = NO;
    self.isNavCtrlSetRight = NO;
    self.navigationItem.title = @"Frame";
    
    //创建视图
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"MVP";
    } else if (indexPath.row == 1){
        cell.textLabel.text = @"MVVM";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"MGJRouter";
    } else {
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MVPViewController *vc = [[MVPViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        FourthViewCtrl *vc = [[FourthViewCtrl alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2) {
        [MGJRouter openURL:@"bj://router"];
    }
}



@end

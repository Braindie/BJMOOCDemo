//
//  FirstRightDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/21.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "FirstRightDetailViewController.h"
#import "BJBarChartViewController.h"
#import "BJLineChartViewController.h"
#import "BJImageViewController.h"

@interface FirstRightDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FirstRightDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CoreGraphics";
    self.isCustomBack = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建视图
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"柱状图";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"折线图/平滑折线图";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"绘制圆角";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        BJBarChartViewController *vc = [[BJBarChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        BJLineChartViewController *vc = [[BJLineChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        
        BJImageViewController *vc = [[BJImageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end

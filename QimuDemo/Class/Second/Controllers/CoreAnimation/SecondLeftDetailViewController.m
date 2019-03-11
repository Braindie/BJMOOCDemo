//
//  SecondLeftDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/9.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "SecondLeftDetailViewController.h"
#import "BJWaveViewController.h"
#import "BJRingViewController.h"
#import "BJButtonViewController.h"
#import "BJLabelViewController.h"

@interface SecondLeftDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondLeftDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CoreAnimation（QuartzCore）";
    self.isCustomBack = YES;
    
    
    //创建视图
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


- (void)dealloc
{
    NSLog(@"销毁了");
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"波浪图";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"圆环";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"按钮";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"label";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        BJWaveViewController *vc = [[BJWaveViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        BJRingViewController *vc = [[BJRingViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }else if (indexPath.row == 2){
        
        BJButtonViewController *vc = [[BJButtonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        
        BJLabelViewController *vc = [[BJLabelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end

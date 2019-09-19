//
//  BJViewAnimationViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/9/19.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJViewAnimationViewController.h"
#import "SecondListViewController.h"
#import "MyTableViewCell.h"

@interface BJViewAnimationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArr1;

@end

@implementation BJViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isCustomBack = YES;
    self.navigationItem.title = @"UIViewAnimation属性动画";
//    self.isNavCtrlSetLeft = YES;
//    self.isNavCtrlSetRight = YES;
    
    NSArray *dataArr1 = [NSArray arrayWithObjects:
                         @"大小动画（改变frame）",
                         @"拉伸动画（改变bounds）",
                         @"转移动画（改变center）",
                         @"旋转动画（改变transform）,(anchorPoint和position）",
                         @"透明度动画（改变alpha）",
                         @"Keyframe",
                         @"Spring",
                         @"Transition",
                         nil];
    self.dataArr1 = [NSMutableArray arrayWithArray:dataArr1];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    SecondListViewController *vc = [[SecondListViewController alloc] init];
    if (indexPath.row == 0) {
        vc.animationType = @"大小动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        vc.animationType = @"拉伸动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        vc.animationType = @"转移动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        vc.animationType = @"旋转动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 4){
        vc.animationType = @"透明度动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 5){
        vc.animationType = @"Keyframe";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 6){
        vc.animationType = @"Spring";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 7){
        vc.animationType = @"Transition";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifer = @"cellIdentefer";
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    cell.label.text = self.dataArr1[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end

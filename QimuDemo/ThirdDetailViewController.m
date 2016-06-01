//
//  ThirdDetailViewController.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdDetailViewController.h"
#import "ThirdDetailCell.h"
#import "CommentViewCtrl.h"
#import "IntroduceViewCtrl.h"

static NSString *cellId = @"thirdCell";
@implementation ThirdDetailViewController

- (void)viewDidLoad{

    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor grayColor];
//    self.isCustomBack = YES;
    self.isNavCtrlSet = YES;
    self.title = @"课程详情";
    self.navigationController.navigationBarHidden = YES;
    [self loadData];
    [self addView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.isNavCtrlSet = YES;
    self.title = @"课程详情";
    self.navigationController.navigationBarHidden = YES;
}

- (void)loadData{


    NSMutableDictionary * dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"手机移动学堂测试课件",@"title",
                                  @"文件",@"cellType",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"第一集 琅琊榜",@"title",
                                  @"C",@"cellType",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"第二集 琅琊榜",@"title",
                                  @"C",@"cellType",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];

//    NSMutableDictionary *courseDic = [NSMutableDictionary dictionaryWithCapacity:16];
//    [courseDic setValue:@"123456" forKey:@"courseId"];
//    [courseDic setValue:@"我的标准课件" forKey:@"title"];
//    [courseDic setValue:@"文件" forKey:@"cellType"];
//    self.myDataDic = [NSDictionary dictionaryWithDictionary:courseDic];
    self.myDataArr = [NSArray arrayWithObjects:dic1,dic2,dic3, nil];
}

- (void)addView{

    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    [self.view addSubview:self.detailTableView];

    self.headerView = [[ThirdHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.headerView.backgroundColor = [UIColor orangeColor];
    self.headerView.delegate = self;
//    [self.headerView addView];
    self.detailTableView.tableHeaderView = self.headerView;

    _footView = [[ThirdFootView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    _footView.backDelegate = self;
    _footView.backgroundColor = [UIColor grayColor];
//    [_footView addView];
    [self.view addSubview:_footView];

}

//返回代理方法
- (void)backUp{

    [self.navigationController popViewControllerAnimated:NO];
}

//评论代理方法
- (void)commentAction{
    CommentViewCtrl *commentViewCtrl = [[CommentViewCtrl alloc] init];
    [self.navigationController pushViewController:commentViewCtrl animated:NO];

}

//简介代理方法
- (void)openOtherViewCtrl{

    IntroduceViewCtrl *introduceViewCtrl = [[IntroduceViewCtrl alloc] init];
    [self.navigationController pushViewController:introduceViewCtrl animated:NO];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.myDataArr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    NSDictionary *dic = [self.myDataArr objectAtIndex:indexPath.row];

    ThirdDetailCell *cell = [self.detailTableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ThirdDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    cell.CellType = [dic objectForKey:@"cellType"];



    if ([cell.CellType isEqualToString:@"文件"]) {
        cell.stateImage.image  = [UIImage imageNamed:@"menu.png"];
        cell.folderTitleLabel.text = [dic objectForKey:@"title"];
        cell.backgroundColor = [UIColor lightGrayColor];
    }else{
        cell.stateImage.image = [UIImage imageNamed:@"over_play.png"];
        cell.titleLabel.text = [dic objectForKey:@"title"];
        cell.folderTitleLabel.text = [dic objectForKey:@"title"];
        cell.folderTitleLabel.font = [UIFont systemFontOfSize:14];
        cell.backgroundColor = [UIColor whiteColor];
    }

    [cell UpdateRtLabel];

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end

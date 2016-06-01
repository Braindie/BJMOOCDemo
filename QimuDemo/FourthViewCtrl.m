//
//  FourthViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "FourthViewCtrl.h"
#import "FourthCell.h"
#import "MyCourseDetailController.h"

static NSString *identifer = @"tableViewCell";


@implementation FourthViewCtrl



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    self.isNavCtrlSet = YES;

    self.title = @"学习";

    //    //加载数据
    [self loadTopData];


    //    //创建视图
    [self creatView];


}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)loadTopData{

    NSMutableDictionary * dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"移动课件1",@"title",
                                  @"name1",@"标准课件1",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"移动课件2",@"title",
                                  @"name1",@"标准课件1",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"移动课件3",@"title",
                                  @"name1",@"标准课件1",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"移动课件4",@"title",
                                  @"name1",@"标准课件1",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];

    NSMutableDictionary *courseDic = [NSMutableDictionary dictionaryWithCapacity:16];
    [courseDic setValue:@"123456" forKey:@"courseId"];
    [courseDic setValue:@"我的标准课件" forKey:@"title"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"decribe"] forKey:@"decribe"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"cobject"] forKey:@"cobject"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"target"] forKey:@"ctarget"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"cnum"] forKey:@"cNum"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"parentRcoId"] forKey:@"tbcId"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"classroomid"] forKey:@"classroomid"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"period"] forKey:@"period"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"level"] forKey:@"level"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"sortName"] forKey:@"sortName"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"stime"] forKey:@"stime"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"etime"] forKey:@"etime"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"dateStr"] forKey:@"dateStr"];
    //    [courseDic setValue:[self.curCourseDic objectForKey:@"ltimes"] forKey:@"hits"];
    //    [courseDic setValue:@"0" forKey:@"size"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"learningState"] forKey:@"learningState"];
    //    [courseDic setValue:[self.myDetailDic objectForKey:@"learnedPeriod"] forKey:@"learnedPeriod"];

    NSArray *arr = [NSArray arrayWithObjects:@"全部移动",@"河南移动",@"河北移动",@"湖南移动",@"湖北移动",@"北京移动",@"天津移动",@"上海移动",@"广州移动",@"深圳移动", nil];
    //    self.myDataArr = [NSMutableArray arrayWithObjects:courseDic,dic1,dic2,dic3,dic4,nil];
    self.myDataArr = [NSMutableArray arrayWithArray:arr];
}

- (void)creatView{

    self.fourthTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.fourthTableView.delegate = self;
    self.fourthTableView.dataSource = self;
    [self.view addSubview:self.fourthTableView];

}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FourthCell *cell = [self.fourthTableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[FourthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    //    cell.label.text = [self.myDataArr[indexPath.row] objectForKey:@"title"];
    //    cell.backgroundColor = [UIColor orangeColor];

    cell.label.text = self.myDataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    MyCourseDetailController *myCourseDetailViewCtrl = [[MyCourseDetailController alloc] init];
    [self.navigationController pushViewController:myCourseDetailViewCtrl animated:NO];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end

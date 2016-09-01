//
//  MyCourseDetailController.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCourseDetailController.h"
#import "MyCourseHeaderView.h"
#import "MyCourseMiddleView.h"
#import "MyCommentCell.h"
#import "MyCourseListCell.h"

#import "MyCommentViewController.h"


static NSString *identifer = @"myCommentCell";
static NSString *identiferCell = @"myCourseCell";

static NSString *identiferView = @"myCommentView";

@implementation MyCourseDetailController


- (void)viewDidLoad{

    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor grayColor];
    //    self.isCustomBack = YES;
//    self.isNavCtrlSet = YES;
    self.title = @"课程详情";
//    self.navigationController.navigationBarHidden = YES;
    [self loadData];
    [self addView];
}

//- (void)viewWillAppear:(BOOL)animated{
//    self.isNavCtrlSet = YES;
//    self.title = @"课程详情";
//    self.navigationController.navigationBarHidden = YES;
//}

- (void)loadData{


    NSMutableDictionary * dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"目录",@"title",
                                  @"文件",@"cellType",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"基于终端能力的产品创新 上集",@"title",
                                  @"C",@"cellType",
                                  @"name2",@"标准课件2",
                                  @"name3",@"标准课件3",
                                  @"name4",@"标准课件4",
                                  @"name5",@"标准课件5",
                                  @"name6",@"标准课件6",nil];
    NSMutableDictionary * dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"基于终端能力的产品创新 下集",@"title",
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

    NSMutableDictionary * dic01 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"天下霸唱",@"name",
                                  @"只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1",@"content",
                                  @"2015-10-1",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"3",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic02 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"秦时明月",@"name",
                                  @"只是一段测试语句22",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic03 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"赵大头",@"name",
                                  @"只是一段测试语句333",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"钱2",@"name",
                                  @"只是一段测试语句4444",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"孙5",@"name",
                                  @"只是一段测试语句55555",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    self.myCommentArr = [NSArray arrayWithObjects:dic01,dic02,dic03,dic4,dic5, nil];

}

- (void)addView{

    MyCourseHeaderView *myCourseHeaderView = [[MyCourseHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 350)];
    myCourseHeaderView.backgroundColor = [UIColor whiteColor];


    self.myDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.myDetailTableView.delegate = self;
    self.myDetailTableView.dataSource = self;
    [self.view addSubview:self.myDetailTableView];

    self.myDetailTableView.tableHeaderView = myCourseHeaderView;
    self.myDetailTableView.sectionHeaderHeight = 100;
    self.myDetailTableView.sectionFooterHeight = 0;




}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return self.myDataArr.count;
    }else if (section == 1){
        return self.myCommentArr.count;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {

        MyCourseListCell *courseListCell = [self.myDetailTableView dequeueReusableCellWithIdentifier:identiferCell];
        if (courseListCell == nil) {
            courseListCell = [[MyCourseListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiferCell];
        }

        NSDictionary *dic = [self.myDataArr objectAtIndex:indexPath.row];
        NSLog(@"第一组%ld",indexPath.row);

        courseListCell.CellType = [dic objectForKey:@"cellType"];

        if ([courseListCell.CellType isEqualToString:@"文件"]) {
            courseListCell.stateImage.image  = [UIImage imageNamed:@"menu.png"];
            courseListCell.folderTitleLabel.text = [dic objectForKey:@"title"];
            courseListCell.backgroundColor = [UIColor whiteColor];

        }else{
            courseListCell.stateImage.image = [UIImage imageNamed:@"over_play.png"];
            courseListCell.titleLabel.text = [dic objectForKey:@"title"];
            courseListCell.folderTitleLabel.text = [dic objectForKey:@"title"];
            courseListCell.folderTitleLabel.font = [UIFont systemFontOfSize:14];
            courseListCell.backgroundColor = [UIColor whiteColor];
        }

        [courseListCell UpdateRtLabel];
        return courseListCell;

    }else if (indexPath.section == 1){

        MyCommentCell *myCommentCell = [self.myDetailTableView dequeueReusableCellWithIdentifier:identifer];
        if (myCommentCell == nil) {
            myCommentCell = [[MyCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }

        NSDictionary *dic = [self.myCommentArr objectAtIndex:indexPath.row];
        NSLog(@"第二组%ld",indexPath.row);

        //名字
        myCommentCell.nameLabel.text = [dic objectForKey:@"name"];
        //内容
        myCommentCell.contentLabel.text = [dic objectForKey:@"content"];
        myCommentCell.contentLabel.numberOfLines = 0;
        CGSize size = [myCommentCell.contentLabel.text sizeWithFont:myCommentCell.contentLabel.font constrainedToSize:CGSizeMake(self.view.frame.size.width-60, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        myCommentCell.contentLabel.frame = CGRectMake(30, 50, size.width, size.height);
        //赞
        NSString *SupportStr=[NSString stringWithFormat:@"赞(%@)",[dic objectForKey:@"supportSum"]];
        [myCommentCell.supportSumBtn setTitle:SupportStr forState:UIControlStateNormal];
        myCommentCell.supportSumBtn.frame = CGRectMake(20, 60+size.height, 100, 30);

        //日期
        myCommentCell.dataLabel.text = [dic objectForKey:@"createDateStr"];
        myCommentCell.dataLabel.frame = CGRectMake(self.view.frame.size.width-100, 62+size.height, 90, 30);

        myCommentCell.lineImage.frame = CGRectMake(20, 94+size.height, self.view.frame.size.width - 20, 1);

        return myCommentCell;

    }else{
        
        return nil;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 50;

    }else if(indexPath.section == 1){
        NSDictionary *dic = [self.myCommentArr objectAtIndex:indexPath.row];
        NSString *contentString = [dic objectForKey:@"content"];

        CGSize size = [contentString sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(self.view.frame.size.width-60, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];

        return 95 + size.height;

    }else{
        return 50;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 150;
//}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    MyCourseMiddleView *middleView = [[MyCourseMiddleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    middleView.delegate = self;
    middleView.backgroundColor = [UIColor whiteColor];
    return middleView;
}
- (void)presentCommentView{

    MyCommentViewController *myCommentVC = [[MyCommentViewController alloc] init];
    [self presentViewController:myCommentVC animated:YES completion:nil];
}

@end

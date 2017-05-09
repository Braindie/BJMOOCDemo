//
//  ThirdViewCtroller.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdViewCtroller.h"
#import "ThirdCell.h"
#import "ThirdDetailViewController.h"

#import "KxMovieViewController.h"

#import "AFHTTPSessionManager.h"


static NSString *identifer = @"tableViewCell";

@implementation ThirdViewCtroller



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    self.isNavCtrlSet = YES;

    self.navigationItem.title = @"直播";


    //    //加载数据
    [self loadTopData];
    
    static AFHTTPSessionManager *manager = nil;
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    manager.requestSerializer.timeoutInterval = 25 ;

    NSDictionary *ps = @{@"uid": @(133825214),
                        @"interest": @(1)
                        };
//    NSURLSessionDataTask * dataTask = [manager POST:@"http://116.211.167.106/api/live/aggregation?"
//                                         parameters:ps
//                                           progress:nil
//                                            success:^(NSURLSessionTask *task, id responseObject) {
//                                                
//                                                NSInteger statusCode = ((NSHTTPURLResponse *)task.response).statusCode ;
//                                                
//                                                NSLog(@"success，statusCode: %ld", (long)statusCode );
//                                 
//                                            }
//                                            failure:^(NSURLSessionTask *task, NSError *error) {
//                                                
//                                                NSInteger statusCode = ((NSHTTPURLResponse *)task.response).statusCode ;
//                                                NSLog(@"success，statusCode: %ld", (long)statusCode );
//                                     
//                                            }] ;
    
//    [manager GET:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
    

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
    
    NSURL *URL = [NSURL URLWithString:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [manager GET:URL.absoluteString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
    
    

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

    NSArray *arr = [NSArray arrayWithObjects:@"映客直播",@"虎牙直播",@"YY直播",@"斗鱼直播",@"熊猫直播",@"龙珠直播",@"大王直播",@"上海",@"广州",@"深圳", nil];
//    self.myDataArr = [NSMutableArray arrayWithObjects:courseDic,dic1,dic2,dic3,dic4,nil];
    self.myDataArr = [NSMutableArray arrayWithArray:arr];
}

- (void)creatView{

    self.thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ThirdCell *cell = [self.thirdTableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[ThirdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
//    cell.label.text = [self.myDataArr[indexPath.row] objectForKey:@"title"];
//    cell.backgroundColor = [UIColor orangeColor];

    cell.label.text = self.myDataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    ThirdDetailViewController *thirdDetailViewCtrl = [[ThirdDetailViewController alloc] init];
//    thirdDetailViewCtrl.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:thirdDetailViewCtrl animated:NO];
    
    
    KxMovieViewController *vc = [KxMovieViewController movieViewControllerWithContentPath:@"http://pull3.a8.com/live/1493695600453022.flv" parameters:nil];
    [self presentViewController:vc animated:YES completion:nil];
//    http://pull99.a8.com/live/1493629218418259.flv
//    http://pull.a8.com/live/1493627977729613.flv
//    江苏卫视
//    http://14.18.17.141:9009/live/chid=23
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


@end

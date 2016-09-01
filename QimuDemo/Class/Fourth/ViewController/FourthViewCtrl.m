//
//  FourthViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "FourthViewCtrl.h"
#import "FourthVM.h"
#import "FourthSevice.h"

@interface FourthViewCtrl()

@property (nonatomic, strong) UITableView *fourthTableView;

@property (nonatomic, strong) FourthVM *viewModel;
@property (nonatomic, strong) FourthSevice *serivce;
@end

@implementation FourthViewCtrl



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

//    self.isNavCtrlSet = YES;

    self.title = @"学习";
    
    //创建视图
    [self.view addSubview:self.fourthTableView];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
//    [self.viewModel getData];
}

- (UITableView *)fourthTableView{
    if (!_fourthTableView) {
        _fourthTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _fourthTableView.delegate = self.serivce;
        _fourthTableView.dataSource = self.serivce;
        [_fourthTableView registerClass:NSClassFromString(@"FourthCell") forCellReuseIdentifier:@"FourthCell"];
        _fourthTableView.backgroundColor = [UIColor redColor];
    }
    return _fourthTableView;
}

- (FourthVM *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FourthVM alloc] init];
    }
    return _viewModel;
}


- (FourthSevice *)serivce{
    if (!_serivce) {
        _serivce = [[FourthSevice alloc] init];
//        _serivce.fourthVC = self;
        _serivce.viewModel = self.viewModel;
    }
    return _serivce;
}










- (void)loadTopData{


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

//    NSArray *arr = [NSArray arrayWithObjects:@"全部移动",@"河南移动",@"河北移动",@"湖南移动",@"湖北移动",@"北京移动",@"天津移动",@"上海移动",@"广州移动",@"深圳移动", nil];
    //    self.myDataArr = [NSMutableArray arrayWithObjects:courseDic,dic1,dic2,dic3,dic4,nil];
//    self.myDataArr = [NSMutableArray arrayWithArray:arr];
}


@end

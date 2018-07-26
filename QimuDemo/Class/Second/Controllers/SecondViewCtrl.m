//
//  SecondViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "SecondViewCtrl.h"
#import "MyTableViewCell.h"

#import "SGWCustomBlockAlertManager.h"
#import "SGWBlockAlertManager.h"
#import "UILabel+StringFrame.h"
#import "HxToastView.h"
#import "FirstRightDetailViewController.h"
#import "SecondLeftDetailViewController.h"

#import "BJRefresh.h"
#import "UIColor+BJColor.h"

@implementation SecondViewCtrl



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSetLeft = YES;
    self.isNavCtrlSetRight = YES;

    self.navigationItem.title = @"视频";

//    //加载数据
    [self loadTopData];

//    //创建视图
    [self creatView];

}

- (void)leftButtonAction:(UIButton *)button{
    SecondLeftDetailViewController *vc = [[SecondLeftDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightButtonAction:(UIButton *)button{
    FirstRightDetailViewController *vc = [[FirstRightDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)loadTopData{

    NSArray *dataArr1 = [NSArray arrayWithObjects:@"SGWCustomBlockAlertManager.h",@"SGWBlockAlertManager.h",@"UILabel+StringFrame.h",@"HxToastView.h",@"data5",@"data6",@"data7",@"data8",@"data9", nil];

    NSArray *arr10 = [NSArray arrayWithObjects:@"最新",@"最热",nil];
    NSArray *arr11 = [NSArray arrayWithObjects:@"全部",@"河南",@"河北",@"湖南",@"湖北",@"北京",@"天津",@"上海",@"广州",@"深圳", nil];
    NSArray *arr12 = [NSArray arrayWithObjects:@"全部",@"动作",@"冒险",@"喜剧",@"爱情",@"战争",@"恐怖",@"科幻",@"悬疑", nil];


    NSArray *arr13 = [NSArray arrayWithObjects:@"全部",@"琅琊榜",@"伪装者",@"夏洛特烦恼",@"钛",@"子弹",@"灭绝",@"蚁人", nil];
    NSArray *arr14 = [NSArray arrayWithObjects:@"全部",@"电影1",@"电影2",@"电影3",@"电影4",@"电影5",@"电影6",@"电影7", nil];


    self.dataArr1 = [NSMutableArray arrayWithArray:dataArr1];

    self.dataArr0 = [NSMutableArray arrayWithArray:arr10];
    self.dataArr2 = [NSMutableArray arrayWithArray:arr11];
    self.dataArr3 = [NSMutableArray arrayWithArray:arr12];
    self.dataArr4 = [NSMutableArray arrayWithObjects:arr13,arr14, nil];


}


- (void)creatView{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.backgroundColor = [UIColor myColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.bj_header = [BJRefreshGifStateHeader headerWithRefreshingBlock:^{
        NSLog(@"开始刷新");
        [self requestData];
    }];

}

- (void)requestData{
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
            [tableView.bj_header endRefreshing];
        
    });
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            [SGWCustomBlockAlertManager alertWithMessage:@"你确定取消吗" cancelButtonTitle:@"取消" cancelBlock:nil];
            break;
            
        case 1:
            [SGWBlockAlertManager alertWithTitle:@"" message:@"我是提示框" cancelButtonTitle:@"取消"];
            break;
            
        case 2:
            [UILabel showErrorProgressLabelWithString:@"我就是个提示框，我就是个提示框"];
            break;
            
        case 3:{
            CGSize toastSize = [HxToastView sizeForText:@"我就是个提示框，我就是个提示框"];
            HxToastView *toastView = [[HxToastView alloc] initWithFrame:CGRectZero];
            toastView.frame = CGRectMake((self.view.bounds.size.width - toastSize.width) / 2, (SCREEN_HEIGHT-toastSize.height-10)/2 - 20, toastSize.width, toastSize.height+10);
            [self.view addSubview:toastView];
            [self.view bringSubviewToFront:toastView];
            [toastView setToastText:@"我就是个提示框，我就是个提示框"];
            [toastView show:YES];
        }
            break;
            
        default:
            break;
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
    return 70;
}


#pragma mark - ScrollViewDelegate
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//
//    lastOffsetYaxis = scrollView.contentOffset;
//}


//下拉放大
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//
//    CGPoint currentTouchPosition = scrollView.contentOffset;
//
//    PositionY = currentTouchPosition.y;        //当前纵向滑动的位置距离起始点的位置
//    NSLog(@"******* = %d",PositionY);
//
//    OffsetY = PositionY - lastOffsetYaxis.y;
//
//    if (PositionY < 150)
//    {//手势为下滑，navbar
//        NSLog(@"向下划 = %d",OffsetY);
//
//    }else if (PositionY >= 150){
//        NSLog(@"向上 = %d",OffsetY);
//    }
////    else //手势为上滑，topbar
////    {
////        NSLog(@"向上 = %d",OffsetY);
//////        [self updateTopView:NO];
////    }
//}


@end

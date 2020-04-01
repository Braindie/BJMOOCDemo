//
//  SecondViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "SecondViewCtrl.h"
#import "MyTableViewCell.h"


#import "FirstRightDetailViewController.h"
#import "SecondLeftDetailViewController.h"

#import "BJRefresh.h"
#import "UIColor+BJColor.h"
#import "SecondListViewController.h"
#import "BJPropertyAnimationViewController.h"
#import "BJDynamicsViewController.h"

#import "BJViewAnimationViewController.h"

#import "BJLabelViewController.h"

#import "BJLottieViewController.h"
#import "BJSVGAPlayerViewController.h"


@interface SecondViewCtrl ()<UITableViewDataSource,UITableViewDelegate>
{
    int PositionY;
    float proportion;
    int OffsetY;
    CGPoint lastOffsetYaxis;
    
    
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataArr0;
@property (nonatomic ,strong) NSMutableArray *dataArr2;
@property (nonatomic ,strong) NSMutableArray *dataArr3;
@property (nonatomic ,strong) NSMutableArray *dataArr4;

@property (nonatomic ,strong) NSString *string1;
@property (nonatomic ,strong) NSString *string2;
@property (nonatomic ,strong) NSString *string3;
@property (nonatomic ,strong) NSString *string4;


@property (nonatomic ,assign) BOOL *ISBar;

@property (nonatomic ,assign) CGFloat lastOffSet;

@end

@implementation SecondViewCtrl



- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"渲染";

    self.view.backgroundColor = [UIColor whiteColor];

//    self.isNavCtrlSetLeft = YES;
//    self.isNavCtrlSetRight = YES;
//    [self.leftButton setTitle:@"CoreAnimation" forState:UIControlStateNormal];
//    [self.rightButton setTitle:@"CoreGraphics" forState:UIControlStateNormal];


//    //加载数据
    [self loadTopData];

//    //创建视图
    [self creatView];

}

- (void)loadTopData{

    NSArray *arr10 = [NSArray arrayWithObjects:@"最新",@"最热",nil];
    NSArray *arr11 = [NSArray arrayWithObjects:@"全部",@"河南",@"河北",@"湖南",@"湖北",@"北京",@"天津",@"上海",@"广州",@"深圳", nil];
    NSArray *arr12 = [NSArray arrayWithObjects:@"全部",@"动作",@"冒险",@"喜剧",@"爱情",@"战争",@"恐怖",@"科幻",@"悬疑", nil];


    NSArray *arr13 = [NSArray arrayWithObjects:@"全部",@"琅琊榜",@"伪装者",@"夏洛特烦恼",@"钛",@"子弹",@"灭绝",@"蚁人", nil];
    NSArray *arr14 = [NSArray arrayWithObjects:@"全部",@"电影1",@"电影2",@"电影3",@"电影4",@"电影5",@"电影6",@"电影7", nil];

    self.dataArr0 = [NSMutableArray arrayWithArray:arr10];
    self.dataArr2 = [NSMutableArray arrayWithArray:arr11];
    self.dataArr3 = [NSMutableArray arrayWithArray:arr12];
    self.dataArr4 = [NSMutableArray arrayWithObjects:arr13,arr14, nil];
}


- (void)creatView{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49-64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.bj_header = [BJRefreshGifStateHeader headerWithRefreshingBlock:^{
        NSLog(@"开始刷新");
        [self requestData];
    }];

}

- (void)requestData{
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
            [tableView.bj_header endRefreshing];
        
    });
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 2;
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifer = @"cellIdentefer";
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.label.text = @"UIAnimation";
        } else if (indexPath.row == 1) {
            cell.label.text = @"UIViewPropertyAnimator";
        } else {
            cell.label.text = @"UIDynamicAnimator";
        }
        
    } else if (indexPath.section == 1) {
        cell.label.text = @"CoreAnimation";
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.label.text = @"CoreGraphics";
        } else if (indexPath.row == 1) {
            cell.label.text = @"CoreText";
        }
        
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.label.text = @"lottie-ios";
        } else if (indexPath.row == 1) {
            cell.label.text = @"SVGAPlayer";
        }
    } else {
        return cell;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            BJViewAnimationViewController *vc = [[BJViewAnimationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        } else if (indexPath.row == 1) {
            BJPropertyAnimationViewController *vc = [[BJPropertyAnimationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        } else {
            BJDynamicsViewController *vc = [[BJDynamicsViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }

    } else if (indexPath.section == 1) {
        SecondLeftDetailViewController *vc = [[SecondLeftDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            FirstRightDetailViewController *vc = [[FirstRightDetailViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            BJLabelViewController *vc = [[BJLabelViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }

    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            BJLottieViewController *vc = [[BJLottieViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            BJSVGAPlayerViewController *vc = [[BJSVGAPlayerViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 50)];
    [view addSubview:label];
    if (section == 0) {
        label.text = @"UIKit";
    } else if (section == 1) {
        label.text = @"Core Animation";
    } else if (section == 2) {
        label.text = @"Core Graphics";
    } else if (section == 3) {
        label.text = @"矢量图";
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
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

//
//  SecondViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "SecondViewCtrl.h"
#import "MyTableViewCell.h"
#import "MyCourseDetailController.h"

#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)

@implementation SecondViewCtrl



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSet = YES;
    self.navigationItem.title = @"视频";

//    //加载数据
    [self loadTopData];


//    //创建视图
    [self creatView];

    
}

- (void)loadTopData{

    NSArray *dataArr1 = [NSArray arrayWithObjects:@"data1",@"data2",@"data3",@"data4",@"data5",@"data6",@"data7",@"data8",@"data9",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1",@"data1", nil];

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
    [self.view addSubview:self.tableView];




    self.navTabBar = [[UINavBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    self.navTabBar.delegate = self;
//    self.navTabBar.backgroundColor = [UIColor orangeColor];
//    _navTabBar.lineColor = _navTabBarLineColor;
//    _navTabBar.itemTitles = _titles;
    self.navTabBar.dataArr11 = self.dataArr2;
    self.navTabBar.dataArr12 = self.dataArr3;
    self.navTabBar.dataArr10 = self.dataArr0;
    self.navTabBar.dataArr13 = self.dataArr4;
//    [self.navTabBar loadTopData];
    [self.navTabBar updateData];

//    [self.view addSubview:self.navTabBar];
    self.tableView.tableHeaderView = self.navTabBar;

}

- (void)updateTopView:(BOOL)isTopBar{

    if (isTopBar == NO) {//topbar


//        [UIView animateWithDuration:1.1f animations:^{
            self.navTabBar.hidden = YES;
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:1.1f animations:^{
                if (!isTopBar)
                {
                    if (self.TopBar == nil) {
                        self.TopBar = [[UITopBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//                        self.TopBar.backgroundColor = [UIColor redColor];


                        [self.view addSubview:self.TopBar];
                    }else{
                        self.TopBar.hidden = NO;
                    }


                    //判断显示的数据
                    if (self.string2 == nil && self.string3 == nil) {

                        if (self.string1 == nil) {
                            self.TopBar.label.text = @"最新";
                        }else{
                            self.TopBar.label.text = self.string1;
                        }

                    }else if (self.string1 == nil && self.string2 != nil && self.string3 != nil) {
                        self.TopBar.label.text = [NSString stringWithFormat:@"最新 · %@ · %@",self.string2,self.string3];
                    

                    }else if (self.string1 == nil && self.string2 != nil && self.string3 == nil) {
                        if ([self.string2 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = @"最新";
                        }else{
                            self.TopBar.label.text = [NSString stringWithFormat:@"最新 · %@",self.string2];
                        }
                    }else if(self.string1 == nil && self.string2 == nil && self.string3 != nil){
                        if ([self.string3 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = @"最新";
                        }else{
                            self.TopBar.label.text = [NSString stringWithFormat:@"最新 · %@",self.string3];
                        }

                    }else if (self.string1 != nil && self.string2 != nil && self.string3 == nil){
                        if ([self.string2 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = self.string1;
                        }else{
                            self.TopBar.label.text = [NSString stringWithFormat:@"%@ · %@",self.string1,self.string2];
                        }
                    }else if (self.string1 != nil && self.string2 == nil && self.string3 != nil){
                        if ([self.string3 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = self.string1;
                        }else{
                            self.TopBar.label.text = [NSString stringWithFormat:@"%@ · %@",self.string1,self.string3];
                        }
                    }else if (self.string1 != nil && self.string2 != nil && self.string3 != nil){
                        if([self.string2 isEqualToString:@"全部"] && [self.string3 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = self.string1;
                        }else if ([self.string3 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = [NSString stringWithFormat:@"%@ · %@",self.string1,self.string2];
                        }else if([self.string2 isEqualToString:@"全部"]) {
                            self.TopBar.label.text = [NSString stringWithFormat:@"%@ · %@",self.string1,self.string3];
                        }else{
                            self.TopBar.label.text = [NSString stringWithFormat:@"%@ · %@ · %@",self.string1,self.string2,self.string3];
                        }
                    }
                }
//            }];
//        }];

        self.tableView.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height);
    }else{//navbar



//        [UIView animateWithDuration:1.1f animations:^{
        self.TopBar.hidden = YES;
//        } completion:^(BOOL finished) {
        self.navTabBar.hidden = NO;
//        }];

        if (self.ISBar) {
            self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }else{
            self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }


    }

}

- (void)itemPressedWithIndex1:(NSString *)str{

    self.string1 = [NSString stringWithString:str];

    
}
- (void)itemPressedWithIndex2:(NSString *)str{
    self.string2 = [NSString stringWithString:str];

}
//- (void)itemPressedWithIndex3:(NSString *)str{
//
//    self.string3 = [NSString stringWithString:str];
//
//    self.tableView.frame = CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height);
//
//}

- (void)itemPressedWithIndex3:(NSString *)str withIsBar:(BOOL *)isBar{

    self.ISBar = isBar;
    self.string3 = [NSString stringWithString:str];
//    if (isBar) {
//        self.tableView.frame = CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height);
//    }else{
//        self.tableView.frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height);
//    }
    self.tableView.tableHeaderView = self.navTabBar;

}

- (void)itemPressedWithIndex4:(NSString *)str{

    self.string4 = [NSString stringWithString:str];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCourseDetailController *myCourseDetailViewCtrl = [[MyCourseDetailController alloc] init];
    [self.navigationController pushViewController:myCourseDetailViewCtrl animated:NO];
}


#pragma mark - UITableViewDelegate
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
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    lastOffsetYaxis = scrollView.contentOffset;
}


//下拉放大
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {


    CGPoint currentTouchPosition = scrollView.contentOffset;

    PositionY = currentTouchPosition.y;        //当前纵向滑动的位置距离起始点的位置
    NSLog(@"******* = %d",PositionY);

    OffsetY = PositionY - lastOffsetYaxis.y;

    if (PositionY < 150)
    {//手势为下滑，navbar
        NSLog(@"向下划 = %d",OffsetY);
        [self updateTopView:YES];

    }else if (PositionY >= 150){
        NSLog(@"向上 = %d",OffsetY);
        [self updateTopView:NO];
    }
//    else //手势为上滑，topbar
//    {
//        NSLog(@"向上 = %d",OffsetY);
////        [self updateTopView:NO];
//    }
}


@end

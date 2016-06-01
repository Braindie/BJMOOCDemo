//
//  SecondViewCtrl.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavBarView.h"
#import "UITopBarView.h"


@interface SecondViewCtrl : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    int PositionY;
    float proportion;
    int OffsetY;
    CGPoint lastOffsetYaxis;


}


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UINavBarView *navTabBar;
@property (nonatomic, strong) UITopBarView *TopBar;


@property (nonatomic ,strong) NSMutableArray *dataArr1;

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

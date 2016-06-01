//
//  ThirdDetailViewController.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"
#import "ThirdFootView.h"
#import "ThirdHeaderView.h"


@interface ThirdDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,backActionDelegate,headerViewDelegate>

@property (nonatomic ,strong) UITableView *detailTableView;

@property (nonatomic ,strong) ThirdHeaderView *headerView;
@property (nonatomic ,strong) ThirdFootView *footView;

@property (nonatomic ,strong) NSDictionary *myDataDic;
@property (nonatomic ,strong) NSArray *myDataArr;

@end

//
//  FourthSevice.h
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FourthVM.h"
#import "FourthViewCtrl.h"


@interface FourthSevice : NSObject<UITableViewDelegate,UITableViewDataSource>

/**
 *   界面
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *   数据源
 */
@property (nonatomic, strong) FourthVM *viewModel;

@end

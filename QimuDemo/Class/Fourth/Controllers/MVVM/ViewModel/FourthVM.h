//
//  FourthVM.h
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FourthModel.h"

@interface FourthVM : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) FourthModel *model;

- (void)requestDataComplete:(void (^)(BOOL success))completeBlock;
@end

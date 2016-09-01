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

//@class FourthViewCtrl,FourthVM;

@interface FourthSevice : NSObject<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) FourthVM *viewModel;

//@property (nonatomic, weak) FourthViewCtrl *fourthVC;

@property (nonatomic, strong) NSArray *myDataArr;

- (void)initWithTableView:(UITableView *)tableView;

@end

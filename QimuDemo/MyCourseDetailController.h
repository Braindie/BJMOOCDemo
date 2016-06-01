//
//  MyCourseDetailController.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"

@interface MyCourseDetailController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{


}


@property (nonatomic ,strong) NSDictionary *myDataDic;
@property (nonatomic ,strong) NSArray *myDataArr;
@property (nonatomic ,strong) NSArray *myCommentArr;

@property (nonatomic ,strong) UITableView *myDetailTableView;


@end

//
//  ThirdViewCtroller.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"

@interface ThirdViewCtroller : BaseViewController<UITableViewDataSource,UITableViewDelegate>{

    
}

@property (nonatomic, strong) NSArray *myDataArr;

@property (nonatomic, strong) UITableView *thirdTableView;
@end

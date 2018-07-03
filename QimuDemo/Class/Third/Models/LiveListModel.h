//
//  LiveListModel.h
//  QimuDemo
//
//  Created by zhangwenjun on 17/6/2.
//  Copyright © 2017年 ll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveListModel : NSObject

@property (nonatomic, assign) NSNumber *dm_error;
//错误码
@property (nonatomic, assign) NSNumber *expire_time;
//说明文字
@property (nonatomic, strong) NSString *error_msg;

//列表
@property (nonatomic, strong) NSArray *itemList;

@end

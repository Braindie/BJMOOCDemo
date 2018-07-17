//
//  BJRefreshHeader.h
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJRefreshComponent.h"

@interface BJRefreshHeader : BJRefreshComponent
//!< 创建header
+ (instancetype)headerWithRefreshingBlock:(BJRefreshComponentRefreshingBlock)refershingBlock;
@end

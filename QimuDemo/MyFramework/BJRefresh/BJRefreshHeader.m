//
//  BJRefreshHeader.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJRefreshHeader.h"

@implementation BJRefreshHeader

+ (instancetype)headerWithRefreshingBlock:(BJRefreshComponentRefreshingBlock)refershingBlock{
    BJRefreshHeader *header = [[self alloc] init];
    header.refreshingBlock = refershingBlock;
    return header;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)changeDic{
    [super scrollViewContentOffsetDidChange:changeDic];
    
    if (self.refreshState == BJRefreshStateRefreshing) {
        
    }
}

@end

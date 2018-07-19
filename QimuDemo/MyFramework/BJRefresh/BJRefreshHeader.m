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

#pragma mark -
- (void)prepare{
    [super prepare];
    
    self.bj_h = BJRefreshHeaderHeight;
}

#pragma mark -
- (void)placeSubView{
    [super placeSubView];
    
    self.bj_y = -self.bj_h - self.ignoredScrollViewContentInsetTop;
}

- (void)setIgnoredScrollViewContentInsetTop:(CGFloat)ignoredScrollViewContentInsetTop{
    _ignoredScrollViewContentInsetTop = ignoredScrollViewContentInsetTop;
    
    self.bj_y = - self.bj_h - _ignoredScrollViewContentInsetTop;
}

#pragma mark -
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)changeDic{
    [super scrollViewContentOffsetDidChange:changeDic];
    
    if (self.refreshState == BJRefreshStateRefreshing) {
        
    }
    //
    _scrollViewOriginalInset = self.scrollView.bj_inset;
    
    //当前的contentOffset
    CGFloat offsetY = self.scrollView.bj_offsetY;
    NSLog(@"offsetY = %f",offsetY);
    //头部控件刚好出现的offsetY
    CGFloat happenOffsetY = - self.scrollViewOriginalInset.top;
    NSLog(@"happenOffsetY = %f",happenOffsetY);

    //普通 和 即将刷新 的临界点
    CGFloat normal2pullingOffsetY = happenOffsetY - self.bj_h;
    CGFloat pullingPercent = (happenOffsetY - offsetY) / self.bj_h;
    NSLog(@"normal2pullingOffsetY = %f",normal2pullingOffsetY);
    NSLog(@"pullingPercent = %f",pullingPercent);

    
    NSLog(@"%ld",self.refreshState);
    
    if (self.scrollView.isDragging) {
        self.pullingPercent = pullingPercent;
        if (self.refreshState == BJRefreshStateIdle && offsetY < normal2pullingOffsetY) {//超过临界点,即将刷新
            self.refreshState = BJRefreshStatePulling;//即将刷新状态
        }else if (self.refreshState == BJRefreshStatePulling && offsetY >= normal2pullingOffsetY){//未超临界点，返回普通状态
            self.refreshState = BJRefreshStateIdle;//普通状态
        }
    }else if (self.refreshState == BJRefreshStatePulling){
        [self beginRefreshing];//开始刷新
    }
    
}

@end

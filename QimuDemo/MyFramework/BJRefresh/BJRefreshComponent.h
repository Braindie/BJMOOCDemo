//
//  BJRefreshComponent.h
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+BJExtension.h"
#import "UIScrollView+BJExtension.h"
#import "BJRefreshConst.h"

//!< 刷新控件的状态
typedef NS_ENUM(NSInteger, BJRefreshState) {
    BJRefreshStateIdle = 1,//闲置状态
    BJRefreshStatePulling,//拖动状态，松开就可以进行刷新的状态
    BJRefreshStateRefreshing,//正在刷新中的状态
    BJRefreshStateWillRefresh,//即将刷新的状态
    BJRefreshStateNoMoreData//没有更多数据了
};

//!< 进入刷新状态的回调
typedef void (^BJRefreshComponentRefreshingBlock)(void);
//!< 开始进入刷新后的回调
typedef void (^BJRefreshComponentBeginRefreshIngCompletionBlock)(void);
//!< 结束刷新的回调
typedef void (^BJRefreshComponentEndRefreshIngCompletionBlock)(void);

@interface BJRefreshComponent : UIView{
    //记录scrollView刚开始的inset
    UIEdgeInsets _scrollViewOriginalInset;
    //父控件
    __weak UIScrollView *_scrollView;
}

#pragma mark - 刷新状态
//!< 正在刷新的回调
@property (nonatomic, copy) BJRefreshComponentRefreshingBlock refreshingBlock;

#pragma mark - 刷新状态控制
//!< 当前刷新状态
@property (nonatomic, assign) BJRefreshState refreshState;

//!< 开始进入刷新的回调
@property (nonatomic, copy) BJRefreshComponentBeginRefreshIngCompletionBlock beginRefreshIngCompletionBlock;
//!< 进入刷新状态
- (void)beginRefreshing;//无回调
- (void)beginRefreshingWithCompletionBlock:(void (^)(void))completionBlock;//有回调

//!< 结束刷新的回调
@property (nonatomic, copy) BJRefreshComponentEndRefreshIngCompletionBlock endRefreshIngCompletionBlock;
//!< 结束刷新的回调
- (void)endRefreshing;//无回调
- (void)endRefreshingWithCompletionBlock:(void (^)(void))completionBlock;//有回调

#pragma mark - 交给子类去访问
//!< 记录scrollView刚开始的inset
@property (assign, nonatomic, readonly) UIEdgeInsets scrollViewOriginalInset;
//!< 父控件
@property (weak, nonatomic, readonly) UIScrollView *scrollView;

#pragma mark - KVO触发的方法，交给子类去实现
//!< 初始化
- (void)prepare;

//!< layout时调用
- (void)placeSubView;

//!< contentOffset发生改变时调用
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)changeDic;
//!< contentSize发生改变时调用
- (void)scrollViewContentSizeDidChange:(NSDictionary *)changeDic;
//!< scrollView的拖拽状态发生改变时调用
- (void)scrollViewPanStateDidChange:(NSDictionary *)changeDic;

#pragma mark -
//!< 拖拽的百分比
@property (nonatomic, assign) CGFloat pullingPercent;
@end

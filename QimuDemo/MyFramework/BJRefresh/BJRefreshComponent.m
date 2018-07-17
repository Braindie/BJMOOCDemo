//
//  BJRefreshComponent.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJRefreshComponent.h"

@interface BJRefreshComponent ()
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@end

@implementation BJRefreshComponent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        self.refreshState = BJRefreshStateIdle;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    //如果不是UIScrollView，不做任何事情
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) {
        return;
    }
    
    [self removeObservers];
    
    if (newSuperview) {
        //设置宽度
        self.bj_w = newSuperview.bj_w;
        //设置位置
        self.bj_x = -_scrollView.bj_insetTop;
        
        
        _scrollView = (UIScrollView *)newSuperview;
        _scrollView.alwaysBounceVertical = YES;
        _scrollViewOriginalInset = _scrollView.bj_inset;
        
        
        [self addObservers];
    }
}

- (void)prepare{
    self.backgroundColor = [UIColor orangeColor];
}


- (void)addObservers{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:BJRefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:BJRefreshKeyPathCotentSize options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:BJRefreshKeyPathPanState options:options context:nil];
}

- (void)removeObservers{
    [self.superview removeObserver:self forKeyPath:BJRefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:BJRefreshKeyPathCotentSize];
    [self.pan removeObserver:self forKeyPath:BJRefreshKeyPathPanState];
    self.pan = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (self.hidden) {
        return;
    }
    if ([keyPath isEqualToString:BJRefreshKeyPathContentOffset]) {
        NSLog(@"BJRefreshKeyPathContentOffset");
        [self scrollViewContentOffsetDidChange:change];
    }else if ([keyPath isEqualToString:BJRefreshKeyPathPanState]){
        NSLog(@"BJRefreshKeyPathPanState");
        [self scrollViewPanStateDidChange:change];
    }
}

//!< contentOffset发生改变时调用
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)changeDic{
    
}
//!< contentSize发生改变时调用
- (void)scrollViewContentSizeDidChange:(NSDictionary *)changeDic{
    
}
//!< scrollView的拖拽状态发生改变时调用
- (void)scrollViewPanStateDidChange:(NSDictionary *)changeDic{
    
}

@end

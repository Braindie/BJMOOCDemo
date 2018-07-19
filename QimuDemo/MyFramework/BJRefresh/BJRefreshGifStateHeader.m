//
//  BJRefreshGifStateHeader.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/17.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJRefreshGifStateHeader.h"

@interface BJRefreshGifStateHeader ()

/** 动画图片View */
@property (strong, nonatomic) UIImageView *gifView;
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@end

@implementation BJRefreshGifStateHeader
#pragma mark - 懒加载
- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] init];
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}

- (NSMutableDictionary *)stateImages
{
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}

- (NSMutableDictionary *)stateDurations
{
    if (!_stateDurations) {
        self.stateDurations = [NSMutableDictionary dictionary];
    }
    return _stateDurations;
}



#pragma mark -

- (void)prepare{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImageArr = [NSMutableArray array];
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pic_%ld",(long)i]];
        [idleImageArr addObject:image];
    }
    [self setImageArray:idleImageArr forState:BJRefreshStateIdle];
    
    
    // 设置即将刷新状态的动画图片
    [self setImageArray:idleImageArr forState:BJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImageArray:idleImageArr forState:BJRefreshStateRefreshing];
    
}

#pragma mark -
- (void)placeSubView{
    [super placeSubView];
    
    if (self.gifView.constraints.count) {
        return;
    }
    
    self.gifView.frame = self.bounds;
    self.gifView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setRefreshState:(BJRefreshState)refreshState{
    [super setRefreshState:refreshState];
    
    //根据状态做事情
    if (refreshState == BJRefreshStatePulling || refreshState == BJRefreshStateRefreshing) {
        NSArray *imageArray = self.stateImages[@(refreshState)];
        if (imageArray.count == 0) {
            return;
        }
        
        [self.gifView stopAnimating];
        if (imageArray.count == 1) {
            self.gifView.image = [imageArray firstObject];
        }else{
            self.gifView.animationImages = imageArray;
            self.gifView.animationDuration = [self.stateDurations[@(refreshState)] doubleValue];
            [self.gifView startAnimating];
        }
    }
    else if (refreshState == BJRefreshStateIdle){
        [self.gifView stopAnimating];
    }

}

- (void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
    
    NSArray *images = self.stateImages[@(BJRefreshStateIdle)];
    if (self.refreshState != BJRefreshStateIdle || images.count == 0) {
        return;
    }
    
    [self.gifView stopAnimating];
    
    //设置当前需要显示的图片
    NSUInteger index = images.count * pullingPercent;
    if (index >= images.count) {
        index = images.count-1;
    }
    self.gifView.image = images[index];
}

#pragma mark -
- (void)setImageArray:(NSArray *)imageArray forState:(BJRefreshState)state{
    [self setImageArray:imageArray duration:imageArray.count*0.1 forState:BJRefreshStateIdle];
}

- (void)setImageArray:(NSArray *)imageArray duration:(NSTimeInterval)duration forState:(BJRefreshState)state{
    if (imageArray == nil) {
        return;
    }
    
    self.stateImages[@(state)] = imageArray;
    self.stateDurations[@(state)] = @(duration);
    
//    UIImage *image = [imageArray firstObject];
//    if (image.size.height > self.bj_h) {
//        self.bj_h = image.size.height;
//    }
}


@end

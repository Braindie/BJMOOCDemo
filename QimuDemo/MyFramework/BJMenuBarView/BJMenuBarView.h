//
//  BJMenuBarView.h
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/26.
//  Copyright © 2018年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BJMenuBarView;

@protocol BJMenuBarViewDataSource <NSObject>
//获取菜单栏标题数组
- (NSArray *)titleForRowAtIndexPathMenu:(BJMenuBarView *)menu;
- (NSArray *)cellTitelForRowAtIndexPathMenu:(BJMenuBarView *)menu;

@end

@protocol BJMenuBarViewDelegate <NSObject>
//点击了默认按钮
- (void)clickDefaultAction;
//点击了年利率按钮
- (void)clickRateActionIsUp:(BOOL)isUp;
//点击了期限按钮
- (void)clickTimeActionIsUp:(BOOL)isUp;
//点击筛选确定或重置按钮
- (void)clickSelectActionWithType:(NSInteger)type withRate:(NSInteger)rate withTime:(NSInteger)time;
@end

@interface BJMenuBarView : UIView
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, assign) id<BJMenuBarViewDataSource> dataSource;
@property (nonatomic, assign) id<BJMenuBarViewDelegate> delegate;
//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;



@end

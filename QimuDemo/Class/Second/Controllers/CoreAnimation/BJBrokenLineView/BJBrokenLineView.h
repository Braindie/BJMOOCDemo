//
//  BJBrokenLineView.h
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJBrokenLineView : UIView

/*
 * X 轴的刻度数字
 */
@property (nonatomic,strong)NSArray *arrX;

/*
 * Y 轴的刻度数字 左侧纵轴的刻度
 */
@property (nonatomic,strong)NSArray *arrLeftY;

/*
 * Y 轴的刻度数字 右侧纵轴的刻度
 */
@property (nonatomic,strong)NSArray *arrRightY;

/*
 * 刷新数据 重新开始动画
 */
-(void)refreshChartAnmition;

/* 根据数据源画图
 *  pathX :横坐标数据
 *  纵坐标 右侧刻度基准
 *  pathY :纵坐标数据源
 *  X:X轴需要切割的份数
 */
-(void)drawRightChartViewWithArrayX:(NSArray*)pathX ArrayY:(NSArray*)pathY andScaleX:(float)X;

/* 根据数据源画图
 *  pathX :横坐标数据
 *  纵坐标 左侧刻度基准
 *  pathY :纵坐标数据源
 *  X : X轴需要切割的份数
 */
-(void)drawLeftChartViewWithArrayX:(NSArray*)pathX ArrayY:(NSArray*)pathY andScaleX:(float)X;

@end

NS_ASSUME_NONNULL_END

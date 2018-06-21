//
//  BJKChartView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/21.
//  Copyright © 2018年 ll. All rights reserved.
//


//!<  线宽度
#define kChartKWidth 1
//!< 折点间距
#define kChartKSpaceWidth 40
//!< 起点间距
#define kChartKStartWidth 30

//!< X轴起点间距
#define kXKStartWidth 20
//!< 圆点半径
#define kPointRadius 4


#import "BJKChartView.h"

@implementation BJKChartView

- (NSMutableArray *)myDataArray{
    if (!_myDataArray) {
        
        NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth, 70)];
        
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth, 60)];

        NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*2, 50)];
        
        NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*3, 53)];

        NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*4, 55)];

        NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*5, 50)];

        NSValue *value7 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*6, 58)];

        _myDataArray = @[value1,value2,value3,value4,value5,value6,value7].mutableCopy;
    }
    return _myDataArray;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (!self.myDataArray) {
        return;
    }
    

    
    
    CGContextSetLineWidth(ctx, kChartKWidth);//!< k线宽度
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);



    /**
     *   坐标系
     */
    CGPoint xPoints[2];
    xPoints[0] =CGPointMake(kChartKStartWidth, 150);
    xPoints[1] =CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*7, 150);
    CGPoint yPoints[2];
    yPoints[0] =CGPointMake(kChartKStartWidth, 20);
    yPoints[1] =CGPointMake(kChartKStartWidth, 150);
    CGContextAddLines(ctx, xPoints, 2);//添加线
    CGContextAddLines(ctx, yPoints, 2);//添加线
    CGContextDrawPath(ctx, kCGPathStroke); //根据坐标绘制路径

    /**
     *   绘制K线
     */
    CGPoint firstPoint = [self.myDataArray.firstObject CGPointValue];
    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (NSInteger idx = 1; idx < self.myDataArray.count ; idx++)
    {
        CGPoint point = [self.myDataArray[idx] CGPointValue];
        CGContextAddLineToPoint(ctx, point.x, point.y);//!< 添加一条线
    }
    CGContextStrokePath(ctx);//!< 不加这句就只画了一条线


    /**
     *   绘制交叉圆点
     */
    for (NSInteger idx = 0; idx < self.myDataArray.count ; idx++)
    {
        CGPoint point = [self.myDataArray[idx] CGPointValue];
        CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);//!< 填充颜色
        CGContextAddArc(ctx, point.x, point.y, kPointRadius, 0, 2 * M_PI, 0);//!< 添加一个圆
        CGContextDrawPath(ctx, kCGPathFillStroke);//!< 不加这句就没有填充
        //kCGPathFill填充非零绕数规则,
        //kCGPathEOFill表示用奇偶规则,
        //kCGPathStroke路径,
        //kCGPathFillStroke路径填充,
        //kCGPathEOFillStroke表示描线，不是填充
    }

}


@end

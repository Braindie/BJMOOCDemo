//
//  BJKChartView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/21.
//  Copyright © 2018年 ll. All rights reserved.
//


//!<  线宽度
#define kChartKWidth 2
//!< 折点间距
#define kChartKSpaceWidth 10
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

        NSValue *value7 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*6, 44)];
        NSValue *value8 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*7, 34)];
        NSValue *value9 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*8, 50)];
        NSValue *value10 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*9, 53)];
        NSValue *value11 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*10, 52)];
        NSValue *value12 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*11, 59)];
        NSValue *value13 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*12, 34)];
        NSValue *value14 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*13, 56)];
        NSValue *value15 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*14, 44)];
        NSValue *value16 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*15, 34)];
        NSValue *value17 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*16, 45)];
        NSValue *value18 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*17, 41)];
        NSValue *value19 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*18, 34)];
        NSValue *value20 = [NSValue valueWithCGPoint:CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*19, 56)];


        _myDataArray = @[value1,value2,value3,value4,value5,value6,value7,value8,value9,value10,value11,value12,value13,value14,value15,value16,value17,value18,value19,value20].mutableCopy;
    }
    return _myDataArray;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (!self.myDataArray) {
        return;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, kChartKWidth);//!< k线宽度
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);

    /**
     *   坐标系
     */
//    CGPoint xPoints[2];
//    xPoints[0] =CGPointMake(kChartKStartWidth, 150);
//    xPoints[1] =CGPointMake(kChartKStartWidth+kXKStartWidth+kChartKSpaceWidth*7, 150);
//    CGPoint yPoints[2];
//    yPoints[0] =CGPointMake(kChartKStartWidth, 20);
//    yPoints[1] =CGPointMake(kChartKStartWidth, 150);
//    CGContextAddLines(ctx, xPoints, 2);//添加线
//    CGContextAddLines(ctx, yPoints, 2);//添加线
//    CGContextDrawPath(ctx, kCGPathStroke); //根据坐标绘制路径

    /**
     *   绘制K线
     */
    CGPoint firstPoint = [self.myDataArray.firstObject CGPointValue];
    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (NSInteger idx = 1; idx < self.myDataArray.count ; idx++){
        CGPoint point = [self.myDataArray[idx] CGPointValue];
        CGContextAddLineToPoint(ctx, point.x, point.y);//!< 添加一条线
        CGContextSetShadow(ctx, CGSizeMake(0, 0), 12);//!< 添加阴影(CGSize都为正表示朝上和朝右，12标示模糊度）
        CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 12, [UIColor yellowColor].CGColor);//!< 阴影颜色
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
    }
    CGContextStrokePath(ctx);//!< 不加这句就只画了一条线


    /**
     *   绘制交叉圆点
     */
//    for (NSInteger idx = 0; idx < self.myDataArray.count ; idx++)
//    {
//        CGPoint point = [self.myDataArray[idx] CGPointValue];
//        CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);//!< 填充颜色
//        CGContextAddArc(ctx, point.x, point.y, kPointRadius, 0, 2 * M_PI, 0);//!< 添加一个圆
//        CGContextDrawPath(ctx, kCGPathFillStroke);//!< 不加这句就没有填充
//        //kCGPathFill填充非零绕数规则,
//        //kCGPathEOFill表示用奇偶规则,
//        //kCGPathStroke路径,
//        //kCGPathFillStroke路径填充,
//        //kCGPathEOFillStroke表示描线，不是填充
//    }

}


@end

//
//  BJKSmoothChartView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/12.
//  Copyright © 2019 ll. All rights reserved.
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


#import "BJKSmoothChartView.h"
#import "UIBezierPath+curved.h"

@implementation BJKSmoothChartView

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

#pragma mark - 绘制平滑折线
- (void)drawRect:(CGRect)rect{

    NSMutableArray *pointsArray = [self.myDataArray mutableCopy];

    [pointsArray insertObject:[pointsArray objectAtIndex:0] atIndex:0];
    [pointsArray addObject:[pointsArray lastObject]];



    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, kChartKWidth);

    UIBezierPath *smoothedPath = [UIBezierPath bezierPath];

    CGPoint firstPoint = [[pointsArray firstObject] CGPointValue];
    [smoothedPath moveToPoint:firstPoint];

    for (int i= 0; i< pointsArray.count; i++) {
        CGPoint point = [pointsArray[i] CGPointValue];
        [smoothedPath addLineToPoint:point];
    }

    CGPoint lastPoint = [[pointsArray lastObject] CGPointValue];
    [smoothedPath addLineToPoint:lastPoint];

    //平滑处理
    smoothedPath = [smoothedPath smoothedPathWithGranularity:20];

    CGContextAddPath(context, smoothedPath.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
}

@end


//
//  BJBarChartView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/21.
//  Copyright © 2018年 ll. All rights reserved.
//

//!< bar宽度
#define kLineWidth 20
//!< bar间距
#define kLineSpaceWidth 20
//!< 起点间距
#define kLineStartSpaceWidth 30+(kLineWidth/2)


#import "BJBarChartView.h"
#import "BJChartModel.h"

@implementation BJBarChartView

- (NSMutableArray *)myDataArray{
    if (!_myDataArray) {
        BJChartModel *model1 = [[BJChartModel alloc] init];
        model1.StartPoint = CGPointMake(0, kLineStartSpaceWidth);
        model1.EndPoint = CGPointMake(300, kLineStartSpaceWidth);
        
        BJChartModel *model2 = [[BJChartModel alloc] init];
        model2.StartPoint = CGPointMake(0, kLineStartSpaceWidth+(kLineWidth+kLineSpaceWidth));
        model2.EndPoint = CGPointMake(240, kLineStartSpaceWidth+(kLineWidth+kLineSpaceWidth));
        
        BJChartModel *model3 = [[BJChartModel alloc] init];
        model3.StartPoint = CGPointMake(0, kLineStartSpaceWidth+(kLineWidth+kLineSpaceWidth)*2);
        model3.EndPoint = CGPointMake(280, kLineStartSpaceWidth+(kLineWidth+kLineSpaceWidth)*2);
        
        _myDataArray = @[model1,model2,model3].mutableCopy;
    }
    return _myDataArray;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (!self.myDataArray) {
        return;
    }

    CGFloat lineMaxX = self.frame.size.width;

    //绘制背景色
    BJChartModel *lastModel = self.myDataArray.lastObject;
    CGContextSetFillColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, lineMaxX, lastModel.EndPoint.y+kLineStartSpaceWidth));

    [self.myDataArray enumerateObjectsUsingBlock:^(BJChartModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        //绘制柱状图
        CGContextSetStrokeColorWithColor(ctx, [UIColor groupTableViewBackgroundColor].CGColor);
        CGContextSetLineWidth(ctx, kLineWidth);
        CGPoint pointStart = CGPointMake(0, model.StartPoint.y);
        CGPoint pointEnd = CGPointMake(lineMaxX, model.StartPoint.y);
        CGPoint pointSolidPoints[] = {pointStart, pointEnd};
        CGContextStrokeLineSegments(ctx, pointSolidPoints, 2);
        

        CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
        CGContextSetLineWidth(ctx, kLineWidth);
        const CGPoint solidPoints[] = {model.StartPoint, model.EndPoint};
        CGContextStrokeLineSegments(ctx, solidPoints, 2);

        
        NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]};
        NSString *day = @"2018-10-12";
        [day drawAtPoint:CGPointMake(model.StartPoint.x+5, model.EndPoint.y-5) withAttributes:attribute];
        
        
        NSDictionary *attribute1 = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]};
        NSString *money = @"1.12345";
        [money drawAtPoint:CGPointMake(model.EndPoint.x-50, model.EndPoint.y-5) withAttributes:attribute1];
        
    }];

}


@end

//
//  BJBrokenLineView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJBrokenLineView.h"
#define  VIEW_WIDTH  self.frame.size.width //底图的宽度
#define  VIEW_HEIGHT self.frame.size.height//底图的高度

#define  LABLE_WIDTH  280 //表的宽度
#define  LABLE_HEIGHT 150 //表的高度

@interface BJBrokenLineView ()
{
    CAShapeLayer *anmitionLayerLeft;
    
    CAShapeLayer *anmitionLayerRight;
    
    //X轴
    CAShapeLayer *layerX;
    //左侧纵坐标轴
    CAShapeLayer *layerLeftY;
    // 右侧纵轴线
    CAShapeLayer *layerRight;
}

@end

@implementation BJBrokenLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

//绘制X轴
-(void)makeChartXView{
    //X轴
    layerX = [CAShapeLayer layer];
    layerX.frame = CGRectMake(25,LABLE_HEIGHT + 25, LABLE_WIDTH, 1);
    layerX.backgroundColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:layerX];
}

//绘制Y轴及纵坐标上的横线
-(void)makeChartLeftYView{
    
    //左侧纵坐标轴
    layerLeftY = [CAShapeLayer layer];
    layerLeftY.frame = CGRectMake(25,25, 1, LABLE_HEIGHT);
    layerLeftY.backgroundColor = [[UIColor orangeColor] CGColor];
    [self.layer addSublayer:layerLeftY];
    
    float height= 30;
    
    // 纵坐标上的横线
    for (int i=0; i<5; i++) {
        if (i!=5) {
            CAShapeLayer *layer5 = [CAShapeLayer layer];
            layer5.frame = CGRectMake(0, i*height,LABLE_WIDTH, 0.5f);
            layer5.backgroundColor = [[UIColor orangeColor] CGColor];
            [layerLeftY addSublayer:layer5];
        }
    }
}
-(void)makeChartRightYView{
    
    // 右侧纵轴线
    layerRight = [CAShapeLayer layer];
    layerRight.frame = CGRectMake(LABLE_WIDTH+25,25, 0.5f, LABLE_HEIGHT);
    layerRight.backgroundColor = [[UIColor orangeColor] CGColor];
    [self.layer addSublayer:layerRight];
    
}

//X轴
-(void)setArrX:(NSArray *)arrX{
    _arrX = arrX;
    
    [layerX removeAllAnimations];
    [layerX removeFromSuperlayer];
    [self makeChartXView];
    
    CGFloat width = (VIEW_WIDTH-30)/3;
    
    //横坐标上的数字
    for (int i=0; i<arrX.count; i++) {
        CATextLayer *layer3 = [CATextLayer layer];
        layer3.contentsScale = [UIScreen mainScreen].scale;
        layer3.frame = CGRectMake((VIEW_WIDTH - LABLE_WIDTH)/2+i*width, 5, width, 20);
        layer3.string = [NSString stringWithFormat:@"%@",_arrX[i]];
        layer3.fontSize = 12;
        layer3.foregroundColor = [[UIColor orangeColor] CGColor];
        [layerX addSublayer:layer3];
    }
}

//Y轴左坐标数据
-(void)setArrLeftY:(NSArray *)arrLeftY{
    _arrLeftY =arrLeftY;
    
    [layerLeftY removeAllAnimations];
    [layerLeftY removeFromSuperlayer];
    [self makeChartLeftYView];
    
    float height= 30;
    
    //纵坐标上的数字
    for (int i=0; i<_arrLeftY.count; i++) {
        CATextLayer *layer6 = [CATextLayer layer];
        layer6.contentsScale = [UIScreen mainScreen].scale;
        layer6.frame = CGRectMake(-30,LABLE_HEIGHT-(i*height)-6, 25, 20);
        layer6.string = [NSString stringWithFormat:@"%@",_arrLeftY[i]];
        layer6.fontSize = 12;
        layer6.alignmentMode = kCAAlignmentRight;
        layer6.foregroundColor = [[UIColor orangeColor] CGColor];
        [layerLeftY addSublayer:layer6];
    }
}

//Y轴右坐标数据
-(void)setArrRightY:(NSArray *)arrRightY{
    _arrRightY = arrRightY;
    float height= 30;
    
    [layerRight removeAllAnimations];
    [layerRight removeFromSuperlayer];
    [self makeChartRightYView];
    
    //右侧侧纵坐标上的数字
    for (int i=0; i<_arrRightY.count; i++) {
        CATextLayer *layer6 = [CATextLayer layer];
        layer6.contentsScale = [UIScreen mainScreen].scale;
        layer6.frame = CGRectMake(5,LABLE_HEIGHT-(i*height)-6, 25, 20);
        layer6.string = [NSString stringWithFormat:@"%@",_arrRightY[i]];
        layer6.fontSize = 12;
        layer6.alignmentMode = kCAAlignmentLeft;
        layer6.foregroundColor = [[UIColor orangeColor] CGColor];
        [layerRight addSublayer:layer6];
    }
}


#pragma mark - 作图 （左侧纵坐标刻度为基准）
-(void)drawLeftChartViewWithArrayX:(NSArray *)pathX ArrayY:(NSArray *)pathY andScaleX:(float)X{
    
    // 创建layer并设置属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth =  2.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:layer];
    
    CGPoint point;
    // 创建贝塞尔路径~
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // X轴和Y轴的倍率
    CGFloat BLX = (LABLE_WIDTH-15)/X;
    CGFloat BLY = LABLE_HEIGHT/[[_arrLeftY lastObject] floatValue];
    
    for (int i= 0; i< pathY.count; i++) {
        
        CGFloat X = [pathX[i] floatValue]*BLX +(VIEW_WIDTH - LABLE_WIDTH)/2 +10;
        CGFloat Y = LABLE_HEIGHT - [pathY[i] floatValue]*BLY +(VIEW_HEIGHT - LABLE_HEIGHT)/2;
        
        point = CGPointMake(X, Y);
        
        if (i==0) {
            [path moveToPoint:point];//起点
        }
        
        [path addLineToPoint:point];
    }
    
    // 关联layer和贝塞尔路径~
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(3.0);
    animation.autoreverses = NO;
    animation.duration = 6.0;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    
    layer.strokeEnd = 1;
    anmitionLayerLeft = layer;
}


#pragma mark - 作图 （右侧纵坐标刻度为基准）

-(void)drawRightChartViewWithArrayX:(NSArray *)pathX ArrayY:(NSArray *)pathY andScaleX:(float)X{
    
    // 创建layer并设置属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth =  2.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:layer];
    
    CGPoint point;
    // 创建贝塞尔路径~
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // X轴和Y轴的倍率
    CGFloat BLX = (LABLE_WIDTH-15)/X;
    CGFloat BLY = LABLE_HEIGHT/[[_arrRightY lastObject] floatValue];
    
    for (int i= 0; i< pathY.count; i++) {
        
        CGFloat X = [pathX[i] floatValue]*BLX +(VIEW_WIDTH - LABLE_WIDTH)/2 +10;
        CGFloat Y = LABLE_HEIGHT - [pathY[i] floatValue]*BLY +(VIEW_HEIGHT - LABLE_HEIGHT)/2 +1;
        
        point = CGPointMake(X, Y);
        
        if (i==0) {
            [path moveToPoint:point];//起点
        }
        
        [path addLineToPoint:point];
    }
    
    // 关联layer和贝塞尔路径~
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(3.0);
    animation.autoreverses = NO;
    animation.duration = 6.0;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    
    layer.strokeEnd = 1;
    anmitionLayerRight = layer;
    
}
#pragma mark -  刷新图表
-(void)refreshChartAnmition{
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(3.0);
    animation.autoreverses = NO;
    animation.duration = 6.0;
    
    // 设置layer的animation
    [anmitionLayerLeft addAnimation:animation forKey:nil];
    
    anmitionLayerLeft.strokeEnd = 1;
    
    
    // 创建Animation
    CABasicAnimation *animationRight = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animationRight.fromValue = @(0.0);
    animationRight.toValue = @(3.0);
    animationRight.autoreverses = NO;
    animationRight.duration = 6.0;
    
    // 设置layer的animation
    [anmitionLayerRight addAnimation:animationRight forKey:nil];
    
    anmitionLayerRight.strokeEnd = 1;

}

@end

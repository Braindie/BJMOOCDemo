//
//  BJRingtLoadingView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/11/13.
//  Copyright © 2018 ll. All rights reserved.
//

#import "BJRingtLoadingView.h"

@interface BJRingtLoadingView ()
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CALayer *gradientLayer;
@property (nonatomic, strong) CABasicAnimation *rotation;
@property (nonatomic, assign) CGFloat currentValue;
@end

@implementation BJRingtLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    //创建背景圆环
    CAShapeLayer *trackLayer = [CAShapeLayer layer];
    trackLayer.frame = self.bounds;
    //清空填充色
    trackLayer.fillColor = [UIColor clearColor].CGColor;
    //设置画笔颜色 即圆环背景色
    trackLayer.strokeColor =  [UIColor colorWithRed:((float) 216 / 255.0f) green:((float) 231 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor;
    trackLayer.lineWidth = 4;
    //设置画笔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 - 2 startAngle:- M_PI_2 endAngle:-M_PI_2 + M_PI * 2 clockwise:YES];

    //path 决定layer将被渲染成何种形状
    trackLayer.path = path.CGPath;
    [self.layer addSublayer:trackLayer];
    
    
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 - 2 startAngle:M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = [UIColor redColor].CGColor;
    _progressLayer.lineCap = kCALineCapRound;//加了半个圆
    _progressLayer.lineWidth = 4;
    _progressLayer.path = progressPath.CGPath;
    _progressLayer.strokeEnd = 1;
    
    
    //CAShapeLayer不能顺着弧线进行渐变只能指定两个点之间进行渐变。
    //startPoint和endPoint属性，他们决定了渐变的方向。这两个参数是以单位坐标系进行的定义，所以左上角坐标是{0, 0}，右下角坐标是{1, 1}
    //startPoint和pointEnd 分别指定颜色变换的起始位置和结束位置.
    //当开始和结束的点的x值相同时, 颜色渐变的方向为纵向变化
    //当开始和结束的点的y值相同时, 颜色渐变的方向为横向变化
    //其余的 颜色沿着对角线方向变化
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;

    _gradientLayer = [CALayer layer];
    _gradientLayer.frame = self.bounds;

    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, width/2.0,  height);
    gradientLayer1.colors = @[(__bridge id)[UIColor colorWithRed:((float) 116 / 255.0f) green:((float) 162 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:((float) 216 / 255.0f) green:((float) 231 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor];
    gradientLayer1.startPoint = CGPointMake(0, 0);
    gradientLayer1.endPoint = CGPointMake(0, 1);
    [_gradientLayer addSublayer:gradientLayer1];

//    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
//    gradientLayer2.frame = CGRectMake(width/2.0, width/2.0, width/2.0,  height/2.0);
//    gradientLayer2.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor];
//    [gradientLayer2 setLocations:@[@0.3, @0.8,@1]];
//    gradientLayer2.startPoint = CGPointMake(0, 0);
//    gradientLayer2.endPoint = CGPointMake(0, 1);
//    [gradientLayer addSublayer:gradientLayer2];

    CAGradientLayer *gradientLayer3 = [CAGradientLayer layer];
    gradientLayer3.frame = CGRectMake(width/2.0, height/2.0, width/2.0,  height/2.0);
    gradientLayer3.colors = @[(__bridge id)[UIColor colorWithRed:((float) 216 / 255.0f) green:((float) 231 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:((float) 216 / 255.0f) green:((float) 231 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor];
    gradientLayer3.startPoint = CGPointMake(0.5, 0.8);
    gradientLayer3.endPoint = CGPointMake(0.5, 0);
    [_gradientLayer addSublayer:gradientLayer3];

    CAGradientLayer *gradientLayer4 = [CAGradientLayer layer];
    gradientLayer4.frame = CGRectMake(width/2.0, 0, width/2.0,  height/2.0);
    gradientLayer4.colors = @[(__bridge id)[UIColor colorWithRed:((float) 116 / 255.0f) green:((float) 162 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:((float) 116 / 255.0f) green:((float) 162 / 255.0f) blue:((float) 255 / 255.0f) alpha:1.0].CGColor];
    gradientLayer4.startPoint = CGPointMake(0.5, 1);
    gradientLayer4.endPoint = CGPointMake(0.5, 0.8);
    [_gradientLayer addSublayer:gradientLayer4];

    _gradientLayer.mask = _progressLayer;
    [self.layer addSublayer:_gradientLayer];

    //!< 旋转动画
    _rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [_rotation setFromValue:@(0)];
//    [_rotation setByValue:@(M_PI*2)];
    [_rotation setToValue:@(M_PI*2)];
    [_rotation setDuration:1.0];
    [_rotation setRepeatCount:MAXFLOAT];
//    [_rotation setRemovedOnCompletion:NO];
//    [_rotation setFillMode:kCAFillModeForwards];

    [_gradientLayer addAnimation:_rotation forKey:@"rotation"];
}


- (void)resumeAnimation{
    
    CFTimeInterval pausedTime = _gradientLayer.timeOffset;
    // 1. 让CALayer的时间继续行走
    _gradientLayer.speed = 1.0;
    // 2. 取消上次记录的停留时刻
    _gradientLayer.timeOffset = 0.0;
    // 3. 取消上次设置的时间
    _gradientLayer.beginTime = 0.0;
    // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
    CFTimeInterval timeSincePause = [_gradientLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
    _gradientLayer.beginTime = timeSincePause;
    
}

- (void)pauseAnimation{
    
    CFTimeInterval pausedTime = [_gradientLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    // 让CALayer的时间停止走动
    _gradientLayer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    _gradientLayer.timeOffset = pausedTime;

//    [_gradientLayer removeAnimationForKey:@"rotation"];
}

@end

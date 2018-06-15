//
//  BJLoadingView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/15.
//  Copyright © 2018年 ll. All rights reserved.
//

static CGFloat kWavePositionDuration = 5;

typedef NS_ENUM(NSInteger ,BJWavePathType) {
    BJWavePathType_Sin,
    BJWavePathType_Cos
};

#import "BJLoadingView.h"

@interface BJLoadingView ()
@property (nonatomic, strong) CAShapeLayer *waveSinLayer;
@property (nonatomic, strong) CAShapeLayer *waveCosLayer;


@property (nonatomic, strong) UIImageView *grayImageView;
@property (nonatomic, strong) UIImageView *sineImageView;
@property (nonatomic, strong) UIImageView *cosineImageView;

@property (nonatomic, strong) CADisplayLink *displayLink;


//波浪相关的参数
@property (nonatomic, assign) CGFloat waveWidth;
@property (nonatomic, assign) CGFloat waveHeight;
@property (nonatomic, assign) CGFloat waveMid;
@property (nonatomic, assign) CGFloat maxAmplitude;

@property (nonatomic, assign) CGFloat frequency;
@property (nonatomic, assign) CGFloat phaseShift;
@property (nonatomic, assign) CGFloat phase;
@end

@implementation BJLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self bulidUI];
    }
    return self;
}

- (void)bulidUI{
    
    _waveSinLayer = [CAShapeLayer layer];
    _waveSinLayer.backgroundColor = [UIColor clearColor].CGColor;
    _waveSinLayer.fillColor = [UIColor greenColor].CGColor;
    _waveSinLayer.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
    
    _waveCosLayer = [CAShapeLayer layer];
    _waveCosLayer.backgroundColor = [UIColor clearColor].CGColor;
    _waveCosLayer.fillColor = [UIColor blueColor].CGColor;
    _waveCosLayer.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
    
    
    _waveWidth = CGRectGetWidth(self.bounds);
    _waveHeight = CGRectGetHeight(self.bounds) * 0.5;
    _waveMid = _waveWidth / 2.0f;
    _maxAmplitude = _waveHeight * 0.3;
    _phaseShift = 8;
    _frequency = .3;
    
    _grayImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _grayImageView.image = [UIImage imageNamed:@"du.png"];
    [self addSubview:_grayImageView];
    
    _cosineImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _cosineImageView.image = [UIImage imageNamed:@"gray.png"];
    [self addSubview:_cosineImageView];
    
    _sineImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _sineImageView.image = [UIImage imageNamed:@"blue.png"];
    [self addSubview:_sineImageView];
    
    _sineImageView.layer.mask = _waveSinLayer;
    _cosineImageView.layer.mask = _waveCosLayer;
    
}


- (void)startLoading{
    [_displayLink invalidate];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWaveAction:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    CGPoint position = _waveSinLayer.position;
    position.y = position.y - self.bounds.size.height - 10;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:_waveSinLayer.position];
    animation.toValue = [NSValue valueWithCGPoint:position];
    animation.duration = kWavePositionDuration;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    
    [_waveSinLayer addAnimation:animation forKey:@"positionWave"];
    [_waveCosLayer addAnimation:animation forKey:@"positionWave"];

}

- (void)stopLoading{
    [self.displayLink invalidate];
    [self.waveSinLayer removeAllAnimations];
    [self.waveCosLayer removeAllAnimations];
    self.waveSinLayer.path = nil;
    self.waveCosLayer.path = nil;
}



- (void)updateWaveAction:(CADisplayLink *)displayLink{
    self.phase += self.phaseShift;
    
    self.waveSinLayer.path = [self createWavePathWithType:BJWavePathType_Sin].CGPath;
    self.waveCosLayer.path = [self createWavePathWithType:BJWavePathType_Cos].CGPath;
}


- (UIBezierPath *)createWavePathWithType:(BJWavePathType)pathType{
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x < self.waveWidth + 1; x++) {
        endX = x;
        CGFloat y = 0;
//        if (pathType == BJWavePathType_Sin) {
//            y = _maxAmplitude * sinf(360.0 / _waveWidth * (x * M_PI / 180) * _frequency + _phase * M_PI / 180 ) + _maxAmplitude;
//        }else{
//            y = _maxAmplitude * cosf(360.0 / _waveWidth * (x * M_PI / 180) * _frequency + _phase * M_PI / 180) * _maxAmplitude;
//        }
        if (pathType == BJWavePathType_Sin) {
            y = self.maxAmplitude * sinf(360.0 / _waveWidth * (x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        } else {
            y = self.maxAmplitude * cosf(360.0 / _waveWidth *(x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        }
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        }else{
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];
    
    return wavePath;
}






@end

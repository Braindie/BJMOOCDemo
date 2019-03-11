//
//  BJWaveView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/6/15.
//  Copyright © 2018年 ll. All rights reserved.
//

typedef NS_ENUM(NSInteger, BJWavePathType) {
    BJWavePathTypeLineOne,
    BJWavePathTypeLineTwo
};


#import "BJWaveView.h"

@interface BJWaveView ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) CAShapeLayer *shapeOneLayer;
@property (nonatomic, strong) CAShapeLayer *shapeTwoLayer;


@property (nonatomic, assign) CGFloat waveWidth;
@property (nonatomic, assign) CGFloat maxAmplitude;//!< 振幅
@property (nonatomic, assign) CGFloat frequency;//!< 频率
@property (nonatomic, assign) CGFloat phase;


@end

@implementation BJWaveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    self.waveWidth = self.bounds.size.width;
    self.maxAmplitude = 30;
    self.frequency = .5;
    
    self.shapeOneLayer = [CAShapeLayer layer];
    self.shapeOneLayer.fillColor = [UIColor colorWithRed:147/255.0 green:231/255.0 blue:182/255.0 alpha:1].CGColor;
    self.shapeOneLayer.strokeColor = [UIColor colorWithRed:147/255.0 green:231/255.0 blue:182/255.0 alpha:1].CGColor;
    [self.layer addSublayer:self.shapeOneLayer];
    
    self.shapeTwoLayer = [CAShapeLayer layer];
    self.shapeTwoLayer.fillColor = [UIColor colorWithRed:174/255.0 green:231/255.0 blue:182/255.0 alpha:1].CGColor;
    self.shapeTwoLayer.strokeColor = [UIColor colorWithRed:174/255.0 green:231/255.0 blue:182/255.0 alpha:1].CGColor;
    [self.layer addSublayer:self.shapeTwoLayer];
    
}


- (void)startLoading
{
//    iOS设备的屏幕刷新频率是固定的，CADisplayLink在正常情况下会在每次刷新结束都被调用，精确度相当高。
//    NSTimer的精确度就显得低了点，比如NSTimer的触发时间到的时候，runloop如果在阻塞状态，触发时间就会推迟到下一个runloop周期。
    [_displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(updateWave:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSRunLoopCommonModes];
}

- (void)stopLoading{
    _displayLink.paused = YES;
    [_displayLink invalidate];
    _displayLink = nil;
}

- (void)updateWave:(CADisplayLink *)displayLink
{
    NSLog(@"--");
    self.phase += 3;//逐渐累加初相
    self.shapeOneLayer.path = [self createPath:BJWavePathTypeLineOne].CGPath;
    self.shapeTwoLayer.path = [self createPath:BJWavePathTypeLineTwo].CGPath;
}

- (UIBezierPath *)createPath:(BJWavePathType)type
{
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x < self.waveWidth + 1; x += 1) {
        endX=x;
        CGFloat y = 0;
        if (type == BJWavePathTypeLineOne) {
            y = self.maxAmplitude * sinf(360.0 / _waveWidth * (x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        }else if (type == BJWavePathTypeLineTwo){
            y = self.maxAmplitude * cosf(360.0 / _waveWidth * (x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        }
        
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        } else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];
    
    return wavePath;
}


@end

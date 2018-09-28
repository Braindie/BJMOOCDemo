//
//  SecondListViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/9/28.
//  Copyright © 2018 ll. All rights reserved.
//

#import "SecondListViewController.h"

@interface SecondListViewController ()
@property (nonatomic, strong) UIView *animationView;
@end

@implementation SecondListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.animationType;
    
    self.isCustomBack = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 100, 200, 150)];
    self.animationView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.animationView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapAction{
    if ([self.animationType isEqualToString:@"大小动画"]) {
        CGRect originRect = self.animationView.frame;
        CGRect rect = CGRectMake(self.animationView.frame.origin.x-20, self.animationView.frame.origin.y-20, 240, 190);
        [UIView animateWithDuration:1 animations:^{
            self.animationView.frame = rect;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                self.animationView.frame = originRect;
            }];
        }];
    }else if ([self.animationType isEqualToString:@"拉伸动画"]){
        CGRect originBounds = self.animationView.bounds;
        //尽管这个rect的x，y跟原始的不同，但动画也只是改变了宽高
        CGRect rect = CGRectMake(0, 0, 300, 100);
        [UIView animateWithDuration:1 animations:^{
            self.animationView.bounds = rect;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                self.animationView.bounds = originBounds;
            }];
        }];
    }else if ([self.animationType isEqualToString:@"转移动画"]){
        CGPoint originalPoint = self.animationView.center;
        CGPoint point = CGPointMake(self.animationView.center.x, self.animationView.center.y+100);
        [UIView animateWithDuration:1 animations:^{
            self.animationView.center = point;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                self.animationView.center = originalPoint;
            }];
        }];
  
    }else if ([self.animationType isEqualToString:@"旋转动画"]){
        
        CGAffineTransform originTransform = self.animationView.transform;
        [UIView animateWithDuration:2 animations:^{
            self.animationView.transform = CGAffineTransformMakeRotation(5.0f);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                self.animationView.transform = originTransform;
            }];
        }];
        
    }else if ([self.animationType isEqualToString:@"透明度动画"]){
        
        [UIView animateWithDuration:2 animations:^{
            self.animationView.alpha = 0.3;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                self.animationView.alpha = 1;
            }];
            
        }];
    
    }else if ([self.animationType isEqualToString:@"Keyframe"]){
        
        [UIView animateKeyframesWithDuration:9.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
                self.animationView.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
            }];
            [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
                self.animationView.backgroundColor = [UIColor colorWithRed:0.1064 green:0.6052 blue:0.0334 alpha:1.0];
            }];
            [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
                self.animationView.backgroundColor = [UIColor colorWithRed:0.1366 green:0.3017 blue:0.8411 alpha:1.0];
            }];
            [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
                self.animationView.backgroundColor = [UIColor colorWithRed:0.619 green:0.037 blue:0.6719 alpha:1.0];
            }];
            [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
                self.animationView.backgroundColor = [UIColor whiteColor];
            }];
        } completion:^(BOOL finished) {
            NSLog(@"动画结束");
        }];
        
        /**
         *   UIViewKeyframeAnimationOptions
         */
//        UIViewAnimationOptionLayoutSubviews           //进行动画时布局子控件
//        UIViewAnimationOptionAllowUserInteraction     //进行动画时允许用户交互
//        UIViewAnimationOptionBeginFromCurrentState    //从当前状态开始动画
//        UIViewAnimationOptionRepeat                   //无限重复执行动画
//        UIViewAnimationOptionAutoreverse              //执行动画回路
//        UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
//        UIViewAnimationOptionOverrideInheritedOptions //不继承父动画设置
//
//        UIViewKeyframeAnimationOptionCalculationModeLinear     //运算模式 :连续
//        UIViewKeyframeAnimationOptionCalculationModeDiscrete   //运算模式 :离散
//        UIViewKeyframeAnimationOptionCalculationModePaced      //运算模式 :均匀执行
//        UIViewKeyframeAnimationOptionCalculationModeCubic      //运算模式 :平滑
//        UIViewKeyframeAnimationOptionCalculationModeCubicPaced //运算模式 :平滑均匀
        
        
    }else if ([self.animationType isEqualToString:@"Spring"]){
        CGRect originRect = self.animationView.frame;
        CGRect rect = CGRectMake(self.animationView.frame.origin.x, self.animationView.frame.origin.y+100, 200, 150);
        [UIView animateWithDuration:0.4//动画持续时间
                              delay:0//动画延迟执行的时间
             usingSpringWithDamping:0.5//震动效果，范围0~1，数值越小震动效果越明显
              initialSpringVelocity:4//初始速度，数值越大初始速度越快
                            options:UIViewAnimationOptionCurveLinear//动画的过渡效果
                         animations:^{
            self.animationView.frame = rect;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
                self.animationView.frame = originRect;
            } completion:^(BOOL finished) {
                
            }];
        }];
        
//        [UIView animateWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
        
    }else if ([self.animationType isEqualToString:@"Transition"]){
        
        [UIView transitionWithView:self.animationView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
        } completion:^(BOOL finished) {
            [UIView transitionWithView:self.animationView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                
            } completion:^(BOOL finished) {
                
            }];
        }];

        /**
         *   UIViewAnimationOptions
         */
//        UIViewAnimationOptionLayoutSubviews            //进行动画时布局子控件
//        UIViewAnimationOptionAllowUserInteraction      //进行动画时允许用户交互
//        UIViewAnimationOptionBeginFromCurrentState     //从当前状态开始动画
//        UIViewAnimationOptionRepeat                    //无限重复执行动画
//        UIViewAnimationOptionAutoreverse               //执行动画回路
//        UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
//        UIViewAnimationOptionOverrideInheritedCurve    //忽略嵌套动画的曲线设置
//        UIViewAnimationOptionAllowAnimatedContent      //转场：进行动画时重绘视图
//        UIViewAnimationOptionShowHideTransitionViews   //转场：移除（添加和移除图层的）动画效果
//        UIViewAnimationOptionOverrideInheritedOptions  //不继承父动画设置
//
//        UIViewAnimationOptionCurveEaseInOut            //时间曲线，慢进慢出（默认值）
//        UIViewAnimationOptionCurveEaseIn               //时间曲线，慢进
//        UIViewAnimationOptionCurveEaseOut              //时间曲线，慢出
//        UIViewAnimationOptionCurveLinear               //时间曲线，匀速
//
//        UIViewAnimationOptionTransitionNone            //转场，不使用动画
//        UIViewAnimationOptionTransitionFlipFromLeft    //转场，从左向右旋转翻页
//        UIViewAnimationOptionTransitionFlipFromRight   //转场，从右向左旋转翻页
//        UIViewAnimationOptionTransitionCurlUp          //转场，下往上卷曲翻页
//        UIViewAnimationOptionTransitionCurlDown        //转场，从上往下卷曲翻页
//        UIViewAnimationOptionTransitionCrossDissolve   //转场，交叉消失和出现
//        UIViewAnimationOptionTransitionFlipFromTop     //转场，从上向下旋转翻页
//        UIViewAnimationOptionTransitionFlipFromBottom  //转场，从下向上旋转翻页
        

    }
    
}



@end

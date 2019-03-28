//
//  BJTouchTestView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/8.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTouchTestView.h"

@implementation BJTouchTestView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    
    //事件拦截一：调用下一个事件响应者的触摸方法
//    [self.nextResponder touchesBegan:touches withEvent:event];
    //下面的和上面的效果一样
//    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}


//模拟hitTest执行场景
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //判断是否合格
    if (!self.hidden && self.alpha > 0.01 && self.isUserInteractionEnabled) {
        
        //判断点击位置是否在自己区域内
        if ([self pointInside:point withEvent:event]) {
            
            NSArray<UIView *> * superViews = self.subviews;
            NSLog(@"共有%lu个子视图",(unsigned long)superViews.count);
            
            UIView *attachedView;
            
            for (NSInteger i = superViews.count - 1; i >= 0; i--) {
                UIView *subView  = superViews[i];
                
                //基于子视图的坐标
                CGPoint subPoint = [self convertPoint:point toView:subView];
                
                //判断点击位置是否在这个子视图上
                BOOL isTouchThisView = [subView pointInside:subPoint withEvent:event];
                if (isTouchThisView) {
                    NSLog(@"点击了这个子视图%@",subView);
                }
                
                //对子view进行hitTest,如果点击在子视图上就返回子视图,对子视图进行hitTest
                attachedView =  [subView hitTest:subPoint withEvent:event];
                if (attachedView){
                    return attachedView;//1、如果返回一个View，说明点击了该子视图，直接返回该子视图
                }
            }
            return self;//2、所有子视图都没有，对象本身
        }
    }
    return nil;//3、如果图像隐藏、透明度大于0、不可点击返回nil
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL isPoint = CGRectContainsPoint(self.bounds, point);
    //    NSLog(@"%d",isPoint);
    return isPoint;
}

@end

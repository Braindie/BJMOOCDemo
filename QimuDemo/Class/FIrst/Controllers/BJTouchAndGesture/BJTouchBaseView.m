//
//  BJTouchBaseView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/8.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTouchBaseView.h"
#import "BJTouchSupperpassView.h"

@interface BJTouchBaseView ()
@property (nonatomic, strong) BJTouchSupperpassView *supperpassView;
@end

@implementation BJTouchBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.supperpassView = [[BJTouchSupperpassView alloc] initWithFrame:CGRectMake(250, 0, 100, 100)];
        self.supperpassView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.supperpassView];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//        [self addGestureRecognizer:tap];
        
        //设置为NO后，手势就不会影响触摸了
//        tap.cancelsTouchesInView = NO;
    }
    return self;
}

//- (void)tapAction{
//    NSLog(@"===> testTap");
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
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






//Hit-Testing是一个递归的过程，每一步监测触摸位置是否在当前view中，如果是，就递归监测subviews；否则，返回nil。

//模拟hitTest执行场景
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    //判断是否合格
//     if (!self.hidden && self.alpha > 0.01 && self.isUserInteractionEnabled) {
//
//         /**
//          *   事件转发：：：：：：虽然点击区域没在父视图区域，但重写父视图的方法，返回子控件，也能实现点击穿越
//          */
//         //转换坐标到中间按钮,生成一个新的点
//         CGPoint pointInCenterBtn = [self convertPoint:point toView:self.supperpassView];
//         //判断  如果该点是在中间按钮,那么处理事件最合适的View,就是这个button
//         if ([self.supperpassView pointInside:pointInCenterBtn withEvent:event]) {
//             return self.supperpassView;
//         }
//
//        //判断点击位置是否在自己区域内
//        if ([self pointInside:point withEvent:event]) {
//
//            NSArray<UIView *> * superViews = self.subviews;
//            NSLog(@"共有%lu个子视图",(unsigned long)superViews.count);
//
//            UIView *attachedView;
//
//            for (NSInteger i = superViews.count - 1; i >= 0; i--) {
//                UIView *subView  = superViews[i];
//
//                //基于子视图的坐标
//                CGPoint subPoint = [self convertPoint:point toView:subView];
//
//                //判断点击位置是否在这个子视图上
//                BOOL isTouchThisView = [subView pointInside:subPoint withEvent:event];
//                if (isTouchThisView) {
//                    NSLog(@"点击了这个子视图%@",subView);
//                }
//
//                //对子view进行hitTest,如果点击在子视图上就返回子视图,对子视图进行hitTest
//                attachedView =  [subView hitTest:subPoint withEvent:event];
//                if (attachedView){
//                    return attachedView;//1、如果返回一个View，说明点击了该子视图，直接返回该子视图
//                }
//            }
//            return self;//2、所有子视图都没有，对象本身
//        }
//    }
//    return nil;//3、如果图像隐藏、透明度大于0、不可点击返回nil
//}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    //事件拦截二：直接返回自身，自身成为第一响应者，子视图不再接受事件
//    if ([self pointInside:point withEvent:event]) {
//        return self;
//    }
//    return nil;
//}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    BOOL isPoint = CGRectContainsPoint(self.bounds, point);
////    NSLog(@"%d",isPoint);
//    return isPoint;
//}


@end

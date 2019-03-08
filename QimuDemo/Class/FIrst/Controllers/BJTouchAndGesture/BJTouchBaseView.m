//
//  BJTouchBaseView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/8.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTouchBaseView.h"

@implementation BJTouchBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        
        //设置为NO后，手势就不会影响触摸了
//        tap.cancelsTouchesInView = NO;
    }
    return self;
}

- (void)tapAction{
    NSLog(@"===> testTap");
}


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
//    if (!self.hidden && self.alpha > 0.01 && self.isUserInteractionEnabled) {
//
//        //判断点击位置是否在自己区域内
//        if ([self pointInside:point withEvent:event]) {
//            UIView *attachedView;
//            for (int i = self.subviews.count - 1; i >= 0; i--) {
//                UIView *view  = self.subviews[i];
//
//                BOOL isTouchThisView = [view pointInside:point withEvent:event];//判断点击位置是否在自己区域内
//                NSLog(@"%@ ==> %d",view,isTouchThisView);
//
//                //对子view进行hitTest,如果点击在子视图上就返回子视图,对子视图进行hitTest
//                attachedView =  [view hitTest:point withEvent:event];
//                if (attachedView)
//                    break;
//            }
//            if (attachedView)  {
//                return attachedView;
//            } else {
//                return self;
//            }
//        }
//    }
//    return nil;
//}



@end

//
//  XBASTableNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import "XBASTableNode.h"



@implementation XBASTableNode


/**
 同时识别多个手势

 @param gestureRecognizer gestureRecognizer description
 @param otherGestureRecognizer otherGestureRecognizer description
 @return return value description
 */
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"实现了");
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}
@end

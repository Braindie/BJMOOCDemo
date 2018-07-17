//
//  UIView+BJExtension.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/17.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "UIView+BJExtension.h"

@implementation UIView (BJExtension)

- (void)setBj_x:(CGFloat)bj_x{
    CGRect frame = self.frame;
    frame.origin.x = bj_x;
    self.frame = frame;
}

- (CGFloat)bj_x{
    return self.frame.origin.x;
}


- (void)setBj_y:(CGFloat)bj_y{
    CGRect frame = self.frame;
    frame.origin.y = bj_y;
    self.frame = frame;
}

- (CGFloat)bj_y{
    return self.frame.origin.y;
}


- (void)setBj_w:(CGFloat)bj_w{
    CGRect frame = self.frame;
    frame.size.width = bj_w;
    self.frame = frame;
}

- (CGFloat)bj_w{
    return self.frame.size.width;
}


- (void)setBj_h:(CGFloat)bj_h{
    CGRect frame = self.frame;
    frame.size.height = bj_h;
    self.frame = frame;
}

- (CGFloat)bj_h{
    return self.frame.size.height;
}


- (void)setBj_size:(CGSize)bj_size{
    CGRect frame = self.frame;
    frame.size = bj_size;
    self.frame = frame;
}

- (CGSize)bj_size{
    return self.frame.size;
}


- (void)setBj_origin:(CGPoint)bj_origin{
    CGRect frame = self.frame;
    frame.origin = bj_origin;
    self.frame = frame;
}

- (CGPoint)bj_origin{
    return self.frame.origin;
}

@end

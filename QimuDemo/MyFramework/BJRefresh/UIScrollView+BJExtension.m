//
//  UIScrollView+BJExtension.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "UIScrollView+BJExtension.h"

@implementation UIScrollView (BJExtension)

- (UIEdgeInsets)bj_inset{
    return self.contentInset;
}


- (void)setBj_insetTop:(CGFloat)bj_insetTop{
    UIEdgeInsets inset = self.contentInset;
    inset.top = bj_insetTop;
    self.contentInset = inset;
}

- (CGFloat)bj_insetTop{
    return self.bj_inset.top;
}


- (void)setBj_insetBottom:(CGFloat)bj_insetBottom{
    UIEdgeInsets inset = self.contentInset;
    inset.top = bj_insetBottom;
    self.contentInset = inset;
}

- (CGFloat)bj_insetBottom{
    return self.bj_inset.bottom;
}


- (void)setBj_insetLeft:(CGFloat)bj_insetLeft{
    UIEdgeInsets inset = self.contentInset;
    inset.left = bj_insetLeft;
    self.contentInset = inset;
}

- (CGFloat)bj_insetLeft{
    return self.bj_inset.left;
}


- (void)setBj_insetRight:(CGFloat)bj_insetRight{
    UIEdgeInsets inset = self.contentInset;
    inset.right = bj_insetRight;
    self.contentInset = inset;
}

- (CGFloat)bj_insetRight{
    return self.bj_inset.right;
}




- (void)setBj_offsetX:(CGFloat)bj_offsetX{
    CGPoint offset = self.contentOffset;
    offset.x = bj_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)bj_offsetX{
    return self.contentOffset.x;
}


- (void)setBj_offsetY:(CGFloat)bj_offsetY{
    CGPoint offset = self.contentOffset;
    offset.y = bj_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)bj_offsetY{
    return self.contentOffset.y;
}



- (void)setBj_contentW:(CGFloat)bj_contentW{
    CGSize size = self.contentSize;
    size.width = bj_contentW;
    self.contentSize = size;
}

- (CGFloat)bj_contentW{
    return self.contentSize.width;
}


- (void)setBj_contentH:(CGFloat)bj_contentH{
    CGSize size = self.contentSize;
    size.height = bj_contentH;
    self.contentSize = size;
}

- (CGFloat)bj_contentH{
    return self.contentSize.height;
}




@end

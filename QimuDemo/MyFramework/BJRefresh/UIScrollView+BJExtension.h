//
//  UIScrollView+BJExtension.h
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (BJExtension)

@property (nonatomic, readonly) UIEdgeInsets bj_inset;

@property (nonatomic, assign) CGFloat bj_insetTop;
@property (nonatomic, assign) CGFloat bj_insetBottom;
@property (nonatomic, assign) CGFloat bj_insetLeft;
@property (nonatomic, assign) CGFloat bj_insetRight;

@property (nonatomic, assign) CGFloat bj_offsetX;
@property (nonatomic, assign) CGFloat bj_offsetY;

@property (nonatomic, assign) CGFloat bj_contentW;
@property (nonatomic, assign) CGFloat bj_contentH;



@end

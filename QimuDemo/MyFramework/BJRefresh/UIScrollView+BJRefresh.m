//
//  UIScrollView+BJRefresh.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/16.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "UIScrollView+BJRefresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (BJRefresh)

#pragma mark - header
static const char BJRefreshHeaderKey = '\0';
- (void)setBj_header:(BJRefreshHeader *)bj_header{
    if (bj_header != self.bj_header) {
        [self insertSubview:bj_header atIndex:0];
        
        objc_setAssociatedObject(self, &BJRefreshHeaderKey, bj_header, OBJC_ASSOCIATION_RETAIN);
    }
}

- (BJRefreshHeader *)bj_header{
    return objc_getAssociatedObject(self, &BJRefreshHeaderKey);
}


@end

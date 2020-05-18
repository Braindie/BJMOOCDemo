//
//  BJTableView.m
//  QimuDemo
//
//  Created by 张文军 on 2020/4/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJTableView.h"

@interface BJTableView ()<UITableViewDelegate>

@end

@implementation BJTableView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.delegate = self;
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"封装的方法");
}

@end

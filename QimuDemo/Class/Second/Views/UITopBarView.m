//
//  UITopBarView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "UITopBarView.h"

@implementation UITopBarView



- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法

    if (self) {

//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifAction:) name:@"changedNotification1" object:nil];
//
//        // 再自定义该类（UIView子类）的初始化操作。
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
//        label.backgroundColor = [UIColor blueColor];
//        label.textColor = [UIColor blackColor];
//
//
//
//        [self addSubview:label];
        [self initView];

    }
    
    return self;
    
}

- (void)initView{


    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, self.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:lineView];

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-100, 5, 200, 40)];
//    self.label.backgroundColor = [UIColor greenColor];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];

}


//- (void)notifAction:(NSNotification *)notif{
//
//
//}


- (void)updateData{

    
}


@end

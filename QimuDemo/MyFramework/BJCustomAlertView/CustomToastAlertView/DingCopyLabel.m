//
//  DingCopyLabel.m
//  DingDingLive
//
//  Created by jiwanke.nimo on 17/3/4.
//  Copyright © 2017年 jiwanke.nimo. All rights reserved.
//

#import "DingCopyLabel.h"

@implementation DingCopyLabel
//绑定事件
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTouch];
    }
    return self;
}

-(void)addTouch{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self                action:@selector(addgesture:)];
    [self addGestureRecognizer:touch];
}

-(void)addgesture:(UILongPressGestureRecognizer*) recognizer{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

// default is NO
- (BOOL)canBecomeFirstResponder{
    return YES;
}

//"反馈"关心的功能
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}

//针对于copy的实现
-(void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

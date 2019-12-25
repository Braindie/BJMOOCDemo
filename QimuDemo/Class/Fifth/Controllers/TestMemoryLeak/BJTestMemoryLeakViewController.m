//
//  BJTestMemoryLeakViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2019/12/25.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTestMemoryLeakViewController.h"

@interface BJTestMemoryLeakViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation BJTestMemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerAction:timer];
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)dealloc
{
    NSLog(@"销毁了");
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark -
- (void)timerAction:(NSTimer *)timer{
    NSLog(@"1");
}


@end

//
//  HomeViewCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/3.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (id)sharedInit {
    [self setup];
    return self;
}

- (void)setup {
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self.contentView addSubview:self.button];
    self.button.userInteractionEnabled = NO;
//    [self.button generalStyle];
//    [self.button homeStyle];
    //    [self.button redStyle];
}

@end






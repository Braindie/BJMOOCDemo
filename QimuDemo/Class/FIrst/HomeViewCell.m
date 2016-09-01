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
    self.button.frame = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.width/2, self.bounds.size.height/2);
    [self.contentView addSubview:self.button];
//    [self.button generalStyle];
//    [self.button homeStyle];
    //    [self.button redStyle];
}

@end






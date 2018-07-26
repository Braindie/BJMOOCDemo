//
//  MenuBTSectionHeaderView.m
//  CaiBaiTongApp
//
//  Created by zhangwenjun on 16/10/18.
//  Copyright © 2016年 irobin. All rights reserved.
//

#import "MenuBTSectionHeaderView.h"

@implementation MenuBTSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width, self.frame.size.height)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor grayColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}
@end

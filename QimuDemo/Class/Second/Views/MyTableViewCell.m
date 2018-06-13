//
//  MyTableViewCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addView];
    }
    return self;
}


- (void)addView{

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH-40, 50)];
//    self.label.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.label];
}

@end

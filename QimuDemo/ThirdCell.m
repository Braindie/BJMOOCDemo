//
//  ThirdCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdCell.h"

@implementation ThirdCell

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

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 50)];
//    self.label.backgroundColor = [UIColor orangeColor];
//    self.label.text = [self.dictionary objectForKey:@"title"];
    [self addSubview:self.label];
}


@end

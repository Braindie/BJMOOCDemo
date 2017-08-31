//
//  FourthCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "FourthCell.h"

@implementation FourthCell

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

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 300, 50)];
    self.label.backgroundColor = [UIColor orangeColor];
    //    self.label.text = [self.dictionary objectForKey:@"title"];
    [self addSubview:self.label];
}



@end

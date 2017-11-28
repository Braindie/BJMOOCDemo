//
//  MyCourseHeaderView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCourseHeaderView.h"
#import "UIImageView+WebCache.h"

@implementation MyCourseHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView{

    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
//    [headerView setImage:[UIImage imageNamed:@"headerView.png"]];
    [headerView sd_setImageWithURL:[NSURL URLWithString:@"http://picture.youth.cn/qtdb/201705/W020170509396200729137.jpg"] placeholderImage:[UIImage imageNamed:@"headerView.png"]];

    [self addSubview:headerView];


    UIButton *downBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 100, 205, 40, 40)];
    [downBtn setImage:[UIImage imageNamed:@"downBtn.png"] forState:UIControlStateNormal];
    [self addSubview:downBtn];

    UIButton *collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 205, 40, 40)];
    [collectBtn setImage:[UIImage imageNamed:@"collectioBtn.png"] forState:UIControlStateNormal];
    [self addSubview:collectBtn];





    UIView *fooderView = [[UIView alloc] initWithFrame:CGRectMake(0, 250, self.frame.size.width, 100)];
    fooderView.backgroundColor = [UIColor colorWithRed:247/256 green:249/256 blue:251/256 alpha:.05];
    [self addSubview:fooderView];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, self.frame.size.width - 50, 50)];
    titleLabel.text = @"基于终端能力的产品创新基于终端能力的产品创新";
    titleLabel.numberOfLines = 2;
//    titleLabel.backgroundColor = [UIColor blueColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    [fooderView addSubview:titleLabel];

    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 150, 15)];
    typeLabel.textColor = [UIColor lightGrayColor];
    typeLabel.text = @"课程分类：职业素养";
    typeLabel.font = [UIFont systemFontOfSize:14];
    [fooderView addSubview:typeLabel];

    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 160, 75, 150, 15)];
    timeLabel.textColor = [UIColor lightGrayColor];
    timeLabel.text = @"时长：54:00(分钟)";
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.font = [UIFont systemFontOfSize:14];
    [fooderView addSubview:timeLabel];

    UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 40, 20, 35, 35)];
    [moreBtn setImage:[UIImage imageNamed:@"jiantou.png"] forState:UIControlStateNormal];
//    [fooderView addSubview:moreBtn];
}

@end

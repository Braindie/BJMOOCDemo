//
//  ThirdHeaderView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdHeaderView.h"

@implementation ThirdHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView{

    //视频
    UIView *movieView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    movieView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:movieView];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(self.frame.size.width/2- 40, 55, 80, 80);
    [imageView setImage:[UIImage imageNamed:@"play.png"]];
    [movieView addSubview:imageView];
    UILabel *movieLabel = [[UILabel alloc] init];
    movieLabel.frame = CGRectMake(self.frame.size.width/2-100, 150, 200, 30);
    movieLabel.textAlignment = NSTextAlignmentCenter;
    movieLabel.font = [UIFont systemFontOfSize:13];
    movieLabel.text = @"即将播放：第一集 琅琊榜";
    [movieView addSubview:movieLabel];


    //简介
    UIView *otherView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.frame.size.width, 100)];
    otherView.backgroundColor = [UIColor whiteColor];
    [self addSubview:otherView];


    UILabel *jianjieLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, 100, 30)];
    jianjieLabel.text = @"简介：";
    [otherView addSubview:jianjieLabel];

    UILabel *groupLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 70, 20)];
    groupLab.font = [UIFont systemFontOfSize:14];
    groupLab.textColor = [UIColor grayColor];
    groupLab.text = @"课程分类:";
    UILabel *groupLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 35, 300, 20)];
    groupLabel.font = [UIFont systemFontOfSize:14];
    groupLabel.text = @"电视剧";
    [otherView addSubview:groupLab];
    [otherView addSubview:groupLabel];



    UILabel *upTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 70, 20)];
    upTimeLabel.font = [UIFont systemFontOfSize:14];
    upTimeLabel.text = @"上传日期：";
    upTimeLabel.textColor = [UIColor grayColor];
    UILabel *upTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 55, 300, 20)];
    upTimeLab.font = [UIFont systemFontOfSize:14];
    upTimeLab.text = @"2015-12-16  已有3279人次观看";
    [otherView addSubview:upTimeLabel];
    [otherView addSubview:upTimeLab];

    UILabel *starLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 70, 20)];
    starLabel.font = [UIFont systemFontOfSize:14];
    starLabel.textColor = [UIColor grayColor];
    starLabel.text = @"课程星级：";
//    UIImageView *starImage = [[UIImageView alloc] initWithFrame:CGRectMake(80, 75, 40, 20)];
    [otherView addSubview:starLabel];

    



    UIButton *timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    timeButton.frame = CGRectMake(self.frame.size.width-40, 30, 30, 40);
    [timeButton setImage:[UIImage imageNamed:@"myJiantou.png"] forState:UIControlStateNormal];
    [timeButton addTarget:self action:@selector(timeAction:) forControlEvents:UIControlEventTouchUpInside];
    [otherView addSubview:timeButton];

}

- (void)timeAction:(UIButton *)button{
    NSLog(@"简介");
    [_delegate openOtherViewCtrl];
}

@end

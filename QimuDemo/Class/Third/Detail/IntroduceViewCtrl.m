//
//  IntroduceViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/16.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "IntroduceViewCtrl.h"

@implementation IntroduceViewCtrl

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"简介";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];

    [self addView];
    
}

- (void)loadData{
    

}

- (void)addView{


    UIView *otherView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    otherView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:otherView];


    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 13, 200, 30)];
    nameLabel.text = @"手机移动学堂测试课件";
    [otherView addSubview:nameLabel];


    UILabel *groupLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 70, 20)];
    groupLab.font = [UIFont systemFontOfSize:14];
    groupLab.textColor = [UIColor grayColor];
    groupLab.text = @"课程分类:";
    UILabel *groupLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 65, 300, 20)];
    groupLabel.font = [UIFont systemFontOfSize:14];
    groupLabel.text = @"电视剧";
    [otherView addSubview:groupLab];
    [otherView addSubview:groupLabel];


    UILabel *hasTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, 70, 20)];
    hasTimeLabel.font = [UIFont systemFontOfSize:14];
    hasTimeLabel.text = @"已学时长：";
    hasTimeLabel.textColor = [UIColor grayColor];
    UILabel *hasTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 85, 300, 20)];
    hasTimeLab.font = [UIFont systemFontOfSize:14];
    hasTimeLab.text = @"小于1（分钟）";
    [otherView addSubview:hasTimeLabel];
    [otherView addSubview:hasTimeLab];


    UILabel *upTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 105, 70, 20)];
    upTimeLabel.font = [UIFont systemFontOfSize:14];
    upTimeLabel.text = @"上传日期：";
    upTimeLabel.textColor = [UIColor grayColor];
    UILabel *upTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 105, 300, 20)];
    upTimeLab.font = [UIFont systemFontOfSize:14];
    upTimeLab.text = @"2015-12-16  已有3279人次观看";
    [otherView addSubview:upTimeLabel];
    [otherView addSubview:upTimeLab];

    UILabel *starLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 125, 70, 20)];
    starLabel.font = [UIFont systemFontOfSize:14];
    starLabel.textColor = [UIColor grayColor];
    starLabel.text = @"课程星级：";
    //    UIImageView *starImage = [[UIImageView alloc] initWithFrame:CGRectMake(80, 75, 40, 20)];
    [otherView addSubview:starLabel];


    UILabel *jianjieLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 165, 50, 20)];
    jianjieLabel.font = [UIFont systemFontOfSize:14];
    jianjieLabel.text = @"简介：";
    jianjieLabel.textColor = [UIColor grayColor];
    UILabel *jianjieLab = [[UILabel alloc] init];
    jianjieLab.numberOfLines = 0;
//    jianjieLab.backgroundColor = [UIColor orangeColor];
    jianjieLab.font = [UIFont systemFontOfSize:14];
    jianjieLab.text = @"这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介这是一段简介";
    CGSize size = [jianjieLab.text sizeWithFont:jianjieLab.font constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    jianjieLab.frame = CGRectMake(50, 165, size.width, size.height);
    [otherView addSubview:jianjieLabel];
    [otherView addSubview:jianjieLab];



}


@end


//
//  ThirdFootView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdFootView.h"

@implementation ThirdFootView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self addView];


    }
    return self;
}



- (void)addView{

    //返回按钮
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 3, 60, 44)];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(3, 3, 44, 44);
//    backButton.titleLabel.text = @"返回";
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    backButton.backgroundColor = [UIColor orangeColor];
    [backButton setImage:[UIImage imageNamed:@"video_back.png"] forState:UIControlStateNormal];
    //设置字体大小
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
//    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);

    //添加事件
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置导航栏上
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self addSubview:backButton];

    //收藏按钮
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(70, 5, 40, 40);
    [collectBtn setImage:[UIImage imageNamed:@"star_cleark.png"] forState:UIControlStateNormal];
    [collectBtn addTarget:self action:@selector(collectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:collectBtn];


    //下载按钮
    UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downloadBtn.frame = CGRectMake(120, 5, 40, 40);
    [downloadBtn setImage:[UIImage imageNamed:@"btn_down_no.png"] forState:UIControlStateNormal];
    [downloadBtn addTarget:self action:@selector(downloadAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:downloadBtn];



    //评论按钮
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentBtn.frame = CGRectMake(self.frame.size.width - 60, 5, 40, 40);
    [commentBtn setImage:[UIImage imageNamed:@"xinxi.png"] forState:UIControlStateNormal];
    [commentBtn addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:commentBtn];
}


- (void)backAction:(UIButton *)button{
    NSLog(@"返回");
    [_backDelegate backUp];
}

- (void)collectAction:(UIButton *)button{
    NSLog(@"收藏");

}

- (void)downloadAction:(UIButton *)button{
    NSLog(@"下载");

}


- (void)commentAction:(UIButton *)button{
    NSLog(@"评论");
    [_backDelegate commentAction];
}




@end

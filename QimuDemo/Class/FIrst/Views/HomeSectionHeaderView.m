//
//  HomeSectionHeaderView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/8.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "HomeSectionHeaderView.h"

@implementation HomeSectionHeaderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}



- (id)sharedInit {
//    UIView *cureOfLine = [[UIView alloc] initWithFrame:CGRectMake(16, 48 - 1, [UIScreen mainScreen].bounds.size.width - 2*16, 1)];
//    cureOfLine.backgroundColor = [UIColor colorWithRed:188.0/255.0 green:188.0/255.0 blue:188.0/255.0 alpha:1.0];
//    [self addSubview:cureOfLine];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];


    //仅修改self.titleButton的宽度,xyh值不变
    self.titleButton = [[UIButton alloc] init];
    self.titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
    self.titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.titleButton.frame = CGRectMake(16, 0, 200,  self.frame.size.height);
    self.titleButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self addSubview:self.titleButton];



    CGRect  moreBtnFrame = CGRectMake(self.moreButton.frame.origin.x, 0, 36, self.frame.size.height);
    self.moreButton = [[UIButton alloc] initWithFrame:moreBtnFrame];
    //仅修改self.moreButton的x,ywh值不变
    self.moreButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 12 - self.moreButton.frame.size.width, self.moreButton.frame.origin.y, self.moreButton.frame.size.width, self.moreButton.frame.size.height);
    [self.moreButton setImage:[UIImage imageNamed:@"home_btn_more_normal"] forState:UIControlStateNormal];
    [self.moreButton setImage:[UIImage imageNamed:@"home_btn_more_selected"] forState:UIControlStateSelected];
    [self.moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self.moreButton setTitle:@"" forState:UIControlStateNormal];
    self.moreButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.moreButton.titleLabel.textAlignment = NSTextAlignmentRight;
    self.moreButton.hidden = YES;
    [self.moreButton addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreButton];
    return self;
}

- (void)moreBtnClicked:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(filterHeaderViewMoreBtnClicked:)]) {
//        [self.delegate filterHeaderViewMoreBtnClicked:self.moreButton];
//    }

    NSLog(@"更多");
}


@end

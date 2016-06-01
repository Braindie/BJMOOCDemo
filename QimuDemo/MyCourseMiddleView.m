//
//  MyCourseMiddleView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCourseMiddleView.h"

@implementation MyCourseMiddleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];

    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 30)];
    label.text = @"评论";
    label.font = [UIFont systemFontOfSize:17];
    [self addSubview:label];


    _commentLable = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-100, 10, 90, 30)];
    _commentLable.text = @"3123条评论";
    _commentLable.textColor = [UIColor grayColor];
    [self addSubview:_commentLable];


    _myTextField = [UIButton buttonWithType:UIButtonTypeCustom];
    _myTextField.frame = CGRectMake(10, 50, self.frame.size.width - 20, 30);
    _myTextField.layer.cornerRadius = 5;
    _myTextField.layer.borderWidth = .5;
    _myTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_myTextField setTitle:@"我来说两句" forState:UIControlStateNormal];
    [_myTextField setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _myTextField.titleLabel.textAlignment = NSTextAlignmentCenter;
    _myTextField.backgroundColor = [UIColor colorWithRed:247/256 green:249/256 blue:251/256 alpha:.05];
    [_myTextField addTarget:self action:@selector(CommentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_myTextField];
}

- (void)CommentAction:(UIButton *)button{

    [_delegate presentCommentView];
}

@end

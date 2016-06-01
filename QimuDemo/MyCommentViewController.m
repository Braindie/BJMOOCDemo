//
//  MyCommentViewController.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCommentViewController.h"

@implementation MyCommentViewController

- (void)viewDidLoad{

    [super viewDidLoad];
    self.isNavCtrlSet = NO;

    self.title = @"写评论";
    self.view.backgroundColor = [UIColor whiteColor];

    [self addView];

}

- (void)addView{

    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 40, 200, 30)];
    titleLable.text = @"我来说两句";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:22];
//    titleLable.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titleLable];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 2)];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];


    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, 40, 20)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];


    UIButton *publicBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 50, 50, 40, 20)];
    [publicBtn setTitle:@"发表" forState:UIControlStateNormal];
    [publicBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:publicBtn];


//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 90, self.view.frame.size.width - 20, self.view.frame.size.width*3/5)];
//    textField.backgroundColor = [UIColor colorWithRed:247/256 green:249/256 blue:251/256 alpha:.05];
//    textField.placeholder = @"此刻的想法...";
//    textField.textAlignment = NSTextAlignmentLeft;
//    textField.font = [UIFont systemFontOfSize:18];
////    textField.borderStyle = UITextBorderStyleLine;
//    textField.adjustsFontSizeToFitWidth = YES;
//    textField.delegate= self;
//    textField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
//    textField.layer.cornerRadius = 10;
//    [self.view addSubview:textField];

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 90, self.view.frame.size.width - 20, self.view.frame.size.width*3/5)];
    textView.backgroundColor = [UIColor colorWithRed:247/256 green:249/256 blue:251/256 alpha:.05];
//    textView.placeholder = @"此刻的想法...";
    textView.textAlignment = NSTextAlignmentLeft;
    textView.font = [UIFont systemFontOfSize:18];
    //    textField.borderStyle = UITextBorderStyleLine;
//    textView.adjustsFontSizeToFitWidth = YES;
    textView.delegate = self;
//    textView.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textView.layer.cornerRadius = 10;
    [self.view addSubview:textView];


}

- (void)cancelAction{

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

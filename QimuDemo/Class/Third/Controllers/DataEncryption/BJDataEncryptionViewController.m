//
//  BJDataEncryptionViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/6.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJDataEncryptionViewController.h"
#import "NSString+MD5.h"

@interface BJDataEncryptionViewController ()

@end

@implementation BJDataEncryptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"数据加密";
    self.isCustomBack = YES;
    
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookBtn.frame = CGRectMake(0, 300, self.view.frame.size.width, 50);
    [bookBtn setTitle:@"加密" forState:UIControlStateNormal];
    bookBtn.backgroundColor = [UIColor grayColor];
    [bookBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bookBtn];
}

- (void)btnAction{
    
    NSString *str = @"1234567890";
    
    NSString *md5Str = [str md5];
    
    NSLog(@"加密前：%@，加密后：%@",str,md5Str);
}


@end

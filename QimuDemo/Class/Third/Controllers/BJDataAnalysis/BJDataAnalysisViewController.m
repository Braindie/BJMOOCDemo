//
//  BJDataAnalysisViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/11/20.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJDataAnalysisViewController.h"
#import "BJPersionModel.h"
#import <YYModel/YYModel.h>

@interface BJDataAnalysisViewController ()

@end

@implementation BJDataAnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"数据解析";
    
    [self analysisData];
}

- (void)analysisData {
    NSDictionary *dic = @{@"name": @"张三", @"age": @(18), @"sex": @"男"};
    
    BJPersionModel *model = [BJPersionModel yy_modelWithDictionary:dic];
    
    NSLog(@"%@", model);
}


@end

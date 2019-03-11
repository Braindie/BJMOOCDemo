//
//  BJLabelViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJLabelViewController.h"
#import "BJYYLabelView.h"

@interface BJLabelViewController ()

@end

@implementation BJLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"CoreText";
    self.isCustomBack = YES;
    
    
    BJYYLabelView *yyLabelView = [[BJYYLabelView alloc] initWithFrame:CGRectMake(50, 500, 100, 100)];
    yyLabelView.backgroundColor = [UIColor orangeColor];
    yyLabelView.textStr = [NSString stringWithFormat:@"http://www.baidu.com ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 [微笑] ✺◟(∗❛ัᴗ❛ั)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫"];
    yyLabelView.font = [UIFont systemFontOfSize:36];
    [self.view addSubview:yyLabelView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

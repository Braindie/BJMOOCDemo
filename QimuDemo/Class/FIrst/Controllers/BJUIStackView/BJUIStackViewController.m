//
//  BJUIStackViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/9/9.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJUIStackViewController.h"

@interface BJUIStackViewController ()

@end

@implementation BJUIStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStackView *containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenWidth)];
    containerView.axis = UILayoutConstraintAxisHorizontal;
    containerView.distribution = UIStackViewDistributionFillEqually;
    containerView.spacing = 10;
    containerView.alignment = UIStackViewAlignmentFill;
    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
        [containerView addArrangedSubview:view];
    }
    
    [self.view addSubview:containerView];
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

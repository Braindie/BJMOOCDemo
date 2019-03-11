//
//  BJSmoothLineViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJSmoothLineViewController.h"
#import "BJSmoothLineView.h"

@interface BJSmoothLineViewController (){
    BJSmoothLineView *_smoothView;
}

@end

@implementation BJSmoothLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"光滑折线图";
    self.isCustomBack = YES;
    
    
    _smoothView = [[BJSmoothLineView alloc] initWithFrame:CGRectMake(30, 227/2, 616/2,392/2)];
    _smoothView.backgroundColor = [UIColor whiteColor];
    //X轴刻度
    _smoothView.arrX = @[@"9",@"12",@"15"];
    // Y轴刻度
    _smoothView.arrY = @[@"0",@"10",@"20",@"30",@"40",@"50"];
    
    [self.view addSubview:_smoothView];
    
//    [_smoothView refreshChartAnmition];
    NSArray *pathX = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    NSArray *pathY = @[@"19",@"27",@"8",@"38",@"30",@"45",@"40",@"48",@"22",@"7"];
    
    [_smoothView drawSmoothViewWithArrayX:pathX andArrayY:pathY andScaleX:12.0];
    
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

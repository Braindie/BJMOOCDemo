//
//  BJBrokenLineViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJBrokenLineViewController.h"
#import "BJBrokenLineView.h"

@interface BJBrokenLineViewController (){
    BJBrokenLineView *_brokenView;
}

@end

@implementation BJBrokenLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"折线图";
    self.isCustomBack = YES;
    
    _brokenView = [[BJBrokenLineView alloc] initWithFrame:CGRectMake(30, 100,680/2,392/2)];
    _brokenView.backgroundColor = [UIColor whiteColor];
    //X轴坐标数据
    _brokenView.arrX =@[@"0时",@"12时",@"24时"];
    //Y轴左坐标数据
    _brokenView.arrLeftY =@[@"0",@"10",@"20",@"30",@"40",@"50"];
    //Y轴右坐标数据
//    _brokenView.arrRightY = @[@"0",@"100",@"200",@"300",@"400",@"500"];
    
    [self.view addSubview:_brokenView];
    
    NSArray *pathX = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    NSArray *arrLeft= @[@"5",@"10",@"15",@"26",@"29",@"22",@"33",@"38",@"45",@"49"];
    NSArray *arrRight= @[@"50",@"100",@"120",@"230",@"129",@"202",@"300",@"308",@"450",@"480"];
    
    [_brokenView drawLeftChartViewWithArrayX:pathX ArrayY:arrLeft andScaleX:12];
//    [_brokenView drawRightChartViewWithArrayX:pathX ArrayY:arrRight andScaleX:12];
    
    
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

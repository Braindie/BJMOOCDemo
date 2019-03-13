//
//  BJBrokenLineViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJBrokenLineViewController.h"
#import "BJBrokenLineView.h"
#import "BJSmoothLineView.h"


@interface BJBrokenLineViewController (){
    BJBrokenLineView *_brokenView;
    
    BJSmoothLineView *_smoothView;
}

@end

@implementation BJBrokenLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"折线图/平滑折线图";
    self.isCustomBack = YES;
    
    //折线图
    [self buildBrokenView];
    
    //平滑折线图
    [self buildSmoothView];
}

- (void)buildBrokenView{
    
    _brokenView = [[BJBrokenLineView alloc] initWithFrame:CGRectMake(30, 50,680/2,392/2)];
    _brokenView.backgroundColor = [UIColor whiteColor];
    //X轴坐标数据
    _brokenView.arrX =@[@"0时",@"12时",@"24时"];
    //Y轴左坐标数据
    _brokenView.arrLeftY =@[@"0",@"10",@"20",@"30",@"40",@"50"];
    //Y轴右坐标数据
    //    _brokenView.arrRightY = @[@"0",@"100",@"200",@"300",@"400",@"500"];
    
    [self.view addSubview:_brokenView];
    
    NSArray *pathX = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    NSArray *arrLeft= @[@"19",@"27",@"8",@"38",@"30",@"45",@"40",@"48",@"22",@"7"];
    NSArray *arrRight= @[@"50",@"100",@"120",@"230",@"129",@"202",@"300",@"308",@"450",@"480"];
    
    [_brokenView drawLeftChartViewWithArrayX:pathX ArrayY:arrLeft andScaleX:12];
    //    [_brokenView drawRightChartViewWithArrayX:pathX ArrayY:arrRight andScaleX:12];
}

- (void)buildSmoothView{
    
    _smoothView = [[BJSmoothLineView alloc] initWithFrame:CGRectMake(30, 300, 616/2,392/2)];
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

@end

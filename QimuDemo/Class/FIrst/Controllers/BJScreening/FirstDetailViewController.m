//
//  FirstDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FirstDetailViewController.h"

#import "BJMenuBarView.h"
#import "BJMenuRightView.h"


@interface FirstDetailViewController ()<BJMenuRightViewDelegate,BJMenuRightViewDataSource,BJMenuBarViewDelegate,BJMenuBarViewDataSource>

@property (nonatomic, strong) BJMenuRightView *superMenuView;//界面筛选
@property (nonatomic, assign) BOOL isOpen;//界面筛选


@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.isCustomBack = YES;
    self.navigationItem.title = @"筛选";

    //筛选条
    [self addBarMenuView];

    //右上筛选列表
    self.isNavCtrlSetRight = YES;
    [self.rightButton setTitle:@"筛选" forState:UIControlStateNormal];
    [self addRightMenuView];
}

#pragma mark - barMenuView
- (void)addBarMenuView{
    BJMenuBarView *barView = [[BJMenuBarView alloc] initWithOrigin:CGPointMake(0, 100) andHeight:35];
    barView.delegate = self;
    barView.dataSource = self;
    barView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:barView];
}

#pragma mark BJMenuBarViewDataSource & BJMenuBarViewDelegate
- (NSArray *)titleForRowAtIndexPathMenu:(BJMenuBarView *)menu{
    return @[@"全部", @"充值", @"提现", @"筛选"];
}

- (NSArray *)cellTitelForRowAtIndexPathMenu:(BJMenuBarView *)menu{
    return @[@"全部", @"充值", @"提现", @"投资", @"回款本息", @"投资支出"];
}

//点击了默认按钮
- (void)clickDefaultAction{
    
}
//点击了年利率按钮
- (void)clickRateActionIsUp:(BOOL)isUp{
    
}
//点击了期限按钮
- (void)clickTimeActionIsUp:(BOOL)isUp{
    
}
//点击筛选确定或重置按钮
- (void)clickSelectActionWithType:(NSInteger)type withRate:(NSInteger)rate withTime:(NSInteger)time{
    
}



#pragma mark - rightMenuView
- (void)addRightMenuView{
    _superMenuView = [[BJMenuRightView alloc] initWithMenuOrigin:CGPointMake(SCREEN_WIDTH-30, 64) withMenuHeight:150 withMenuWidth:100];
    _superMenuView.delegate = self;
    _superMenuView.dataSource = self;
}

- (void)rightButtonAction:(UIButton *)button{
    if (!self.isOpen) {
        [self.superMenuView showMenu];
        self.isOpen = YES;
    } else {
        [self.superMenuView cancleMenu];
        self.isOpen = NO;
    }
}

#pragma mark BJMenuRightViewDataSource & BJMenuRightViewDelegate
- (NSArray *)menu:(BJMenuRightView *)menu cellForRowAtIndexPath:(NSInteger)index {
    return @[@"全部", @"充值", @"提现", @"投资", @"回款本息", @"投资支出"];
}

// 点击Cell代理事件
- (void)menu:(BJMenuRightView *)menu didSelectRowAtIndexPath:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}

// 点击蒙版代理事件
- (void)menuCheckCancleShow:(BJMenuRightView *)menu{
    self.isOpen = NO;
    //    [_rightBtn setImage:[UIImage imageNamed:@"orange_down"] forState:UIControlStateNormal];
}



@end

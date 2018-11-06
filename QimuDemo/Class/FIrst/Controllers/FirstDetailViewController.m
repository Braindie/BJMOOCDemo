//
//  FirstDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "BunnyCollectionView.h"

#import "BJMenuRightView.h"
#import "BJMenuBarView.h"

@interface FirstDetailViewController ()<BunnyCollectionViewDelegate,BunnyCollectionViewDataSource,BJMenuRightViewDelegate,BJMenuRightViewDataSource,BJMenuBarViewDelegate,BJMenuBarViewDataSource>
@property (nonatomic, strong) BJMenuRightView *superMenuView;//界面筛选
@property (nonatomic, assign) BOOL isOpen;//界面筛选

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.isCustomBack = YES;
    self.isNavCtrlSetRight = YES;
    [self.rightButton setTitle:@"筛选" forState:UIControlStateNormal];

    self.navigationItem.title = @"筛选";
    
    _superMenuView = [[BJMenuRightView alloc] initWithMenuOrigin:CGPointMake(SCREEN_WIDTH-30, 64) withMenuHeight:150 withMenuWidth:100];
    _superMenuView.delegate = self;
    _superMenuView.dataSource = self;
    
    
    BJMenuBarView *barView = [[BJMenuBarView alloc] initWithOrigin:CGPointMake(0, 64) andHeight:35];
    barView.delegate = self;
    barView.dataSource = self;
    [self.view addSubview:barView];

    BunnyCollectionView *view = [[BunnyCollectionView alloc] initWithFrame:CGRectMake(0, 64+100, SCREEN_WIDTH, 500)];
    view.dataSource = self;
    view.delegate = self;
    [self.view addSubview:view];
    
    
    
}


#pragma mark - ButtonAction
- (void)rightButtonAction:(UIButton *)button{
    if (!self.isOpen) {
        [self.superMenuView showMenu];
        self.isOpen = YES;
    } else {
        [self.superMenuView cancleMenu];
        self.isOpen = NO;
    }
}


#pragma mark - BJMenuRightViewDataSource & BJMenuRightViewDelegate
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

#pragma mark - BJMenuBarViewDataSource & BJMenuBarViewDelegate
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

#pragma mark - BunnyCollectionViewDataSource
- (NSArray *)arrayInCollectionView:(BunnyCollectionView *)view{
    return @[@[@"工薪族",@"私营业主",@"网店买卖",@"学生",@"其他"],@[@"工薪族工薪族",@"私营业主工薪族",@"网店买卖工薪族",@"学生工薪族",@"其他工薪族",@"有缴纳工薪族工薪族工薪族工薪族"]];
}

- (void)currentSelectedItem:(NSString *)model{
    NSLog(@"%@",model);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

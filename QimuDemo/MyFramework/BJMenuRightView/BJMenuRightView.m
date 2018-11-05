//
//  BJMenuRightView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/26.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJMenuRightView.h"
#import "AppDelegate.h"

#define KEYWINDOW [UIApplication sharedApplication].keyWindow


static NSString *cellID = @"BJCell";
@interface BJMenuRightView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

//!< 菜单栏视图
@property (nonatomic, strong) UIView *menuView;
//!< 蒙版
@property (nonatomic, strong) UIView *backGroundView;
//!< 菜单栏上的列表
@property (nonatomic, strong) UITableView *rightTableView;

//!< 菜单原点
@property (nonatomic, assign) CGPoint origin;
//!< 菜单默认宽度
@property (nonatomic, assign) CGFloat menuWidth;
//!< 菜单默认高度
@property (nonatomic, assign) CGFloat menuHeight;
//!< cell高度
@property (nonatomic, assign) CGFloat cellHeight;
//!< 圆角半径
@property (nonatomic, assign) CGFloat cornerRadius;

@end

@implementation BJMenuRightView

- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-120, 0, 100, 150) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.layer.anchorPoint = CGPointMake(0.5, 0);

    }
    return _rightTableView;
}

- (UIView *)backGroundView{
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:self.bounds];
        _backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        _backGroundView.opaque = NO;
        
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapped)];
        backTap.delegate = self;
        [_backGroundView addGestureRecognizer:backTap];
    }
    return _backGroundView;
}

- (instancetype)initWithMenuOrigin:(CGPoint)origin
                    withMenuHeight:(CGFloat)height
                     withMenuWidth:(CGFloat)width{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        _origin = origin;
        _menuHeight = height;
        _menuWidth = width;

        [self configSetting];
    }
    return self;
}

- (void)configSetting{
    self.cellHeight = 30;
    self.cornerRadius = 5;
}


- (void)showMenu{
    // 蒙版
    [self addSubview:self.backGroundView];
    
    // 右上角表示图
    [self.backGroundView addSubview:self.rightTableView];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.window addSubview:self];
    
    [self animationStart];
}
- (void)cancleMenu{
    
    [UIView animateWithDuration:.3 animations:^{
        self.rightTableView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        self.rightTableView.transform= CGAffineTransformIdentity;
        [self removeFromSuperview];
        
        if ([_delegate respondsToSelector:@selector(menuCheckCancleShow:)]) {
            [_delegate menuCheckCancleShow:self];
        }
    }];
}

- (void)animationStart{
    self.rightTableView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    [UIView animateWithDuration:.3 animations:^{
        self.backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        self.rightTableView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_dataSource respondsToSelector:@selector(menu:cellForRowAtIndexPath:)]) {
        return [_dataSource menu:self cellForRowAtIndexPath:0].count;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if ([_dataSource respondsToSelector:@selector(menu:cellForRowAtIndexPath:)]) {
        cell.textLabel.text = [_dataSource menu:self cellForRowAtIndexPath:0][indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"点我干啥");
    if ([_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
        [_delegate menu:self didSelectRowAtIndexPath:indexPath.row];
    }
    [self backTapped];
}

#pragma mark - 补全分隔线左侧缺失
- (void)viewDidLayoutSubviews {
    if ([self.rightTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.rightTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.rightTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.rightTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.rightTableView]) {
        return NO;
    }
    return YES;
}

#pragma mark - 点击蒙版事件
- (void)backTapped{
    [self cancleMenu];
}
@end

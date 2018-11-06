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
//!< 箭头
@property (nonatomic, strong) CAShapeLayer *arrowLayer;

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

//!< 锚点
@property (nonatomic, assign) CGPoint anchor;//(0 - 1之间)
//!< 三角相对于弹框的坐标
@property (nonatomic, assign) CGPoint arrowOrigin;

@end

@implementation BJMenuRightView

- (UIView *)menuView{
    if (!_menuView) {
        _menuView = [[UIView alloc] initWithFrame:CGRectZero];
        _menuView.layer.anchorPoint = self.anchor;//对frame有影响，放在frame前面
        _menuView.frame = CGRectMake(SCREEN_WIDTH-10-_menuWidth, _origin.y, _menuWidth, _menuHeight);
        _menuView.backgroundColor = [UIColor clearColor];

        [_menuView.layer addSublayer:self.arrowLayer];
        [_menuView addSubview:self.rightTableView];
    }
    return _menuView;
}

- (CAShapeLayer *)arrowLayer{
    if (!_arrowLayer) {
        _arrowLayer = [[CAShapeLayer alloc] init];
        _arrowLayer.fillColor = [UIColor whiteColor].CGColor;
        UIBezierPath *arrowPath = [UIBezierPath bezierPath];
        [arrowPath moveToPoint:self.arrowOrigin];
        [arrowPath addLineToPoint:CGPointMake(self.arrowOrigin.x-6, 8)];
        [arrowPath addLineToPoint:CGPointMake(self.arrowOrigin.x+6, 8)];
        [arrowPath closePath];
        _arrowLayer.path = arrowPath.CGPath;
    }
    return _arrowLayer;
}

- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 8, _menuWidth, _menuHeight) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.bounces = NO;
        _rightTableView.layer.cornerRadius = _cornerRadius;
        _rightTableView.layer.masksToBounds = YES;
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
    self.cellHeight = 40;
    self.cornerRadius = 5;
    
    self.arrowOrigin = CGPointMake(_origin.x+10+_menuWidth-SCREEN_WIDTH, 0);
    
    self.anchor = CGPointMake(self.arrowOrigin.x / _menuWidth, 0);
}


- (void)showMenu{
    // 蒙版
    [self addSubview:self.backGroundView];
    
    // 右上角表示图
    [self.backGroundView addSubview:self.menuView];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.window addSubview:self];
    
    [self animationStart];
}
- (void)cancleMenu{

    [UIView animateWithDuration:.3 animations:^{
        self.menuView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        self.menuView.transform= CGAffineTransformIdentity;
        [self removeFromSuperview];
        
        if ([_delegate respondsToSelector:@selector(menuCheckCancleShow:)]) {
            [_delegate menuCheckCancleShow:self];
        }
    }];
}

- (void)animationStart{
    self.menuView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    [UIView animateWithDuration:.3 animations:^{
        self.backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        self.menuView.transform = CGAffineTransformMakeScale(1, 1);
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([_dataSource respondsToSelector:@selector(menu:cellForRowAtIndexPath:)]) {
        cell.textLabel.text = [_dataSource menu:self cellForRowAtIndexPath:0][indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor darkGrayColor];
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
/**
 *   解决手势冲突
 */
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

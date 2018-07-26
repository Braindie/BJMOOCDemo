//
//  BJMenuRightView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/26.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJMenuRightView.h"
#import "AppDelegate.h"

static NSString *cellID = @"BJCell";
@interface BJMenuRightView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, assign) CGPoint origin;  //原点
@property (nonatomic, assign) CGFloat cellHeight;//cell高度
@property (nonatomic, assign) CGFloat height;//tableView高度
@property (nonatomic, strong) UITableView *rightTableView;//右上侧表视图
@property (nonatomic, strong) UIView *backGroundView;//蒙版

@end

@implementation BJMenuRightView

- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] init];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.backgroundColor = [UIColor whiteColor];
    }
    return _rightTableView;
}

//- (UIView *)backGroundView{
//    if (!_backGroundView) {
//        _backGroundView = [[UIView alloc] init];
//        _backGroundView.backgroundColor = UIColorFromRGBAlpha(0x000000,0.5);
//        _backGroundView.opaque = NO;
//    }
//    return _backGroundView;
//}

- (instancetype)initWithOrigin:(CGPoint)origin withCellHeight:(CGFloat)cellHeight withHeight:(CGFloat)height{
    self = [super initWithFrame:CGRectMake(0, origin.y, SCREEN_WIDTH, SCREEN_HEIGHT-origin.y)];
    if (self) {
        _origin = origin;
        _height = height;
        _cellHeight = cellHeight;
        
        //蒙版
        _backGroundView = [[UIView alloc] init];
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.opaque = NO;
        _backGroundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-origin.y);
        [self addSubview:_backGroundView];
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapped)];
        backTap.delegate = self;
        [_backGroundView addGestureRecognizer:backTap];
        
        
        //右上角表示图
        self.rightTableView.frame = CGRectMake(origin.x, 0, SCREEN_WIDTH-origin.x, height);
        [_backGroundView addSubview:self.rightTableView];
        
    }
    return self;
}

- (instancetype)initWithOrigin:(CGPoint)origin withCellHeight:(CGFloat)cellHeight withHeight:(CGFloat)height tableWidth:(CGFloat)tableWidth {
    self = [super initWithFrame:CGRectMake(0, origin.y, SCREEN_WIDTH, SCREEN_HEIGHT-origin.y)];
    if (self) {
        _origin = origin;
        _height = height;
        _cellHeight = cellHeight;
        
        // 蒙版
        _backGroundView = [[UIView alloc] init];
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.opaque = NO;
        _backGroundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-origin.y);
        [self addSubview:_backGroundView];
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapped)];
        backTap.delegate = self;
        [_backGroundView addGestureRecognizer:backTap];
        
        
        // 右上角表示图
        
        self.rightTableView.frame = CGRectMake(origin.x, 0, tableWidth, height);
        [_backGroundView addSubview:self.rightTableView];
        
    }
    return self;
}

- (void)show{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.window addSubview:self] ;
}
- (void)cancleShow{
    [self removeFromSuperview];
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
    [self removeFromSuperview];
    if ([_delegate respondsToSelector:@selector(menuCheckCancleShow:)]) {
        [_delegate menuCheckCancleShow:self];
    }
}
@end

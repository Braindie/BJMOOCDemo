//
//  BJMasnoryViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/8.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJMasnoryViewController.h"
#import "Masonry.h"

@interface BJMasnoryViewController ()
// scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
// 约束参照视图,也是容器视图
@property (nonatomic, strong) UIView *contentView;
// 第一个测试view
@property (nonatomic, strong) UIView *oneView;
// 第二个测试view
@property (nonatomic, strong) UIView *twoView;
// 第三个测试view
@property (nonatomic, strong) UIView *threeView;

@end

@implementation BJMasnoryViewController


#pragma mark - getters
// scrollView
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor grayColor];
    }
    return _scrollView;
}
// 约束参照视图
- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor yellowColor];
    }
    return _contentView;
}
// 第一个测试view
- (UIView *)oneView {
    if (_oneView == nil) {
        _oneView = [[UIView alloc] init];
        _oneView.backgroundColor = [UIColor redColor];
    }
    return _oneView;
}
// 第二个测试view
- (UIView *)twoView {
    if (_twoView == nil) {
        _twoView = [[UIView alloc] init];
        _twoView.backgroundColor = [UIColor blueColor];
    }
    return _twoView;
}
// 第三个测试view
- (UIView *)threeView {
    if (_threeView == nil) {
        _threeView = [[UIView alloc] init];
        _threeView.backgroundColor = [UIColor greenColor];
    }
    return _threeView;
}

#pragma mark - cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Masonry";
    
    self.isCustomBack = YES;
    
    // 1. 添加scrollView
    [self.view addSubview:self.scrollView];
    // 2. 添加参照视图
//    [self.scrollView addSubview:self.contentView];
//
//    // 3. 添加第一个测试view
//    [self.contentView addSubview:self.oneView];
//    // 4. 添加第二个测试view
//    [self.contentView addSubview:self.twoView];
//    // 5. 添加第三个测试view
//    [self.contentView addSubview:self.threeView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //设置参照视图约束
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.scrollView);
//        make.width.equalTo(self.scrollView);
//    }];
//    
//    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView).offset(30);
//        make.left.equalTo(self.contentView).offset(30);
//        make.right.equalTo(self.contentView).offset(-30);
//        make.height.mas_equalTo(100);
//    }];
//    
//    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.oneView.mas_bottom).offset(30);
//        make.left.equalTo(self.contentView).offset(30);
//        make.right.equalTo(self.contentView).offset(-30);
//        make.height.mas_equalTo(200);
//    }];
//    
//    [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.twoView.mas_bottom).offset(30);
//        make.left.equalTo(self.contentView).offset(30);
//        make.right.equalTo(self.contentView).offset(-30);
//        make.height.mas_equalTo(300);
//    }];
//    
//    
//    //*********设置参照视图与最后一个view的约束***********子视图撑开父视图
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.threeView.mas_bottom).offset(30);
//    }];
    
//    1. 想要保证能够使用一个View的布局我们需要满足上下左右四个约束, 或者说是位置和大小
//    2. 我们需要一个参照View, 用来作容器视图, scrollView添加这个容器视图, 之后所有的view都要参照这个容器视图作约束
//    3. 我们约束一般有两种方式 1 .通过父视图约束子视图 2. 子视图撑开父视图. 总之, 我们对于这个参照容器视图要有一个上下左右的约束

}

@end

//
//  MVPViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPPresenter.h"
#import "MVPModel.h"
#import "MVPView.h"

@interface MVPViewController ()
@property (nonatomic, strong) MVPPresenter *presenter;
@property (nonatomic, strong) MVPView  *mvpView;
@property (nonatomic, strong) MVPModel *mvpModel;
@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"MVP";
    
    //P
    _presenter = [[MVPPresenter alloc] init];
    
    //V
    _mvpView = [[MVPView alloc] init];
    _mvpView.frame = self.view.bounds;
    [self.view addSubview:_mvpView];
    
    //M
    _mvpModel = [MVPModel new];
    _mvpModel.content = @"MVP的模式";
    
    //M->P,V->P
    _presenter.model = _mvpModel;
    _presenter.view = _mvpView;
    
    [_presenter useLogin];

}

@end

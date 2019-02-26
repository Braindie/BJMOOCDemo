//
//  MVPPresenter.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import "MVPPresenter.h"

@implementation MVPPresenter


- (void)useLogin{
    //设置V的代理，接收V的反馈
    self.view.delegate = self;
    
    //设置M到V上
    [self.view showView:self.model.content];
}

#pragma mark - MVPViewDelegate
- (void)viewShowBtnClick{
    //处理业务逻辑，更新数据，刷新界面
    int num = arc4random_uniform(20);
    self.model.content = [NSString stringWithFormat:@"更新了数据：%d",num];
    
    [_view showView:self.model.content];
}

@end

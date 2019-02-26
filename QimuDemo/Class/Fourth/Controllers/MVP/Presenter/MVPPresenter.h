//
//  MVPPresenter.h
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPModel.h"
#import "MVPView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPPresenter : NSObject<MVPViewDelegate>
@property (nonatomic, strong) MVPModel *model;
@property (nonatomic, strong) MVPView *view;

- (void)useLogin;
@end

NS_ASSUME_NONNULL_END

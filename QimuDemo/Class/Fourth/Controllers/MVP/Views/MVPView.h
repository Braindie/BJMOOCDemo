//
//  MVPView.h
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MVPViewDelegate <NSObject>

- (void)viewShowBtnClick;

@end

@interface MVPView : UIView
@property (nonatomic, weak) id<MVPViewDelegate> delegate;

- (void)showView:(NSString *)content;
@end

NS_ASSUME_NONNULL_END

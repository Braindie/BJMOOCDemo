//
//  MyCourseMiddleView.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol delegate <NSObject>

- (void)presentCommentView;

@end

@interface MyCourseMiddleView : UIView<UITextFieldDelegate>

@property (nonatomic ,strong) UILabel *commentLable;
//@property (nonatomic ,strong) UITextField *myTextField;

@property (nonatomic ,assign) id<delegate> delegate;

@property (nonatomic ,strong) UIButton *myTextField;

@end

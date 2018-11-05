//
//  BJMenuRightView.h
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/26.
//  Copyright © 2018年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BJMenuRightView;

@protocol BJMenuRightViewDataSource <NSObject>
@required
//列表中的数据
//- (NSArray *)getMenuArray;
- (NSArray *)menu:(BJMenuRightView *)menu cellForRowAtIndexPath:(NSInteger)index;
@end

@protocol BJMenuRightViewDelegate <NSObject>
- (void)menu:(BJMenuRightView *)menu didSelectRowAtIndexPath:(NSInteger)index;
- (void)menuCheckCancleShow:(BJMenuRightView *)menu;
@end


@interface BJMenuRightView : UIView
@property (nonatomic, weak) id<BJMenuRightViewDelegate> delegate;
@property (nonatomic, weak) id<BJMenuRightViewDataSource> dataSource;
//初始化方法
- (instancetype)initWithMenuOrigin:(CGPoint)origin
                    withMenuHeight:(CGFloat)height
                     withMenuWidth:(CGFloat)width;

//展示
- (void)showMenu;
//取消展示
- (void)cancleMenu;
@end

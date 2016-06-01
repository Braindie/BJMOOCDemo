//
//  UINavBarView.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavViewDelegate <NSObject>

@optional
//- (void)viewHeight:(CGFloat)height;
- (void)itemPressedWithIndex1:(NSString *)str;
- (void)itemPressedWithIndex2:(NSString *)str;
- (void)itemPressedWithIndex3:(NSString *)str withIsBar:(BOOL *)isBar;
- (void)itemPressedWithIndex4:(NSString *)str;


@end

@interface UINavBarView : UIView{
    
    UIImageView *_selectedImageView0;
    UIImageView *_selectedImageView1;
    UIImageView *_selectedImageView2;
    UIImageView *_selectedImageView3;


}

@property (nonatomic, assign) id <NavViewDelegate>delegate;

//@property(nonatomic) NSUInteger selectedIndex;

@property (nonatomic ,strong) UIView *lineView;

@property (nonatomic ,strong) UIScrollView *scrollView0;
@property (nonatomic ,strong) UIScrollView *scrollView1;
@property (nonatomic ,strong) UIScrollView *scrollView2;
@property (nonatomic ,strong) UIScrollView *scrollView3;


@property (nonatomic ,strong) NSMutableArray *dataArr10;
@property (nonatomic ,strong) NSMutableArray *dataArr11;
@property (nonatomic ,strong) NSMutableArray *dataArr12;
@property (nonatomic ,strong) NSMutableArray *dataArr13;

@property (nonatomic ,strong) NSMutableArray *myDataArr;



@property (nonatomic ,strong) UIButton *button3;


- (void)loadTopData;
- (void)updateData;



@end

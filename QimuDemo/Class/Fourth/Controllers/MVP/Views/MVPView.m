//
//  MVPView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/26.
//  Copyright © 2019 ll. All rights reserved.
//

#import "MVPView.h"

@interface MVPView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btnPrint;
@end

@implementation MVPView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.backgroundColor = [UIColor grayColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 300, 30)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    [self addSubview:self.label];
    
    self.btnPrint = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [self.btnPrint setTitle:@"来点我呀" forState:UIControlStateNormal];
    [self.btnPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnPrint];

}

- (void)showView:(NSString *)content{
    self.label.text = content;
}

- (void)onPrintClick{
    if ([self.delegate respondsToSelector:@selector(viewShowBtnClick)]) {
        [self.delegate viewShowBtnClick];
    }
}

@end

//
//  SGWCancelAlertView.m
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import "SGWCancelAlertView.h"

@interface SGWCancelAlertView ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIView *contentBgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelBtnHeight;

@property (copy, nonatomic) void (^cancelBlock)(void); //!< 取消回调

@end

@implementation SGWCancelAlertView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self configuerUI];
}

- (void)configuerUI
{
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.contentBgViewHeight.constant = 200;
    self.contentBgViewLeft.constant = 20;
    self.contentBgViewRight.constant = 20;
    self.cancelBtnHeight.constant = 50;
    
    self.contentBgView.layer.masksToBounds = YES;
    self.contentBgView.layer.cornerRadius = 3;
}

- (void)alertWithMessage:(NSString *)message
     cancelButtonTitle:(NSString *)cancelTitle cancelBlock:(void (^)(void))cancelBlock
{
    self.cancelBlock = cancelBlock;
    self.contentLabel.text = message;
    [self.cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
    [self showInWindow];
}

- (void)showInWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [window addSubview:self];
    
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    if (self.cancelBlock)
    {
        self.cancelBlock();
    }

    [UIView animateWithDuration:1 animations:^{
        [self removeFromSuperview];
    }];
}

@end

//
//  SGWMultiSelectionAlertView.m
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import "SGWMultiSelectionAlertView.h"


@interface SGWMultiSelectionAlertView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sureBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelBtnHeight;
@property (copy, nonatomic) void (^cancelBlock)(void); //!< 取消回调
@property (copy, nonatomic) void (^confirmBlock)(void); //!< 确定回调


@end

@implementation SGWMultiSelectionAlertView


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self configuerUI];
}

- (void)configuerUI
{
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.contentBgViewHeight.constant = 200 ;
    self.contentBgViewLeft.constant = 20 ;
    self.contentBgViewRight.constant = 20 ;
    self.titleLabelHeight.constant = 50 ;
    self.cancelBtnHeight.constant = 50 ;
    self.sureBtnHeight.constant = 50 ;
    
    self.contentBgView.layer.masksToBounds = YES;
    self.contentBgView.layer.cornerRadius = 3;
}

- (void)alertWithTitle:(NSString *)title
             message:(NSString *)message
        attributeStr:(NSString *)attributeStr
          attributes:(NSDictionary *)Attributes
   cancelButtonTitle:(NSString *)cancelTitle
         cancelBlock:(void (^)(void))cancelBlock
  confirmButtonTitle:(NSString *)confirmTitle
        confirmBlock:(void (^)(void))confirmBlock
{
    self.cancelBlock = cancelBlock;
    self.confirmBlock = confirmBlock;
    self.titleLabel.text = title;
    self.contentLabel.text = message;
    [self.cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
    [self.sureBtn setTitle:confirmTitle forState:UIControlStateNormal];
    
//    if ([attributeStr isNotEmpty]){
//        NSMutableAttributedString *attribtStr1=[[NSMutableAttributedString alloc]initWithString:message];
//        NSRange range1=[[attribtStr1 string]rangeOfString:attributeStr];
//        [attribtStr1 addAttributes:Attributes range:range1];
//        self.contentLabel.attributedText = attribtStr1;
//    }
    
    [self showInWindow];
}



- (void)showInWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [window addSubview:self];
    
}

- (IBAction)sureAction:(UIButton *)sender {
    
    if (self.confirmBlock)
    {
        self.confirmBlock();
    }
    [UIView animateWithDuration:1 animations:^{
        [self removeFromSuperview];
    }];
    
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

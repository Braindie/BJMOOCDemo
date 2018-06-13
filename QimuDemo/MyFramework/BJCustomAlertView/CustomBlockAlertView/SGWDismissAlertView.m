//
//  SGWDismissAlertView.m
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import "SGWDismissAlertView.h"

@interface SGWDismissAlertView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentBgViewRight;

@end

@implementation SGWDismissAlertView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self configuerUI];
    [self configuerFrame];
}

- (void)configuerUI
{
    [self.contentBgView addSubview:self.titleLabel];
    [self.contentBgView addSubview:self.contentLabel];
    
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    
    self.contentBgViewHeight.constant = 200 ;
    self.contentBgViewLeft.constant = 20 ;
    self.contentBgViewRight.constant = 20 ;
    
    self.contentBgView.layer.masksToBounds = YES;
    self.contentBgView.layer.cornerRadius = 3;
}

- (void)configuerFrame
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(self.contentBgView).offset(10);
        make.left.equalTo(self.contentBgView).offset(20);
        make.right.equalTo(self.contentBgView).offset(-20);
        make.bottom.equalTo(self.contentLabel.mas_top).offset(-20);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentBgView.mas_centerY);
        make.left.equalTo(self.contentBgView).offset(20);
        make.right.equalTo(self.contentBgView).offset(-20);
       // make.bottom.equalTo(self.contentBgView).offset(-10);
    }];
}

- (void)alertViewTitle:(NSString *)title
               message:(NSString *)message
              duration:(NSTimeInterval)duration
          confirmBlock:(void (^)(void))confirmBlock
{
    self.titleLabel.text = title;
    self.contentLabel.text = message;
    
//    if (![title isNotEmpty]) {
//
//    }
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentBgView).offset(10);
        make.left.equalTo(self.contentBgView).offset(20);
        make.right.equalTo(self.contentBgView).offset(-20);
        make.bottom.equalTo(self.contentBgView).offset(-10);
    }];
    
//    if (![message isNotEmpty]) {
//
//    }
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentBgView).offset(10);
        make.left.equalTo(self.contentBgView).offset(20);
        make.right.equalTo(self.contentBgView).offset(-20);
        make.bottom.equalTo(self.contentBgView).offset(-10);
    }];
    
    [self showInWindow];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{
            [self removeFromSuperview];
        } completion:^(BOOL finished) {
            if (confirmBlock) {
                confirmBlock();
            }
        }];
    });
}

- (void)showInWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [window addSubview:self];
    
}

#pragma mark - getter
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor redColor];
    }
    
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.adjustsFontSizeToFitWidth = YES;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor blueColor];
    }
    
    return _contentLabel;
}



@end

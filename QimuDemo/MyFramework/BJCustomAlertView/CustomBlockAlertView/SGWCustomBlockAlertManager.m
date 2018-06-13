//
//  SGWCustomBlockAlertManager.m
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import "SGWCustomBlockAlertManager.h"
#import "SGWMultiSelectionAlertView.h"
#import "SGWCancelAlertView.h"
#import "SGWDismissAlertView.h"

@interface SGWCustomBlockAlertManager ()

@end

@implementation SGWCustomBlockAlertManager


+ (void)alertWithTitle:(NSString *)title
            message:(NSString *)message
       attributeStr:(NSString *)attributeStr
         attributes:(NSDictionary *)Attributes
  cancelButtonTitle:(NSString *)cancelTitle
        cancelBlock:(void (^)(void))cancelBlock
 confirmButtonTitle:(NSString *)confirmTitle
       confirmBlock:(void (^)(void))confirmBlock
{
    SGWMultiSelectionAlertView *alertView = [[NSBundle mainBundle] loadNibNamed:@"SGWMultiSelectionAlertView" owner:self options:nil].lastObject;
    [alertView alertWithTitle:title message:message attributeStr:attributeStr attributes:Attributes cancelButtonTitle:cancelTitle cancelBlock:cancelBlock confirmButtonTitle:confirmTitle confirmBlock:confirmBlock];
}

+ (void)alertWithMessage:(NSString *)message
       cancelButtonTitle:(NSString *)cancelTitle
             cancelBlock:(void (^)(void))cancelBlock;
{
    
    SGWCancelAlertView *alertView = [[NSBundle mainBundle] loadNibNamed:@"SGWCancelAlertView" owner:self options:nil].lastObject;
    [alertView alertWithMessage:message cancelButtonTitle:cancelTitle cancelBlock:cancelBlock];
}

+ (void)alertViewTitle:(NSString *)title message:(NSString *)message duration:(NSTimeInterval)duration confirmBlock:(void (^)(void))confirmBlock
{
    SGWDismissAlertView *alertView = [[NSBundle mainBundle] loadNibNamed:@"SGWDismissAlertView" owner:self options:nil].lastObject;
    [alertView alertViewTitle:title message:message duration:duration confirmBlock:confirmBlock];
}
@end

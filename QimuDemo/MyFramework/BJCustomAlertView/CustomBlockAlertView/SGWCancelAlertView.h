//
//  SGWCancelAlertView.h
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGWCancelAlertView : UIView

- (void)alertWithMessage:(NSString *)message
       cancelButtonTitle:(NSString *)cancelTitle
             cancelBlock:(void (^)(void))cancelBlock;

@end

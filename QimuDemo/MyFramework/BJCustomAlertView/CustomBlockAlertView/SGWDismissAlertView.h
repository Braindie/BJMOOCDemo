//
//  SGWDismissAlertView.h
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGWDismissAlertView : UIView

- (void)alertViewTitle:(NSString *)title
               message:(NSString *)message
              duration:(NSTimeInterval)duration
          confirmBlock:(void (^)(void))confirmBlock;



@end

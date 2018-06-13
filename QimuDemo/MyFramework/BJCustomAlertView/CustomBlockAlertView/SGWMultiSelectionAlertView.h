//
//  SGWMultiSelectionAlertView.h
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGWMultiSelectionAlertView : UIView

- (void)alertWithTitle:(NSString *)title
             message:(NSString *)message
        attributeStr:(NSString *)attributeStr
          attributes:(NSDictionary *)Attributes
   cancelButtonTitle:(NSString *)cancelTitle
         cancelBlock:(void (^)(void))cancelBlock
  confirmButtonTitle:(NSString *)confirmTitle
        confirmBlock:(void (^)(void))confirmBlock;

@end

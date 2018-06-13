//
//  SGWCustomBlockAlertManager.h
//  SeaGodWallet
//
//  Created by htouhui on 2018/5/8.
//  Copyright © 2018年 Liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SGWCustomBlockAlertManager : NSObject

/**
 *  有确定按钮的alert
 *
 *  @param title          标题
 *  @param message        描述
 *  @param cancelTitle    取消的标题
 *  @param cancelblock    取消的block
 *  @param confirmTitle   确定的标题
 *  @param confirmBlock   确定的block
 *
 */

+ (void)alertWithTitle:(NSString *)title
            message:(NSString *)message
       attributeStr:(NSString *)attributeStr
         attributes:(NSDictionary *)Attributes
  cancelButtonTitle:(NSString *)cancelTitle
        cancelBlock:(void (^)(void))cancelblock
 confirmButtonTitle:(NSString *)confirmTitle
       confirmBlock:(void (^)(void))confirmBlock;

/**
 *  没有确定按钮的alert
 *
 *  @param message        描述
 *  @param cancelTitle    取消的标题
 *
 */
+ (void)alertWithMessage:(NSString *)message
       cancelButtonTitle:(NSString *)cancelTitle
             cancelBlock:(void (^)(void))cancelBlock;

/**
 *  定时消失的alert
 *
 *  @param title          标题
 *  @param message        描述
 *  @param duration       延迟时间
 *  @param confirmBlock   完成回调
 *
 */

+ (void)alertViewTitle:(NSString *)title message:(NSString *)message duration:(NSTimeInterval)duration confirmBlock:(void (^)(void))confirmBlock;


@end

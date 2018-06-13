//
//  SGWBlockAlertManager.h
//  HaoCheKu
//
//  Created by renren on 2017/2/12.
//  Copyright © 2017年 Liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef void(^CallBackBlock)(NSInteger currentIndex, NSString *currentString);


@interface SGWBlockAlertManager : NSObject


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
 *  @return alertview或alertcontroller
 */

+(id)alertWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelTitle
        cancelBlock:(void (^)(void))cancelblock
 confirmButtonTitle:(NSString *)confirmTitle
       confirmBlock:(void (^)(void))confirmBlock;

+(id)alertWithViewController:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock;


+(id)alertWithTitle:(NSString *)title
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
 *  @param title          标题
 *  @param message        描述
 *  @param cancelTitle    取消的标题
 *
 *  @return alertview或alertcontroller
 */
+(id)alertWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelTitle;


/**
 *  定时消失的alert
 *
 *  @param title          标题
 *  @param message        描述
 *  @param duration       延迟时间
 *
 *  @return alertview或alertcontroller
 */
+ (id)alertViewTitle:(NSString *)title
             message:(NSString *)message
            duration:(NSTimeInterval)duration;

/**
 *  定时消失的alert
 *
 *  @param title            标题
 *  @param message          描述
 *  @param duration         延迟时间
 *  @param completionBlock  completionBlock
 *
 *  @return alertview或alertcontroller
 */
+ (id)alertViewTitle:(NSString *)title
             message:(NSString *)message
            duration:(NSTimeInterval)duration
     completionBlock:(void (^)(void))completionBlock;


/**
 开发中alert
 */
+ (void)showDevelopingAlertView;

/**
 sheet

 @param viewController      viewcontroller
 @param title               标题
 @param message             内容
 @param block               回调,currentIndex 和 currentString -1为cancel键
 @param cancelTitle         取消标题
 @param otherActionTitles   其他按钮title数组
 @param otherActionStyles   其他按钮style数组
 @return actionSheet或alertVC
 */

+ (id)sheetWithViewController:(UIViewController *)viewController
                        title:(NSString *)title
                      message:(NSString *)message
                callBackBlock:(CallBackBlock)block
            cancelButtonTitle:(NSString *)cancelTitle
            otherActionTitles:(NSArray *)otherActionTitles
            otherActionStyles:(NSArray *)otherActionStyles;




@end

@interface SGWBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)massage
                callBackBlock:(CallBackBlock)block
                  cancelTitle:(NSString *)cancelTitle
       otherButtonsTitleArray:(NSArray *)otherBtnstitleArray
       otherButtonsStyleArray:(NSArray *)otherBtnsStyleArray;

@end




/**
 * UIAlertController
 */

@interface SGWBlockAlertController : UIAlertController

+(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock;

+(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock
              viewController:(UIViewController *)viewController;

- (void)dismissAlertController:(UIViewController *)sender;

/**
 alertVC的sheet实现
 
 @param viewController      viewcontroller
 @param title               标题
 @param message             内容
 @param block               回调
 @param cancelTitle         取消按钮title
 @param otherActionTitles   其他action的title数组
 @param otherActionStyles   其他action的style数组
 
 @return alertVC
 */
+ (instancetype)initWithViewController:(UIViewController *)viewController
                                 title:(NSString *)title
                               message:(NSString *)message
                         callBackBlock:(CallBackBlock)block
                     cancelButtonTitle:(NSString *)cancelTitle
                     otherActionTitles:(NSArray *)otherActionTitles
                     otherActionStyles:(NSArray *)otherActionStyles;

@end

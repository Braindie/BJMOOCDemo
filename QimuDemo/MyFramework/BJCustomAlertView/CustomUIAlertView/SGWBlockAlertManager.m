//
//  SGWBlockAlertManager.m
//  HaoCheKu
//
//  Created by renren on 2017/2/12.
//  Copyright © 2017年 Liuhuan. All rights reserved.
//

#import "SGWBlockAlertManager.h"

#define SGWCurSysVersion [[UIDevice currentDevice].systemVersion integerValue]

@implementation SGWBlockAlertManager

+(id)alertWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelTitle
        cancelBlock:(void (^)(void))cancelblock
 confirmButtonTitle:(NSString *)confirmTitle
       confirmBlock:(void (^)(void))confirmBlock {
    
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:cancelTitle
                                                                          cancelBlock:cancelblock
                                                                   confirmButtonTitle:confirmTitle
                                                                         confirmBlock:confirmBlock];
    
    return alertController;
}

+(id)alertWithViewController:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock {
    
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:cancelTitle
                                                                          cancelBlock:cancelblock
                                                                   confirmButtonTitle:confirmTitle
                                                                         confirmBlock:confirmBlock viewController:viewController];
    
    return alertController;
}


+(id)alertWithTitle:(NSString *)title
            message:(NSString *)message
       attributeStr:(NSString *)attributeStr
         attributes:(NSDictionary *)Attributes
  cancelButtonTitle:(NSString *)cancelTitle
        cancelBlock:(void (^)(void))cancelblock
 confirmButtonTitle:(NSString *)confirmTitle
       confirmBlock:(void (^)(void))confirmBlock
{
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:cancelTitle
                                                                          cancelBlock:cancelblock
                                                                   confirmButtonTitle:confirmTitle
                                                                         confirmBlock:confirmBlock];
    
    NSMutableAttributedString *attribtStr1=[[NSMutableAttributedString alloc]initWithString:message];
    NSRange range1=[[attribtStr1 string]rangeOfString:attributeStr];
    [attribtStr1 addAttributes:Attributes range:range1];
    [alertController setValue:attribtStr1 forKey:@"attributedMessage"];
    
    return alertController;
}

+(id)alertWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelTitle {
    
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:cancelTitle
                                                                          cancelBlock:nil
                                                                   confirmButtonTitle:nil
                                                                         confirmBlock:nil];
    
    return alertController;
}

+ (id)alertViewTitle:(NSString *)title
             message:(NSString *)message
            duration:(NSTimeInterval)duration {
    
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:nil
                                                                          cancelBlock:nil
                                                                   confirmButtonTitle:nil
                                                                         confirmBlock:nil];
    
    [alertController performSelector:@selector(dismissAlertController:)
                          withObject:[UIApplication sharedApplication].keyWindow.rootViewController
                          afterDelay:duration];
    
    return alertController;
}

+ (id)alertViewTitle:(NSString *)title
             message:(NSString *)message
            duration:(NSTimeInterval)duration
     completionBlock:(void (^)(void))completionBlock {
    
    SGWBlockAlertController *alertController = [SGWBlockAlertController initWithTitle:title
                                                                              message:message
                                                                    cancelButtonTitle:nil
                                                                          cancelBlock:nil
                                                                   confirmButtonTitle:nil
                                                                         confirmBlock:nil];
    
    [alertController performSelector:@selector(dismissAlertController:)
                          withObject:[UIApplication sharedApplication].keyWindow.rootViewController
                          afterDelay:duration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (completionBlock) {
            completionBlock();
        }
    });
    
    return alertController;
}


+ (void)showDevelopingAlertView {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self alertViewTitle:@"" message:@"敬请期待..." duration:3 / 2];
    });
}



+ (id)sheetWithViewController:(UIViewController *)viewController
                        title:(NSString *)title
                      message:(NSString *)message
                callBackBlock:(CallBackBlock)block
            cancelButtonTitle:(NSString *)cancelTitle
            otherActionTitles:(NSArray *)otherActionTitles
            otherActionStyles:(NSArray *)otherActionStyles
{
    SGWBlockAlertController *alertController = [SGWBlockAlertController
                                               initWithViewController:viewController title:title message:message callBackBlock:block cancelButtonTitle:cancelTitle otherActionTitles:otherActionTitles otherActionStyles:otherActionStyles];
    
    return alertController;
}

@end




@interface SGWBlockAlertController ()

@property(nonatomic,copy) void (^cancelClicked)(void);
@property(nonatomic,copy) void (^confirmClicked)(void);

@end

@implementation SGWBlockAlertController

+(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock {
    
    UIViewController *viewController = [self getCurrentVC];
    
    title = title ? title : @"";
    message = message ? message : @"";
    
    SGWBlockAlertController *alertVC = [SGWBlockAlertController alertControllerWithTitle:title
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle != nil) {
        UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:cancelTitle
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              if (cancelblock) {
                                                                  cancelblock();
                                                              }
                                                              
                                                              [viewController dismissViewControllerAnimated:YES completion:nil];
                                                          }];
        [cancelBtn setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
        [alertVC addAction:cancelBtn];
    }
    
    
    if (confirmTitle != nil) {
        UIAlertAction *confirmBtn = [UIAlertAction actionWithTitle:confirmTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               confirmBlock();
                                                           }];
        //[confirmBtn setValue:NAVIGATIONBAR_YELLOWCOLOR forKey:@"_titleTextColor"];
        [alertVC addAction:confirmBtn];
    }
    
    [viewController presentViewController:alertVC animated:YES completion:nil];
    
    return alertVC;
}

+(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelTitle
                 cancelBlock:(void (^)(void))cancelblock
          confirmButtonTitle:(NSString *)confirmTitle
                confirmBlock:(void (^)(void))confirmBlock
              viewController:(UIViewController *)viewController {
    
    title = title ? title : @"";
    message = message ? message : @"";
    
    SGWBlockAlertController *alertVC = [SGWBlockAlertController alertControllerWithTitle:title
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle != nil) {
        UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:cancelTitle
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              if (cancelblock) {
                                                                  cancelblock();
                                                              }
                                                              
                                                              [viewController dismissViewControllerAnimated:YES completion:nil];
                                                          }];
        [cancelBtn setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
        [alertVC addAction:cancelBtn];
    }
    
    
    if (confirmTitle != nil) {
        UIAlertAction *confirmBtn = [UIAlertAction actionWithTitle:confirmTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               confirmBlock();
                                                           }];
        [confirmBtn setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
        [alertVC addAction:confirmBtn];
    }
    
    [viewController presentViewController:alertVC animated:YES completion:nil];
    
    return alertVC;
}

+ (instancetype)initWithViewController:(UIViewController *)viewController
                                 title:(NSString *)title
                               message:(NSString *)message
                         callBackBlock:(CallBackBlock)block
                     cancelButtonTitle:(NSString *)cancelTitle
                     otherActionTitles:(NSArray *)otherActionTitles
                     otherActionStyles:(NSArray *)otherActionStyles
{
    
    SGWBlockAlertController *alertVC = [SGWBlockAlertController alertControllerWithTitle:title
                                                                               message:message
                                                                        preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction;
    if (cancelTitle.length > 0 && ![cancelTitle isEqualToString:@"(null)"]) {
        cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(-1, cancelTitle);
            }
            [viewController dismissViewControllerAnimated:YES completion:nil];
            
        }];
        
    } else {
        cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(-1, @"取消");
            }
            [viewController dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    
    [alertVC addAction:cancelAction];
    
    if (otherActionTitles.count > 0 && otherActionStyles.count > 0 && otherActionTitles.count == otherActionStyles.count) {
        for (int i = 0; i < otherActionStyles.count; i++) {
            NSNumber *style = otherActionStyles[i];
            NSInteger btnStyle = style.integerValue;
            if (btnStyle == UIAlertActionStyleCancel) {
                btnStyle = UIAlertActionStyleDefault;
            }
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:otherActionTitles[i] style:btnStyle handler:^(UIAlertAction * _Nonnull action) {
                if (block) {
                    block(i, otherActionTitles[i]);
                }
            }];
            [alertVC addAction:action];
        }
    }
    
    [viewController presentViewController:alertVC animated:YES completion:nil];
    
    return alertVC;
}


- (void)dismissAlertController:(UIViewController *)sender {
    
    [sender dismissViewControllerAnimated:YES completion:nil];
}


//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
        
    } else {
        result = window.rootViewController;
    }
    
    return result;
}


@end


@interface SGWBlockActionSheet ()
@property (nonatomic, copy) CallBackBlock sheetCallBlcakBlock;

@property (nonatomic, strong) NSString *cancelBtnTitle;

@end

@implementation SGWBlockActionSheet

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)massage
                callBackBlock:(CallBackBlock)block
                  cancelTitle:(NSString *)cancelTitle
       otherButtonsTitleArray:(NSArray *)otherBtnstitleArray
       otherButtonsStyleArray:(NSArray *)otherBtnsStyleArray
{
    
    NSString *trueTitle = title;
    if (massage.length > 0 && ![massage isEqualToString:@"(null)"]) {
        trueTitle = [NSString stringWithFormat:@"%@\n%@", title, massage];
    }
    
    if (self = [super initWithTitle:title delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil]) {
        
        self.cancelBtnTitle = cancelTitle;
        if (otherBtnstitleArray.count > 0) {
            for (int i = 0; i < otherBtnstitleArray.count; i ++) {
                NSString *str = otherBtnstitleArray[i];
                if (str.length > 0 && ![str isEqualToString:@"(null)"]) {
                    [self addButtonWithTitle:str];
                }
            }
        }
        
        if (block) {
            self.sheetCallBlcakBlock = [block copy];
        }
        
    }
    return self;
}

#pragma mark - actionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *currentStr = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([currentStr isEqualToString:self.cancelBtnTitle]) {
        if (self.sheetCallBlcakBlock) {
            self.sheetCallBlcakBlock(- 1, currentStr);
        }
    } else {
        if (self.sheetCallBlcakBlock) {
            self.sheetCallBlcakBlock(buttonIndex, currentStr);
        }
    }
    
    
}

@end



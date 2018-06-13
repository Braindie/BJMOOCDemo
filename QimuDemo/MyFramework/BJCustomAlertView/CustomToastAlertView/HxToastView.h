//
//  HxToastView.h
//  NewsHD
//
//  Created by hexun macbook pro 2 on 11/29/11.
//  Copyright 2011 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HxToastView : UIView {
    
    NSString *toastText;
    BOOL     removeAfterShow;
}

@property (nonatomic, copy) NSString *toastText;
@property (nonatomic, assign) BOOL removeAfterShow;

+ (CGSize)sizeForText:(NSString *)text;
- (void)show:(BOOL)animated;

@end

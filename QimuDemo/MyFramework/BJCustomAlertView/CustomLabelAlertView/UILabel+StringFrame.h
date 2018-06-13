//
//  UILabel+StringFrame.h
//  pcl
//
//  Created by huaying on 15-1-30.
//  Copyright (c) 2015年 huaying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (StringFrame)



- (CGSize)boundingRectWithSize:(CGSize)size;
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;
/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;
/**
 *给UILabel设置行间距和字间距
 */
-(NSAttributedString *)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font;
/**
 * 计算UILabel的高度(带有行间距的情况)
 */
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;

+ (void)showErrorProgressLabelWithString:(NSString *)string;

+ (void)showErrorProgressLabelWithString:(NSString *)string onView:(UIView *)view;

+ (void)showErrorProgressLabelWithString:(NSString *)string completion:(void (^)(BOOL finished))completion;

/** 未测试,慎用! */
- (CGSize)settingTheLineSpacingWith:(UILabel *)contentLabel andLineSpacing:(float)lineSpacing;

/****************根据字体大小设置lable宽高*********************/


/** 计算文字的宽和高设置label的宽高*/
+(void)sizeWithFontToLabel:(UILabel *)label;

/** 计算文字的宽和高设置label的高*/
+(void)sizeWithFontToLabelHeight:(UILabel *)label;

/****************根据设置lable的行间距*********************/

/** 计算文字的宽和高设置label的高*/
+(void)setLabel:(UILabel *)label withLineSpacing:(CGFloat)lineSpacing;


@end

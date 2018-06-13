//
//  UILabel+StringFrame.m
//
//
//  Created by huaying on 15-1-30.
//  Copyright (c) 2015年 huaying. All rights reserved.
//

#import "UILabel+StringFrame.h"
#import "UIView+Extension.h"

@implementation UILabel (StringFrame)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

+ (void)showErrorProgressLabelWithString:(NSString *)string
{
    static BOOL isOpen;
    
    if (!isOpen) {
        isOpen = YES;
        UILabel * progressHUDLabel = [[UILabel alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:progressHUDLabel];
        progressHUDLabel.text = string;
        progressHUDLabel.numberOfLines = 0;
        progressHUDLabel.size =[progressHUDLabel boundingRectWithSize:CGSizeMake([UIApplication sharedApplication].keyWindow.width - 100, MAXFLOAT)];
        progressHUDLabel.backgroundColor = [UIColor blackColor];
        progressHUDLabel.font = [UIFont systemFontOfSize:14];
        progressHUDLabel.alpha = 0.0f;
        progressHUDLabel.textColor = [UIColor whiteColor];
        progressHUDLabel.height += 15;
        progressHUDLabel.width += 40;
        progressHUDLabel.x = ([UIApplication sharedApplication].keyWindow.width - progressHUDLabel.width) * 0.5;
        progressHUDLabel.y = ([UIApplication sharedApplication].keyWindow.height - progressHUDLabel.height) * 0.5;
        progressHUDLabel.textAlignment = NSTextAlignmentCenter;
        progressHUDLabel.layer.cornerRadius = 3.0f;
        progressHUDLabel.layer.masksToBounds = YES;
        
        [UIView animateWithDuration:1 animations:^{
            
            progressHUDLabel.alpha = 0.7f;
            
            
        } completion:^(BOOL finished) {
            
            sleep(1);
            
            progressHUDLabel.alpha = 0.0f;
            
            [progressHUDLabel removeFromSuperview];
            
            isOpen = NO;
            
        }];
        
      
    
    }
      
}

+ (void)showErrorProgressLabelWithString:(NSString *)string onView:(UIView *)view
{
    static BOOL isOpen;
    
    if (!isOpen) {
        isOpen = YES;
        UILabel * progressHUDLabel = [[UILabel alloc] init];
        [view addSubview:progressHUDLabel];
        progressHUDLabel.text = string;
        progressHUDLabel.numberOfLines = 0;
        progressHUDLabel.size =[progressHUDLabel boundingRectWithSize:CGSizeMake(view.width - 100, MAXFLOAT)];
        progressHUDLabel.backgroundColor = [UIColor blackColor];
        progressHUDLabel.font = [UIFont systemFontOfSize:14];
        progressHUDLabel.alpha = 0.0f;
        progressHUDLabel.textColor = [UIColor whiteColor];
        progressHUDLabel.height += 15;
        progressHUDLabel.width += 40;
        progressHUDLabel.x = (view.width - progressHUDLabel.width) * 0.5;
        progressHUDLabel.y = (view.height - progressHUDLabel.height) * 0.5;
        progressHUDLabel.textAlignment = NSTextAlignmentCenter;
        progressHUDLabel.layer.cornerRadius = 3.0f;
        progressHUDLabel.layer.masksToBounds = YES;
        
        [UIView animateWithDuration:1 animations:^{
            
            progressHUDLabel.alpha = 0.7f;
            
            
        } completion:^(BOOL finished) {
            
            sleep(1);
            
            progressHUDLabel.alpha = 0.0f;
            
            [progressHUDLabel removeFromSuperview];
            
            isOpen = NO;
            
        }];
        
        
    }
}


+ (void)showErrorProgressLabelWithString:(NSString *)string completion:(void (^)(BOOL finished))completion
{
    static BOOL isOpen;
    
    if (!isOpen) {
        isOpen = YES;
        UILabel * progressHUDLabel = [[UILabel alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:progressHUDLabel];
        progressHUDLabel.text = string;
        progressHUDLabel.numberOfLines = 0;
        progressHUDLabel.size =[progressHUDLabel boundingRectWithSize:CGSizeMake([UIApplication sharedApplication].keyWindow.width - 100, MAXFLOAT)];
        progressHUDLabel.backgroundColor = [UIColor blackColor];
        progressHUDLabel.font = [UIFont systemFontOfSize:14];
        progressHUDLabel.alpha = 0.0f;
        progressHUDLabel.textColor = [UIColor whiteColor];
        progressHUDLabel.height += 15;
        progressHUDLabel.width += 40;
        progressHUDLabel.x = ([UIApplication sharedApplication].keyWindow.width - progressHUDLabel.width) * 0.5;
        progressHUDLabel.y = ([UIApplication sharedApplication].keyWindow.height - progressHUDLabel.height) * 0.5;
        progressHUDLabel.textAlignment = NSTextAlignmentCenter;
        progressHUDLabel.layer.cornerRadius = 3.0f;
        progressHUDLabel.layer.masksToBounds = YES;
        
       
        
        [UIView animateWithDuration:0.25 animations:^{
            progressHUDLabel.alpha = 0.7f;
            
            isOpen = NO;

        } completion:^(BOOL finished) {
            
        progressHUDLabel.alpha = 0.0f;
        sleep(1);
        [progressHUDLabel removeFromSuperview];
            
            if (completion) {
                
                completion(finished);
            }
        }];
        
    }

    
    
    
}


- (CGSize)settingTheLineSpacingWith:(UILabel *)contentLabel andLineSpacing:(float)lineSpacing
{
    
    CGFloat Spacing = lineSpacing;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentLabel.text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    [paragraphStyle setLineSpacing:Spacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, contentLabel.text.length)];
    
    contentLabel.attributedText = attributedString;

    CGSize size = CGSizeMake(SCREEN_WIDTH, MAXFLOAT);
    
    return [contentLabel sizeThatFits:size];
}


+(void)sizeWithFontToLabel:(UILabel *)label;
{
    CGSize size = CGSizeMake(label.width, label.height);
    
    CGSize labelSize =[label boundingRectWithSize:size];
    label.frame=CGRectMake(label.x, label.y, labelSize.width, labelSize.height);
}
+(void)sizeWithFontToLabelHeight:(UILabel *)label
{
    CGSize size = CGSizeMake(label.width, label.height);
    
    CGSize labelSize = [label boundingRectWithSize:size];
    
    label.frame=CGRectMake(label.x, label.y, label.width, labelSize.height);
}

#pragma  mark--UILabel尺寸自适应
+(void)setLabel:(UILabel *)label withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [label  setAttributedText:attributedString];
    [label sizeToFit];
}
//给UILabel设置行间距和字间距

-(NSAttributedString *)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentCenter;
    
    paraStyle.lineSpacing = 6; //设置行间距
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@20.0f,
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    
    return attributeStr;
//    [label setAttributedText:attributeStr];
//    label.attributedText = attributeStr;
    
}
//计算UILabel的高度(带有行间距的情况)

-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = 6;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, SCREEN_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
    
}
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space
{
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [paragraphStyle setAlignment:label.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}
/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space
{
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}
@end

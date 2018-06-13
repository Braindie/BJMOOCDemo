//
//  HxToastView.m
//  NewsHD
//
//  Created by hexun macbook pro 2 on 11/29/11.
//  Copyright 2011 BeiJingChaoYangQu. All rights reserved.
//

#import "HxToastView.h"
//#import "HxGraphicsUtils.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+RoundedCorner.h"

#define STROK_COLOR [UIColor colorWithRed:.44 green:.44 blue:.44 alpha:0.1].CGColor
#define TOAST_BG_COLOR    [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor

#define BACK_GROUNDCOLOR [UIColor colorWithRed:29/255.0f green:161/255.0f blue:242/255.0f alpha:.95f]

@implementation HxToastView

@synthesize toastText;
@synthesize removeAfterShow;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code        
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 2;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
//        [self xw_roundedCornerWithRadius:3 cornerColor:[UIColor whiteColor]];
        self.alpha = 1;
//        self.alpha = 0.7;
//        self.backgroundColor = [[UIColor colorWithRed:73/255.0f green:73/255.0f blue:73/255.0f alpha:1] colorWithAlphaComponent:0.8];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
//        self.backgroundColor = BACK_GROUNDCOLOR;
        self.removeAfterShow = NO;
    }
    return self;
}

/**使用设定的字体绘制字符串到给定的点*/
- (void)drawString:(NSString *)string atPoint:(CGPoint)point withFont:(UIFont *)font
{
    
    if(string == nil || [string isEqualToString:@""])
        return;
//    NSDictionary *dict = @{NSFontAttributeName:font};
//    [string drawAtPoint:point withAttributes:dict];
    [string drawAtPoint:point withFont:font];
}

/**使用设定的字体计算字符串的大小*/
- (CGSize)measureString:(NSString *)string withFont:(UIFont *)font
{
    return [string sizeWithFont:font];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(toastText == nil || [@"" isEqualToString:toastText])
        return;
    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    drawRectWithRect(context, rect, [[UIColor clearColor] CGColor], [[[UIColor lightGrayColor] colorWithAlphaComponent:0.1] CGColor], 0, kCGPathFill);
//    drawRectWithRect(context, CGRectInset(rect, 1, 1), STROK_COLOR, [[UIColor colorWithWhite:0.9 alpha:0.1] CGColor], 0, kCGPathFill);
//    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.0];
    
    UIFont *font = [UIFont boldSystemFontOfSize:13.0f];
    CGSize textSize = [self measureString:toastText withFont:font];
    CGSize size = rect.size;
    
    [[UIColor whiteColor] set];
    CGPoint textPoint = CGPointMake((size.width - textSize.width) / 2,(size.height - textSize.height) / 2);
    [self drawString:toastText atPoint:textPoint withFont:font];
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)setToastText:(NSString *)_toastText
{
    @synchronized(self) {
        if(toastText != _toastText) {
            toastText = [_toastText copy];
        }
        [self setNeedsDisplay];
    }
}

- (void)hideToastView
{
    
    [UIView animateWithDuration:.1f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
//    [UIView setAnimationDelegate:nil];
    if(removeAfterShow)
        [self removeFromSuperview];
}

- (void)hideToastViewDelay
{
    [self performSelector:@selector(hideToastView) withObject:nil afterDelay:3];
}

- (void)show:(BOOL)animated
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideToastView) object:nil];
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:.4f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [self hideToastViewDelay];
    }];
    
//    [UIView beginAnimations:@"animationID" context:nil];
//	[UIView setAnimationDuration:0.5f];
//	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//	[UIView setAnimationRepeatAutoreverses:NO];
//    [UIView setAnimationTransition:(animated ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionNone)
//                           forView:self cache:NO];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDidStopSelector:@selector(hideToastViewDelay)];
//    self.hidden = NO;
//    [UIView commitAnimations];

}

+ (CGSize)sizeForText:(NSString *)text
{
    if(text == nil || text.length == 0)
        return CGSizeZero;
    
    UIFont *font = [UIFont boldSystemFontOfSize:13.0f];
    CGSize tmpSize = [text sizeWithFont:font];
    
    return CGSizeMake(tmpSize.width + 40, tmpSize.height + 18);
}


@end

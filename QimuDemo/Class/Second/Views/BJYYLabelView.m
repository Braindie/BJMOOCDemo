//
//  BJYYLabelView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/2/14.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJYYLabelView.h"
#import "YYAsyncLayer.h"
#import <CoreText/CoreText.h>

@interface BJYYLabelView ()
@property (nonatomic, assign) CTFrameRef ctFrame;

@end

@implementation BJYYLabelView

- (void)setTextStr:(NSString *)textStr{
    _textStr = textStr.copy;
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedUpdated)] commit];
}


- (void)setFont:(UIFont *)font {
    _font = font;
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedUpdated)] commit];
}

#pragma mark -
- (void)layoutSubviews {
    [super layoutSubviews];
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedUpdated)] commit];
}

- (void)contentsNeedUpdated {
    // do update
    [self.layer setNeedsDisplay];
}

#pragma mark - YYAsyncLayer

+ (Class)layerClass {
    return YYAsyncLayer.class;
}

- (YYAsyncLayerDisplayTask *)newAsyncDisplayTask {
    
    // capture current state to display task
    NSString *text = _textStr;
    UIFont *font = _font;
    
    YYAsyncLayerDisplayTask *task = [YYAsyncLayerDisplayTask new];
    task.willDisplay = ^(CALayer *layer) {
        //...
    };
    
    task.display = ^(CGContextRef context, CGSize size, BOOL(^isCancelled)(void)) {
        if (isCancelled()) return;
        
//        NSArray *lines = CreateCTLines(text, font, size.width);
        
//        if (isCancelled()) return;

//        for (int i = 0; i < lines.count; i++) {
//            CTLineRef line = line[i];
//            CGContextSetTextPosition(context, 0, i * font.pointSize * 1.5);
//            CTLineDraw(line, context);
//            if (isCancelled()) return;
//        }
        
//        NSAttributedString *truncatedString = [[NSAttributedString alloc] initWithString:text];
//        CTLineRef token = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)truncatedString);
//        CGContextSetTextPosition(context, 0, font.pointSize * 2);
//        CTLineDraw(token, context);
        
        [self drawInContext:context withSize:size andText:text];
        
    };
    
    task.didDisplay = ^(CALayer *layer, BOOL finished) {
        if (finished) {
            // finished
        } else {
            // cancelled
        }
    };
    
    return task;
}

#pragma mark - private
- (void)drawInContext:(CGContextRef)context withSize:(CGSize)size andText:(NSString *)text{
    //设置context的ctm，用于适应core text的坐标体系
    CGContextSaveGState(context);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    //设置CTFramesetter
    NSAttributedString *truncatedString = [[NSAttributedString alloc] initWithString:text];

    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString((CFAttributedStringRef)truncatedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
    //创建CTFrame
    CTFrameRef ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    //    if (ctFrame == NULL) {
    //        return;
    //    }
    //把文字内容绘制出来
    CTFrameDraw(ctFrame, context);
    //获取画出来的内容的行数
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    
    //获取每行的原点坐标
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    for (int i = 0; i < CFArrayGetCount(lines); i++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGFloat lineAscent;
        CGFloat lineDescent;
        CGFloat lineLeading;
        //获取每行的宽度和高度
        CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);
        //获取每个CTRun
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        CGFloat lineWidth = 0.;
        for (int j = 0; j < CFArrayGetCount(runs); j++) {
            CGFloat runAscent;
            CGFloat runDescent;
            CGPoint lineOrigin = lineOrigins[i];
            //获取每个CTRun
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run);
            CGRect runRect;
            //调整CTRun的rect
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            lineWidth+=runRect.size.width;
            
            runRect=CGRectMake(lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL), lineOrigin.y , runRect.size.width, runAscent+runDescent);
            //CFRelease(run);
            NSString *imageName = [attributes objectForKey:@"imageName"];
            if (imageName) {
                UIImage *image = [UIImage imageNamed:imageName];
                if (image) {
                    CGRect imageDrawRect;
                    imageDrawRect.size =CGSizeMake(18., 18.);
                    imageDrawRect.origin.x = runRect.origin.x + lineOrigin.x;
                    imageDrawRect.origin.y = lineOrigin.y-lineDescent-2;//+drawRect.origin.y;
                    CGContextDrawImage(context, imageDrawRect, image.CGImage);
                }
            }
        }
    }
    CGContextRestoreGState(context);
    CFRelease(framesetter);
    if (path) {
        CGPathRelease(path);
    }
    if (ctFrame) {
        self.ctFrame = CFRetain(ctFrame);
        CFRelease(ctFrame);
    }
}


@end

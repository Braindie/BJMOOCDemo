//
//  HxGraphicsUtils.h
//  NewsHD
//
//  Created by hexun macbook pro 2 on 11/22/11.
//  Copyright 2011 BeiJingChaoYangQu. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

/*绘制直线*/
void drawLine(CGContextRef context, CGFloat startX, CGFloat startY, 
			  CGFloat endX, CGFloat endY, CGColorRef color, CGFloat lineWidth);

/*绘制折线*/
void drawLines(CGContextRef context, const CGPoint points[], 
			   size_t count, CGColorRef color, CGFloat lineWidth);

/*绘制虚线*/
void drawDottedLine(CGContextRef context, CGFloat startX, CGFloat startY,
					CGFloat endX, CGFloat endY, const CGFloat lengths[],
					size_t count, CGColorRef color, CGFloat lineWidth);

/*绘制渐变*/
void drawGradientLine(CGContextRef context, CGFloat startX, CGFloat startY,
              CGFloat endX, CGFloat endY);

/*绘制矩形*/
void drawRect(CGContextRef context, CGFloat startX, CGFloat startY,
			  CGFloat width, CGFloat height, CGColorRef strokeColor,
			  CGColorRef fillColor, CGFloat borderWidth,CGPathDrawingMode drawMode);

/*绘制矩形*/
void drawRectWithRect(CGContextRef context, CGRect rect, CGColorRef strokeColor,
                      CGColorRef fillColor, CGFloat borderWidth, CGPathDrawingMode drawMode);



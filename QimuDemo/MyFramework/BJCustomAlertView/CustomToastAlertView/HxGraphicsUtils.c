//
//  HxGraphicsUtils.c
//  NewsHD
//
//  Created by hexun macbook pro 2 on 11/22/11.
//  Copyright 2011 BeiJingChaoYangQu. All rights reserved.
//

#include "HxGraphicsUtils.h"

void drawLine(CGContextRef context, CGFloat startX, CGFloat startY, 
			  CGFloat endX, CGFloat endY, CGColorRef color, CGFloat lineWidth) {
	
	CGContextSaveGState(context);
	
	if(color)
		CGContextSetStrokeColorWithColor(context, color);
	if (lineWidth > 0)
		CGContextSetLineWidth(context, lineWidth);
	
	CGContextMoveToPoint(context, startX, startY);
	CGContextAddLineToPoint(context, endX, endY);
	CGContextStrokePath(context);
	
	CGContextRestoreGState(context);
}

void drawLines(CGContextRef context, const CGPoint points[],
			   size_t count,CGColorRef color, CGFloat lineWidth) {
    
	CGContextSaveGState(context);
	
	if (color)
		CGContextSetStrokeColorWithColor(context, color);
	
	if (lineWidth > 0)
		CGContextSetLineWidth(context, lineWidth);
	
	CGContextSetLineJoin(context, kCGLineJoinRound);
	CGContextAddLines(context, points, count);
	CGContextStrokePath(context);
	
	CGContextRestoreGState(context);
    
}

void drawDottedLine(CGContextRef context, CGFloat startX, CGFloat startY,
					CGFloat endX, CGFloat endY, const CGFloat lengths[],
					size_t count, CGColorRef color, CGFloat lineWidth) {
	
	CGContextSaveGState(context);
	
	if(color)
		CGContextSetStrokeColorWithColor(context, color);
	if(lineWidth > 0)
		CGContextSetLineWidth(context, lineWidth);
	
	CGContextSetLineDash(context, 0, lengths, count);
	CGContextMoveToPoint(context, startX, startY);
	CGContextAddLineToPoint(context, endX, endY);
	CGContextStrokePath(context);
    
	CGContextRestoreGState(context);
}

void drawGradientLine(CGContextRef context, CGFloat startX, CGFloat startY,
                      CGFloat endX, CGFloat endY) {
 
    CGContextSaveGState(context);
    
    CGGradientRef gradientRef;
    CGColorSpaceRef colorSpaceRef;
    
    size_t count = 2;
//    CGFloat locations[] = {0.0,0.1,1.0};
    CGFloat colors[] = {
        0.694,0.721,0.784,0.4,
//        0.8,0.829,0.867,0.4,
        1.0,1.0, 1.0, 0.4,
    };
    
    colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    gradientRef = CGGradientCreateWithColorComponents(colorSpaceRef, colors, nil, count);
    CGContextSetLineWidth(context, 1);
    CGContextClipToRect(context, CGRectMake(startX - 0.5, startY, 1, endY - startY));
    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(startX, startY), CGPointMake(endX, endY), 0);
    
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    CGContextRestoreGState(context);
}


void drawRect(CGContextRef context, CGFloat startX, CGFloat startY,
			  CGFloat width, CGFloat height, CGColorRef strokeColor,
			  CGColorRef fillColor, CGFloat borderWidth, CGPathDrawingMode drawMode) {
    
	CGContextSaveGState(context);
	
	drawRectWithRect(context, 
					 CGRectMake(startX, startY, width, height),
					 strokeColor, 
					 fillColor,
					 borderWidth,
					 drawMode);
	
	CGContextRestoreGState(context);
    
}

void drawRectWithRect(CGContextRef context, CGRect rect, CGColorRef strokeColor,
					  CGColorRef fillColor, CGFloat borderWidth,
					  CGPathDrawingMode drawMode) {
	
	CGContextSaveGState(context);
	
	if (drawMode == kCGPathStroke) {
		
		CGContextSetStrokeColorWithColor(context, strokeColor);
		
	} else {
		
		CGContextSetFillColorWithColor(context, fillColor);
		CGContextSetStrokeColorWithColor(context, strokeColor);
		
	}
	
	if (borderWidth > 0)
		CGContextSetLineWidth(context, borderWidth);
	
	CGContextAddRect(context, rect);
	CGContextDrawPath(context, drawMode);
	
	CGContextRestoreGState(context);
	
	
}

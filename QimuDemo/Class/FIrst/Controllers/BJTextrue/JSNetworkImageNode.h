//
//  JSNetworkImageNode.h
//  JPAsyncDisplayKit
//
//  Created by iOS on 2018/3/8.
//  Copyright © 2018年 sunpeng. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface JSNetworkImageNode : ASDisplayNode

/**
 网络地址
 */
@property (nonatomic, copy) NSURL *URL;
/**
 转场color
 */
@property (nonatomic, strong)UIColor *placeholderColor;
/**
 静态image
 */
@property (nonatomic, strong)UIImage *image;
/**
 转场时间
 */
@property (nonatomic, assign)NSTimeInterval js_placeholderFadeDuration;
/**
 空置图片
 */
@property (nonatomic, strong)UIImage *defaultImage;

@end

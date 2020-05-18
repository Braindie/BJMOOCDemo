//
//  JSNetworkImageNode.m
//  JPAsyncDisplayKit
//
//  Created by iOS on 2018/3/8.
//  Copyright © 2018年 sunpeng. All rights reserved.
//

#import "JSNetworkImageNode.h"
#import "JSWebImageManager.h"
//#import <PINRemoteImage/PINRemoteImage.h>

@interface JSNetworkImageNode ()<ASNetworkImageNodeDelegate>

/**
 网络图片
 */
@property (nonatomic, strong) ASNetworkImageNode *netImgNode;
/**
 本地图片
 */
@property (nonatomic, strong) ASImageNode *imageNode;

@end

@implementation JSNetworkImageNode

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubnode:self.netImgNode];
        [self addSubnode:self.imageNode];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:(UIEdgeInsetsZero) child:!self.netImgNode.URL ? self.imageNode : self.netImgNode];
}

- (ASNetworkImageNode *)netImgNode{
    if (!_netImgNode) {
        _netImgNode = [[ASNetworkImageNode alloc] initWithCache:JSWebImageManager.sharedManager downloader:JSWebImageManager.sharedManager];
        _netImgNode.delegate = self;
        _netImgNode.shouldCacheImage = NO;
    }
    return _netImgNode;
}

- (ASImageNode *)imageNode{
    if (!_imageNode) {
        _imageNode = [[ASImageNode alloc] init];
    }
    return _imageNode;
}

- (void)setURL:(NSURL *)URL{
    _URL = URL;
    if ([YYImageCache.sharedCache containsImageForKey:[YYWebImageManager.sharedManager cacheKeyForURL:URL]]) {
        self.imageNode.image = [YYImageCache.sharedCache getImageForKey:[YYWebImageManager.sharedManager cacheKeyForURL:URL]];
    } else {
        self.netImgNode.URL = _URL;
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.netImgNode.placeholderColor = placeholderColor;
}

- (void)setImage:(UIImage *)image{
    self.netImgNode.image = image;
}

- (void)setDefaultImage:(UIImage *)defaultImage{
    self.netImgNode.defaultImage = defaultImage;
}

- (void)setJs_placeholderFadeDuration:(NSTimeInterval)js_placeholderFadeDuration{
    self.netImgNode.placeholderFadeDuration = js_placeholderFadeDuration;
}

@end


//
//  BJBannerASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJBannerASCellNode.h"

#import "JSNetworkImageNode.h"

@implementation BJBannerASCellNode {
//    ASTextNode *_titleTextNode;
    
    JSNetworkImageNode *_imageNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        _titleTextNode = [[ASTextNode alloc] init];
//        NSDictionary *titleDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14.0f] };
//        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:@"名字" attributes:titleDic];
//        _titleTextNode.attributedText = titleAttr;
        
        
//        _imageNode = [[JSNetworkImageNode alloc] init];
//        _imageNode.placeholderColor = [UIColor whiteColor];
//        [_imageNode setPlaceholderEnabled:NO];
//        _imageNode.placeholderEnabled = NO;
//        [UIImage imageNamed:@"bj_cell_good"];
//        _imageNode.placeholderFadeDuration = 2;
        
        _imageNode = [[JSNetworkImageNode alloc] init];
//        [_imageNode setPlaceholderEnabled:NO];
//        _imageNode.image = [YYImageCache.sharedCache getImageForKey:[YYWebImageManager.sharedManager cacheKeyForURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589612965182&di=05be61b1f851fba0f8ceb18f7e861caa&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Feaf81a4c510fd9f95f48a24b212dd42a2834a4b1.jpg"]]];
//        _imageNode.image = [UIImage imageNamed:@"blue"];

        
        _imageNode.URL = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589612965182&di=05be61b1f851fba0f8ceb18f7e861caa&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Feaf81a4c510fd9f95f48a24b212dd42a2834a4b1.jpg"];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (void)didLoad {
    [super didLoad];
    
//    UIImage *image = [YYImageCache.sharedCache getImageForKey:[YYWebImageManager.sharedManager cacheKeyForURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589612965182&di=05be61b1f851fba0f8ceb18f7e861caa&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Feaf81a4c510fd9f95f48a24b212dd42a2834a4b1.jpg"]]];
//    _imageNode.image = image;
    
    
//    UIImage *image = [UIImage imageNamed:@"blue"];
//    _imageNode.image = image;

    
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
//    _titleTextNode.style.height = ASDimensionMake(20);
    _imageNode.style.preferredSize = CGSizeMake(SCREEN_WIDTH, 300);
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) child:_imageNode];
}



@end

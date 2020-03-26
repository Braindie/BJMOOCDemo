//
//  BJBannerASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJBannerASCellNode.h"

@implementation BJBannerASCellNode {
    ASTextNode *_titleTextNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _titleTextNode = [[ASTextNode alloc] init];
        NSDictionary *titleDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14.0f] };
        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:@"名字" attributes:titleDic];
        _titleTextNode.attributedText = titleAttr;
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) child:_titleTextNode];
}

@end

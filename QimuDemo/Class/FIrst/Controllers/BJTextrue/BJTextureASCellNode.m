//
//  BJTextureASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/24.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJTextureASCellNode.h"

@implementation BJTextureASCellNode {
    ASTextNode *_titleTextNode;
    ASNetworkImageNode *_titleImageNode;
}

- (instancetype)initWithObject:(NSString *)string
{
    self = [super init];
    if (self) {
        _titleTextNode = [[ASTextNode alloc] init];
        NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:12.0f] };
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:string attributes:attrs];
        _titleTextNode.attributedText = str;
        
        _titleImageNode = [[ASNetworkImageNode alloc] init];
        _titleImageNode.URL = [NSURL URLWithString:@"http://p1.img.cctvpic.com/photoAlbum/page/performance/img/2018/6/8/1528429861352_588.png"];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    _titleImageNode.style.preferredSize = CGSizeMake(50, 50);
    _titleImageNode.cornerRadius = 25;
    _titleImageNode.clipsToBounds = YES;
    ASInsetLayoutSpec *inset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 15, 20, SCREEN_WIDTH-15-50) child:_titleImageNode];
    
    return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumX child:inset];
}
@end

//
//  XBPageASNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import "XBPageASNode.h"
#import "XBSegmentedNode.h"
#import "XBPagerNode.h"


static NSArray<NSString *> *segmentedItems() {
    return @[@"First", @"Second"];
}


@implementation XBPageASNode {
    ASTextNode *_textNode;
    XBSegmentedNode *_segmentedNode;
    XBPagerNode *_pagerNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _segmentedNode = [[XBSegmentedNode alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) titles:segmentedItems() selectedIndex:0];
        
        _pagerNode = [[XBPagerNode alloc] initWithSegmentedItems:segmentedItems()];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    _segmentedNode.style.preferredSize = CGSizeMake(SCREEN_WIDTH, 44);
    _pagerNode.style.preferredSize = CGSizeMake(SCREEN_WIDTH, 500);
    verticalStack.children = @[_segmentedNode, _pagerNode];
    
    return verticalStack;
}


@end

//
//  BJPageASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJPageASCellNode.h"
#import "XBSegmentedNode.h"

static NSArray<NSString *> *segmentedItems() {
    return @[@"First", @"Second"];
}

@implementation BJPageASCellNode {
    XBSegmentedNode *_segmentedNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _segmentedNode = [[XBSegmentedNode alloc] initWithFrame:CGRectMake(0, 0, 300, 44) titles:segmentedItems() selectedIndex:0];
        
        self.pagerNode = [[XBPagerNode alloc] initWithSegmentedItems:segmentedItems()];
        @weakify(self)
        self.pagerNode.outTableCanScrollBlock = ^{
            @strongify(self)
            if (self.outTableCanScrollBlock) {
                self.outTableCanScrollBlock();
            }
        };
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}



- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    _segmentedNode.style.preferredSize = CGSizeMake(SCREEN_WIDTH, 44);
    self.pagerNode.style.preferredSize = CGSizeMake(SCREEN_WIDTH, 800);
    verticalStack.children = @[_segmentedNode, self.pagerNode];
    
    return verticalStack;
}


@end

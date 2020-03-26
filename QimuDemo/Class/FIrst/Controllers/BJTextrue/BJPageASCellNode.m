//
//  BJPageASCellNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJPageASCellNode.h"
//#import "XBPageASController.h"

#import "XBSegmentedNode.h"
#import "XBSinglePageASController.h"

static NSArray<NSString *> *segmentedItems() {
    return @[@"First", @"Second"];
}

@implementation BJPageASCellNode {
//    XBPageASController *_pageVCNode;
    
    ASTextNode *_textNode;
    
    XBSegmentedNode *_segmentedNode;
    
    XBSinglePageASController *_pagerNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        _segmentedNode = [[XBSegmentedNode alloc] initWithFrame:CGRectMake(0, 0, 300, 44) titles:segmentedItems() selectedIndex:0];
//        [self addSubnode:_segmentedNode];

        
        _pagerNode = [[XBSinglePageASController alloc] initWithFrame:CGRectMake(0, 44, 300, 600) segmentedItems:segmentedItems()];
//        [self addSubnode:_pagerNode.node];
//        [self.view addSubnode:_pagerNode.node];
        
//        _pageVCNode = [[XBPageASController alloc] init];
        
        
//        _textNode = [[ASTextNode alloc] init];
//        NSDictionary *titleDic = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14.0f] };
//        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:@"page" attributes:titleDic];
//        _textNode.attributedText = titleAttr;
                
        
//        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}



- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    _segmentedNode.style.preferredSize = CGSizeMake(300, 44);
    _pagerNode.node.style.preferredSize = CGSizeMake(300, 500);
    verticalStack.children = @[_segmentedNode, _pagerNode.node];
    
    return verticalStack;
}


@end

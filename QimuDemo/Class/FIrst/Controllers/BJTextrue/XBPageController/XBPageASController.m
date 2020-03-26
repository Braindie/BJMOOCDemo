//
//  XBPageASController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "XBPageASController.h"

#import "XBASNotificationConstants.h"
#import "XBSegmentedNode.h"
#import "BJTextureASViewController.h"

static NSArray<NSString *> *segmentedItems() {
    return @[@"First", @"Second", @"Third"];
}

static CGFloat kSegmentedNodeHeight = 44.0f;

@interface XBPageASController () {
    XBSegmentedNode        *_segmentedNode;
    BJTextureASViewController           *_PagerNode;
}

@end


@implementation XBPageASController

- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.node.backgroundColor = [UIColor whiteColor];
    [self setupSegmentedNode];
//    [self setupPagerNode];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [[NSNotificationCenter defaultCenter] postNotificationName:SegmentedNodeRedrawWholeNodeBySizeNotification object:nil userInfo:@{@"newWidth": [NSNumber numberWithFloat: size.width], @"newHeight": [NSNumber numberWithFloat: kSegmentedNodeHeight]}];
}

- (void)setupSegmentedNode {
    if (!_segmentedNode) {
        _segmentedNode = [[XBSegmentedNode alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kSegmentedNodeHeight) titles:segmentedItems() selectedIndex:0];
    }
    [self.view addSubnode:_segmentedNode];
}

- (void)setupPagerNode {
    if (!_PagerNode) {
//        _PagerNode = [[BJTextureASViewController alloc] initWithFrame:CGRectMake(0, _segmentedNode.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - _segmentedNode.frame.size.height) segmentedItems:segmentedItems()];
    }
    [self.view addSubnode:_PagerNode.node];
}


@end

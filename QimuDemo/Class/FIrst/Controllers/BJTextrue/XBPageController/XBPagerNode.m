//
//  XBPagerNode.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import "XBPagerNode.h"
#import "XBASNotificationConstants.h"

@interface XBPagerNode ()<ASPagerDataSource, ASPagerDelegate>

@property (nonatomic, strong) PageCell *leftCellNode;
@property (nonatomic, strong) PageCell *rightCellNode;

@end

@implementation XBPagerNode {
    NSArray<NSString *>       *_segmentedItems;
    ASPagerNode *_pagerNode;
}

- (instancetype)initWithSegmentedItems:(NSArray<NSString *> *)segmentedItems {
    if (!(self = [super init])) {
        return nil;
    }
    
    _segmentedItems = segmentedItems;
    
    _pagerNode = [[ASPagerNode alloc] init];
    _pagerNode.dataSource = self;
    _pagerNode.delegate = self;
    
    
    self.automaticallyManagesSubnodes = YES;
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASInsetLayoutSpec *layout = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:_pagerNode];
    
    return layout;
}


- (void)setIsCanScroll:(BOOL)isCanScroll {
    _isCanScroll = isCanScroll;
    _leftCellNode.isCanScroll = isCanScroll;
    _rightCellNode.isCanScroll = isCanScroll;
}

- (void)resetContentOffset {
    _leftCellNode.tableNode.contentOffset = CGPointZero;
    _rightCellNode.tableNode.contentOffset = CGPointZero;
}

#pragma mark - ASPagerDelegate
- (NSInteger)numberOfPagesInPagerNode:(nonnull ASPagerNode *)pagerNode {
    return _segmentedItems.count;
}

- (ASSizeRange)pagerNode:(ASPagerNode *)pagerNode constrainedSizeForNodeAtIndex:(NSInteger)index {
    return ASSizeRangeMake(pagerNode.bounds.size);
}

- (ASCellNode *)pagerNode:(ASPagerNode *)pagerNode nodeAtIndex:(NSInteger)index {
    if (index == 0) {
        _leftCellNode = [[PageCell alloc] initWithText:_segmentedItems[index]];
        @weakify(self)
        _leftCellNode.outTableCanScrollBlock = ^{
            @strongify(self)
            if (self.outTableCanScrollBlock) {
                self.outTableCanScrollBlock();
            }
        };
        return _leftCellNode;
    } else {
        _rightCellNode = [[PageCell alloc] initWithText:_segmentedItems[index]];
        @weakify(self)
        _rightCellNode.outTableCanScrollBlock = ^{
            @strongify(self)
            if (self.outTableCanScrollBlock) {
                self.outTableCanScrollBlock();
            }
        };
        return _rightCellNode;
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x >= 0) {
        NSUInteger nextSegment = 0;
        if (0 == scrollView.contentOffset.x) {
            nextSegment = 0;
        } else if (scrollView.contentSize.width - (scrollView.contentSize.width / _segmentedItems.count) == scrollView.contentOffset.x) {
            nextSegment = _segmentedItems.count - 1;
        } else {
            CGFloat widthInScreenView = (NSInteger)scrollView.contentOffset.x % (NSInteger)scrollView.frame.size.width;
            if (widthInScreenView < scrollView.frame.size.width / 2) {
                nextSegment = (NSInteger)scrollView.contentOffset.x / (NSInteger)scrollView.frame.size.width;
            } else {
                nextSegment = (NSInteger)scrollView.contentOffset.x / (NSInteger)scrollView.frame.size.width + 1;
            }
        }
        NSDictionary *userInfo = @{@"selectedSegment": [NSNumber numberWithUnsignedInteger:nextSegment]};
        [[NSNotificationCenter defaultCenter] postNotificationName:SegmentedNodeSelectedSegmentNotification object:nil userInfo:userInfo];
    }
    NSDictionary *splitUserInfo = @{@"frameX": [NSNumber numberWithInteger:scrollView.contentOffset.x / _segmentedItems.count]};
    [[NSNotificationCenter defaultCenter] postNotificationName:SegmentedNodeRedrawBottomSplitNodeNotification object:nil userInfo:splitUserInfo];
}


@end

//
//  XBSinglePageASController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import "XBSinglePageASController.h"
#import "XBASNotificationConstants.h"
#import "PageCell.h"

@interface XBSinglePageASController () <ASPagerNodeDataSource, ASPagerDelegate>

@end

@implementation XBSinglePageASController {
    NSArray<NSString *>       *_segmentedItems;
    ASPagerNode *_pagerNode;
}

- (instancetype)initWithFrame:(CGRect)frame segmentedItems:(NSArray<NSString *> *)segmentedItems {
    
    self = [super initWithNode:[[ASPagerNode alloc] init]];
    if (self == nil) {
      return self;
    }
    _segmentedItems = segmentedItems;

//    _pagerNode = [[ASPagerNode alloc] init];
//    self = [super initWithNode:_pagerNode];
//
//    if (self) {
//        _segmentedItems = segmentedItems;
//    }


    return self;
    
//    self.node.dataSource = self;
//    self.node.delegate = self;
//    self.node.allowsSelection = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.frame = frame;
//    self.node.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNotifications];
}

- (void)setupNotifications {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToSelectedPageNotification:) name:PagerNodeScrollToSelectedPageNotification object:nil];
}

- (void)scrollToSelectedPageNotification:(NSNotification *)notification {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = notification.userInfo;
        NSUInteger selectedPage = [[userInfo objectForKey:@"selectedPage"] unsignedIntegerValue];
        [weakSelf.node scrollToPageAtIndex:selectedPage animated:YES];
    });
}

#pragma mark - ASPagerDelegate
- (NSInteger)numberOfPagesInPagerNode:(nonnull ASPagerNode *)pagerNode {
    return _segmentedItems.count;
}

- (ASSizeRange)pagerNode:(ASPagerNode *)pagerNode constrainedSizeForNodeAtIndex:(NSInteger)index {
    return ASSizeRangeMake(pagerNode.bounds.size);
}

- (ASCellNode *)pagerNode:(ASPagerNode *)pagerNode nodeAtIndex:(NSInteger)index {
    PageCell *cellNode = [[PageCell alloc] initWithText:_segmentedItems[index]];
    return cellNode;
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

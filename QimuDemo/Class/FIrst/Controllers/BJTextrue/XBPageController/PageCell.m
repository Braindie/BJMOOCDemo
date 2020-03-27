//
//  PageCell.m
//  SegmentedAndPagerNodeExample
//
//  Created by Archimboldi Mao on 2018/4/30.
//  Copyright © 2018 me.archimboldi. All rights reserved.
//

#import "PageCell.h"
#import "BJTextureASCellNode.h"

@interface PageCell ()<ASTableDelegate, ASTableDataSource>

@end

@implementation PageCell {
}

- (instancetype)initWithText:(NSString *)titleText {
    if (!(self = [super init])) {
        return nil;
    }
    
    _tableNode = [[XBASTableNode alloc] init];
    _tableNode.dataSource = self;
    _tableNode.delegate = self;
    self.isCanScroll = NO;

    self.automaticallyManagesSubnodes = YES;
    
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:_tableNode];
}



- (void)setIsCanScroll:(BOOL)isCanScroll {
    _isCanScroll = isCanScroll;
    _tableNode.view.showsVerticalScrollIndicator = isCanScroll;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.isCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY <= 0.f) {
        self.isCanScroll = NO;
        scrollView.contentOffset = CGPointZero;

        // 通知外层tableView可以滑动了
        if (self.outTableCanScrollBlock) {
            self.outTableCanScrollBlock();
        }
    }
}


#pragma mark - ASTableDataSource methods

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)() = ^ASCellNode *() {
        BJTextureASCellNode *cellNode = [[BJTextureASCellNode alloc] initWithObject:@"hello"];
        cellNode.addBlock = ^{
            NSLog(@"添加好友");
        };
        return cellNode;
    };
    return ASCellNodeBlock;
}

@end

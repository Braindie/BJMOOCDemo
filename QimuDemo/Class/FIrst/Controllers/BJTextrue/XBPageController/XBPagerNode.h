//
//  XBPagerNode.h
//  QimuDemo
//
//  Created by 张文军 on 2020/3/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PageCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBPagerNode : ASDisplayNode

- (instancetype)initWithSegmentedItems:(NSArray<NSString *> *)segmentedItems;

@property (nonatomic, assign) BOOL isCanScroll;


@property (nonatomic, copy) void (^outTableCanScrollBlock) (void);

- (void)resetContentOffset;
@end

NS_ASSUME_NONNULL_END

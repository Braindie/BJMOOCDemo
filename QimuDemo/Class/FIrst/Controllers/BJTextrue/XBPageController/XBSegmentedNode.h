//
//  XBSegmentedNode.h
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBSegmentedNode : ASDisplayNode

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles selectedIndex:(NSUInteger)selectedIndex;

@end

NS_ASSUME_NONNULL_END

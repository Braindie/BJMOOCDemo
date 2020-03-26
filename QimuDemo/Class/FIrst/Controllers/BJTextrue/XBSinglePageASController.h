//
//  XBSinglePageASController.h
//  QimuDemo
//
//  Created by 张文军 on 2020/3/26.
//  Copyright © 2020 ll. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBSinglePageASController : ASViewController<ASPagerNode *>

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame segmentedItems:(NSArray<NSString *> *)segmentedItems;

@end

NS_ASSUME_NONNULL_END

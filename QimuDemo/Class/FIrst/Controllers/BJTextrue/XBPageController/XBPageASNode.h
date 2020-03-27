//
//  XBPageASNode.h
//  QimuDemo
//
//  Created by 张文军 on 2020/3/27.
//  Copyright © 2020 ll. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBPageASNode : ASDisplayNode

@property (nonatomic, copy) void (^outTableCanScrollBlock) (void);

@end

NS_ASSUME_NONNULL_END

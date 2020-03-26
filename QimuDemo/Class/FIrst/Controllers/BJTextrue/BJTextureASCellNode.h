//
//  BJTextureASCellNode.h
//  QimuDemo
//
//  Created by 张文军 on 2020/3/24.
//  Copyright © 2020 ll. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJTextureASCellNode : ASCellNode

- (instancetype)initWithObject:(NSString *)string;

@property (nonatomic, copy) void (^addBlock) (void);

@property (nonatomic, copy) void (^goodBlock) (void);

@property (nonatomic, copy) void (^eyesBlock) (void);

@end

NS_ASSUME_NONNULL_END

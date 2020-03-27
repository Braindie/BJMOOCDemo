//
//  PageCell.h
//  SegmentedAndPagerNodeExample
//
//  Created by Archimboldi Mao on 2018/4/30.
//  Copyright © 2018 me.archimboldi. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "XBASTableNode.h"

@interface PageCell: ASCellNode

- (instancetype)initWithText:(NSString *)titleText;

@property (nonatomic, assign) BOOL isCanScroll;

@property (nonatomic, strong) XBASTableNode *tableNode;

@property (nonatomic, copy) void (^outTableCanScrollBlock) (void);
@end

//
//  BJTableViewHeightCell.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/19.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTableViewHeightCell.h"

@implementation BJTableViewHeightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(BJTableViewHeightModel *)model{
    _model = model;
    
    _titleLabel.text = model.title;
    _contentLabel.text = model.content;
}

//- (CGSize)sizeThatFits:(CGSize)size{
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLabel sizeThatFits:size].height;
//    totalHeight += [self.contentLabel sizeThatFits:size].height;
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}

@end

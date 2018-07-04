//
//  LiveListCell.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/6/2.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "LiveListCell.h"
#import "UIImageView+WebCache.h"


@implementation LiveListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setModel:(LiverModel *)model{
    _model = model;
    
    self.titleLabel.text = _model.playerName;
    
//    self.titleImage.image = [UIImage imageNamed:@"blue"];
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:_model.PlayerBigImg] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"%@",error);
    }];
    
    self.titleUrl.text = @"";
    
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLabel sizeThatFits:size].height;
//    totalHeight += [self.titleImage sizeThatFits:size].height;
//    totalHeight += [self.titleUrl sizeThatFits:size].height;
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

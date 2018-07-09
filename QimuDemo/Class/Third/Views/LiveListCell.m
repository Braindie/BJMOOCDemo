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
    
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:_model.PlayerBigImg]];
    
    self.titleUrl.text = _model.countryDetailsUrl;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

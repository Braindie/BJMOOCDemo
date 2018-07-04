//
//  LiveListCell.h
//  QimuDemo
//
//  Created by zhangwenjun on 17/6/2.
//  Copyright © 2017年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiverModel.h"

@interface LiveListCell : UITableViewCell

@property (nonatomic, strong) LiverModel *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UILabel *titleUrl;

@end

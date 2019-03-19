//
//  BJTableViewHeightCell.h
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/19.
//  Copyright © 2019 ll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BJTableViewHeightModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BJTableViewHeightCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) BJTableViewHeightModel *model;
@end

NS_ASSUME_NONNULL_END

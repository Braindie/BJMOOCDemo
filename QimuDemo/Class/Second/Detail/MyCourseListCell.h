//
//  MyCourseListCell.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCourseListCell : UITableViewCell

@property (nonatomic,copy) NSString * CellType;


@property (nonatomic ,strong) UILabel *folderTitleLabel;
@property (nonatomic ,strong) UIImageView *stateImage;
@property (nonatomic, strong) UILabel *titleLabel;

-(void) UpdateRtLabel;


@end

//
//  CommentCell.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/16.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentCell : UITableViewCell

@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *dataLabel;

@property (nonatomic ,strong) UIButton *supportSumBtn;

//@property (nonatomic ,copy) NSString *btnString;


//@property (nonatomic, strong) UIImageView *supportImage;

@property (nonatomic, strong) UIImageView *lineImage;


@end

//
//  MyCommentCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCommentCell.h"

@implementation MyCommentCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.CellType = [[NSString alloc]init];
        [self addView];

    }
    return self;
}


- (void)addView{

    //姓名
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 30)];
    //    _nameLabel.backgroundColor = [UIColor orangeColor];
    [self addSubview:_nameLabel];

    //内容
    _contentLabel  = [[UILabel alloc] initWithFrame:CGRectMake(30, 55, self.frame.size.width - 40, 40)];
    //    _contentLabel.backgroundColor = [UIColor orangeColor];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_contentLabel];

    //赞
    _supportSumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _supportSumBtn.frame = CGRectMake(280, 90, 100, 30);
    _supportSumBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _supportSumBtn.titleEdgeInsets = UIEdgeInsetsMake(5, -20, 1, 1);
    [_supportSumBtn setBackgroundImage:[UIImage imageNamed:@"praise_ok.png"] forState:UIControlStateNormal];
    [_supportSumBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_supportSumBtn];

    //日期
    _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 90, 90, 30)];
    //    _dataLabel.backgroundColor = [UIColor orangeColor];
    _dataLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_dataLabel];


    _lineImage = [[UIImageView alloc] init];
    [_lineImage setImage:[UIImage imageNamed:@"sepline.png"]];
    [self addSubview:_lineImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void) UpdateRtLabel
//{
//    _nameLabel = nil;
//    _contentLabel = nil;
//    _supportSumBtn = nil;
//    _dataLabel = nil;
//    _lineImage = nil;

//    if ([self.CellType isEqualToString:@"文件"]) {
//
//        self.folderTitleLabel.frame = CGRectMake(35, 13, 300, 25);
//        self.stateImage.frame = CGRectMake(10, 15, 20, 20);
//    }
//    else{
//
//        self.stateImage.frame = CGRectMake(20, 15, 20, 20);
//        self.folderTitleLabel.frame = CGRectMake(45, 13, 300, 25);
//        
//    }
//}


//- (void)updateCell{
//
//    self.folderTitleLabel = nil;
//    self.stateImage = nil;
//
//}



@end

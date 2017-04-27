//
//  ThirdDetailCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdDetailCell.h"

@implementation ThirdDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.CellType = [[NSString alloc]init];
        [self addView];

    }
    return self;
}


- (void)addView{

    self.folderTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 13, 300, 25)];
    [self addSubview:self.folderTitleLabel];

    self.stateImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
    [self addSubview:self.stateImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
//-(void)setFolderTitleLabelSize:(NSString *)textStr
//{
//    CGSize labelSize;
//    labelSize = [textStr sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(274+GB_HorizonDifference, 1000) lineBreakMode:NSLineBreakByWordWrapping];
//    self.folderTitleLabel.frame = CGRectMake(30, 16, 274+GB_HorizonDifference, labelSize.height);
//    self.folderTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
//    self.folderTitleLabel.numberOfLines = 0;
//}
//

-(void) UpdateRtLabel
{


    if ([self.CellType isEqualToString:@"文件"]) {

        self.folderTitleLabel.frame = CGRectMake(35, 13, 300, 25);
        self.stateImage.frame = CGRectMake(10, 15, 20, 20);
    }
    else{

        self.stateImage.frame = CGRectMake(20, 15, 20, 20);
        self.folderTitleLabel.frame = CGRectMake(45, 13, 300, 25);

    }

}

@end

//
//  MyCourseListCell.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/30.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "MyCourseListCell.h"

@implementation MyCourseListCell



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

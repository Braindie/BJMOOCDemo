//
//  MenuBTCollectionViewCell.m
//  LrdSuperMenu
//
//  Created by 李芬 on 16/5/13.
//  Copyright © 2016年 键盘上的舞者. All rights reserved.
//

#import "MenuBTCollectionViewCell.h"

@implementation MenuBTCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    //选中图片
    self.menuImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.menuImage setImage:[UIImage imageNamed:@"ChoosedImage"]];
    self.menuImage.backgroundColor = [UIColor clearColor];
   // [self addSubview:self.menuImage];
    
    //文字
    self.menuLabel=[[UILabel alloc]initWithFrame:CGRectMake(1.5, 1.5, self.frame.size.width-4, self.frame.size.height-4)];
    self.menuLabel.textColor = [UIColor lightGrayColor];
    self.menuLabel.textAlignment=NSTextAlignmentCenter;
    self.menuLabel.font=[UIFont fontWithName:@"Arial" size:13];

    self.menuLabel.layer.borderWidth = 1;
    self.menuLabel.layer.borderColor = [UIColor grayColor].CGColor;
    [self addSubview:_menuLabel];
    
    return self;
}
@end

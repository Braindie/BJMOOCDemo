//
//  HomeViewCell.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/3.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
//@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, assign) NSUInteger row;

@end

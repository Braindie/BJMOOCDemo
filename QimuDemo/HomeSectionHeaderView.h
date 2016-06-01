//
//  HomeSectionHeaderView.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/8.
//  Copyright © 2015年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSectionHeaderView : UICollectionReusableView


@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIButton *titleButton;



- (void)moreBtnClicked:(id)sender;

@end

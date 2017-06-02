//
//  BunnyPhotoView.h
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/11.
//  Copyright © 2017年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "AVCaptureViewController.h"

@class BunnyPhotoView;
@protocol BunnyPhotoViewDelegate <NSObject>

- (void)tapBunnyPhotoView:(BunnyPhotoView *)bunnyPhotoView;

@end



@interface BunnyPhotoView : UIView

@property (nonatomic, weak) id<BunnyPhotoViewDelegate> delegate;

@property (nonatomic, weak) UIViewController *VCdelegate ;//iewController代理

@property (nonatomic, strong) UIImageView *imageView;//图片

@end

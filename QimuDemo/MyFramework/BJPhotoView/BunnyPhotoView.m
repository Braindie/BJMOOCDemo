//
//  BunnyPhotoView.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/11.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "BunnyPhotoView.h"



@implementation BunnyPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self BuildUI];
    }
    return self;
}

- (void)BuildUI{
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.userInteractionEnabled = YES;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView setImage:[UIImage imageNamed:@"headerView"]];
    [self addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCurrentView)];
    [self addGestureRecognizer:tap];
    
}

- (void)tapCurrentView{
//    AVCaptureViewController *AVCaptureVC = [[AVCaptureViewController alloc] init];
//    AVCaptureVC.delegate = self;
//    AVCaptureVC.hidesBottomBarWhenPushed = YES;
//    [AVCaptureVC showPickerVc:self.VCdelegate];
}

////代理回调
//- (void)getTwoPhotoView:(UIImage *)originImage withSynImage:(UIImage *)synImage{
//    [self.imageView setImage:synImage];
//}

@end

//
//  LiveListCell.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/6/2.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "LiveListCell.h"
#import "UIImageView+WebCache.h"


@implementation LiveListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleImage.backgroundColor = [UIColor orangeColor];
    
    
    /**
     *   圆角方案一
     */
    
    /*
    //俩一起，iOS9之前会触发离屏渲染，iOS9之后不会
    self.titleImage.layer.cornerRadius = 20;
    self.titleImage.layer.masksToBounds = YES;
    
    //俩一起，会轻微触发离屏渲染
    self.btn.layer.cornerRadius = 5;
    self.btn.layer.masksToBounds = YES;
    
    //下面的都会离屏渲染（光栅化）
    self.titleImage.layer.shouldRasterize = YES;
    self.titleLabel.layer.shouldRasterize = YES;
    self.titleUrl.layer.shouldRasterize = YES;
     */
    
    
    /**
     *   圆角方案二：如果是网络图片的话需要再处理
     */
    
    
    /**
     *   圆角方案三
     */
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.titleImage.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.titleImage.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.titleImage.layer.mask = maskLayer;
}


- (void)setModel:(LiverModel *)model{
    _model = model;
    
    self.titleLabel.text = _model.playerName;
    
    [self performSelector:@selector(imageSetAction) withObject:nil afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
    
    [self.titleImage setImage:[UIImage imageNamed:@"headerView"]];
    
//    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:_model.PlayerBigImg]];
    
//    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:_model.PlayerBigImg] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//        /**
//         *   椭圆
//         */
////        //开始对imageView进行画图
////        UIGraphicsBeginImageContextWithOptions(self.titleImage.bounds.size, NO, 1.0);
////        // 获得图形上下文
////        CGContextRef ctx = UIGraphicsGetCurrentContext();
////        // 设置一个范围
////        CGRect rect = CGRectMake(0, 0, self.titleImage.frame.size.width, self.titleImage.frame.size.height);
////        // 根据一个rect创建一个椭圆
////        CGContextAddEllipseInRect(ctx, rect);
////        // 裁剪
////        CGContextClip(ctx);
////        // 将原照片画到图形上下文
////        [image drawInRect:rect];
////        // 从上下文上获取剪裁后的照片
////        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
////        // 关闭上下文
////        UIGraphicsEndImageContext();
//
//
//        /**
//         *   椭圆
//         */
////        //开始对imageView进行画图
////        UIGraphicsBeginImageContextWithOptions(self.titleImage.bounds.size, NO, 0.0);
////        //使用贝塞尔曲线画出一个圆形图(椭圆）
////        [[UIBezierPath bezierPathWithRoundedRect:self.titleImage.bounds cornerRadius:30] addClip];
////        [image drawInRect:self.titleImage.bounds];
////        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
////        //结束画图
////        UIGraphicsEndImageContext();
////
////        self.titleImage.image = newImage;
//
//    }];
    
    self.titleUrl.text = _model.countryDetailsUrl;
}

- (void)imageSetAction{
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:self.model.PlayerBigImg]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

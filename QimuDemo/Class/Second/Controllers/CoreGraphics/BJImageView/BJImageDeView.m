//
//  BJImageDeView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJImageDeView.h"

@interface BJImageDeView ()
@property (nonatomic, strong) UIImage *indicatorAroundImage;
@end

@implementation BJImageDeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.indicatorAroundImage = [UIImage imageNamed:@"AccountYes"];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //拿到当前2D绘制环境，暂时理解为画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //将当前图形状态推入到堆栈
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);//平移
    CGContextTranslateCTM(context, 0, rect.size.height);//平移
    CGContextScaleCTM(context, 1.0, -1.0);//翻转
//    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);//平移
    //填充图片
    CGContextDrawImage(context, rect, self.indicatorAroundImage.CGImage);
    //弹出堆栈
    CGContextRestoreGState(context);
}


@end

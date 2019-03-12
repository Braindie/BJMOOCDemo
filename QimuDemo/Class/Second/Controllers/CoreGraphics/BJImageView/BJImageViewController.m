//
//  BJImageViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJImageViewController.h"
#import "BJImageDeView.h"

@interface BJImageViewController ()

@end

@implementation BJImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"图片绘制";
    self.isCustomBack = YES;
    
    
    BJImageDeView *view = [[BJImageDeView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    
    
    
//    官方对离屏渲染产生性能问题也进行了优化：
    
//    iOS 9.0 之前UIimageView跟UIButton设置圆角都会触发离屏渲染。
    
//    iOS 9.0 之后UIButton设置圆角会触发离屏渲染，而UIImageView里png图片设置圆角不会触发离屏渲染了，如果设置其他阴影效果之类的还是会触发离屏渲染的。
    
    
//    圆角方案二：CAShapeLayer动画渲染直接提交到手机的GPU当中，相较于view的drawRect方法使用CPU渲染而言，其效率极高，能大大优化内存使用情况。
    

    
    
    UIImage *anotherImage = [UIImage imageNamed:@"headerView"];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 370, 210)];
    imageView.center = self.view.center;
    
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:50] addClip];
    [anotherImage drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.view addSubview:imageView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

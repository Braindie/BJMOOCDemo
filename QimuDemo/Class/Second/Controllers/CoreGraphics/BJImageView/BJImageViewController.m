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

//
//  BJImageLoadViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/14.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJImageLoadViewController.h"
#import "UIImageView+WebCache.h"

@interface BJImageLoadViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *clearButton;
@end

@implementation BJImageLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"图片加载";
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
//    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    _clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _clearButton.frame = CGRectMake(0, 0, 100, 30);
    _clearButton.center = self.view.center;
    [_clearButton setTitle:@"清理缓存" forState:UIControlStateNormal];
    [_clearButton addTarget:self action:@selector(clearCache) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_clearButton];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //方法一：有缓存，不会销毁
//    UIImage *image = [UIImage imageNamed:@"large_leaves_70mp.jpg"];
//    _imageView.image = image;
    
    //方法二：数据不缓存，节省内存
    NSString *path = [[NSBundle mainBundle] pathForResource:@"large_leaves_70mp" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _imageView.image = image;
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerView" ofType:@"png"];
//    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
//    _imageView.image = image;
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerView" ofType:@"png"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    UIImage *image = [UIImage imageWithData:data];
//    _imageView.image = image;
    
}

- (void)clearCache{
//    NSString *imageUrl = @"http://img1.xcarimg.com/exp/2872/2875/2937/20101220130509576539.jpg";
    NSString *imageUrl = @"http://img.kongzhong.com/wot/news/2013/02/06/0dcc5e3eb61360119273.jpg";

    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:SDWebImageScaleDownLargeImages];
}

@end

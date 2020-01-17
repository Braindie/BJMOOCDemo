//
//  BJImageLoadViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/14.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJImageLoadViewController.h"
//#import "UIImageView+WebCache.h"
#import <YYWebImage/YYWebImage.h>
#import <YYImage/YYImage.h>

@interface BJImageLoadViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *clearButton;
@end

@implementation BJImageLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"图片加载";

    self.clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.clearButton.frame = CGRectMake(0, 0, 100, 30);
    self.clearButton.center = self.view.center;
    [self.clearButton setTitle:@"清理缓存" forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(clearCache) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    
//    [self loadLocalImage];
    
    [self loadNetImage];
}

- (void)loadLocalImage {
    
//    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 300)];
//    [self.view addSubview:_imageView];
        
    //方法一：有缓存，不会销毁
//    UIImage *image = [UIImage imageNamed:@"large"];
//    _imageView.image = image;
    
    //方法二：数据不缓存，节省内存
    NSString *path = [[NSBundle mainBundle] pathForResource:@"large_leaves_70mp" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.imageView.image = image;
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerView" ofType:@"png"];
//    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
//    _imageView.image = image;
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerView" ofType:@"png"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    UIImage *image = [UIImage imageWithData:data];
//    _imageView.image = image;
    

        
}

- (void)loadNetImage {
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 300)];
    [self.view addSubview:_imageView];
    
//    NSString *imageUrl = @"http://img1.xcarimg.com/exp/2872/2875/2937/20101220130509576539.jpg";
//    NSString *imageUrl = @"http://img.kongzhong.com/wot/news/2013/02/06/0dcc5e3eb61360119273.jpg";
    NSString *imageUrl = @"https://gitee.com/Braindie/BJ-Resource/raw/master/heart.png";

    
//    _imageView.yy_imageURL = [NSURL URLWithString:imageUrl];
    [_imageView yy_setImageWithURL:[NSURL URLWithString:imageUrl] options:YYWebImageOptionProgressive];//渐进式：边下载边显示

//    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:SDWebImageScaleDownLargeImages];
        
}

- (void)clearCache{

    
}

@end

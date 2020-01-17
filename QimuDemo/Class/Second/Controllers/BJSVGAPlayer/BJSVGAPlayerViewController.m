//
//  BJSVGAPlayerViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2019/12/13.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJSVGAPlayerViewController.h"
#import <SVGA.h>

@interface BJSVGAPlayerViewController ()

@end

@implementation BJSVGAPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SVGAPlayer *player = [[SVGAPlayer alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    player.center = self.view.center;
    [self.view addSubview:player];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
    
    /*
     本地动画文件
     https://github.com/svga/SVGA-Samples/blob/master/matteBitmap_1.x.svga?raw=true
     halloween.svga
     kingset.svga
     angel.svga
     posche.svga
     rose.svga
     matteBitmap_1.x.svga
     */
//    [parser parseWithNamed:@"xb_svga_college_stem" inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
//        if (videoItem != nil) {
//            player.videoItem = videoItem;
//            [player startAnimation];
//        }
//    } failureBlock:^(NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
    
    /*
     官方网络动画文件
     https://github.com/svga/SVGA-Samples/blob/master/matteBitmap_1.x.svga?raw=true
     halloween.svga
     kingset.svga
     angel.svga
     posche.svga
     rose.svga
     matteBitmap_1.x.svga
     */
//    [parser parseWithURL:[NSURL URLWithString:@"https://github.com/svga/SVGA-Samples/blob/master/matteBitmap_1.x.svga?raw=true"] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        if (videoItem != nil) {
//            player.videoItem = videoItem;
//            [player startAnimation];
//        }
//    } failureBlock:^(NSError * _Nullable error) {
//        NSLog(@"%@", error);
//    }];

    
    /*
     我的GitHub动画文件（由于网络问题加载超时）
     https://github.com/Braindie/BJ-Resource/blob/master/xb_svga_college_stem.svga?raw=true
     */
//    [parser parseWithURL:[NSURL URLWithString:@"https://github.com/Braindie/BJ-Resource/blob/master/xb_svga_college_stem.svga?raw=true"] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        if (videoItem != nil) {
//            player.videoItem = videoItem;
//            [player startAnimation];
//        }
//    } failureBlock:^(NSError * _Nullable error) {
//        NSLog(@"%@", error);
//    }];

    
    /*
     我的Gitee动画文件（一定要使用原始文件地址，仔细看地址路径）
     https://gitee.com/Braindie/BJ-Resource/raw/master/xb_svga_college_stem.svga
     */
    [parser parseWithURL:[NSURL URLWithString:@"https://gitee.com/Braindie/BJ-Resource/raw/master/xb_svga_college_stem.svga"] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
        if (videoItem != nil) {
            player.videoItem = videoItem;
            [player startAnimation];
        }
    } failureBlock:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)dealloc
{
    NSLog(@"销毁");
}


@end

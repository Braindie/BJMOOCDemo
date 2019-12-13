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
    
    SVGAPlayer *player = [[SVGAPlayer alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    player.center = self.view.center;
    [self.view addSubview:player];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
    [parser parseWithNamed:@"xb_svga_college_stem" inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (videoItem != nil) {
            player.videoItem = videoItem;
            [player startAnimation];
        }
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
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

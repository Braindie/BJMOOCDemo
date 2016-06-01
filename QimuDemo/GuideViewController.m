//
//  GuideViewController.m
//  QimuDemo
//
//  Created by sniper_yj on 16/1/7.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "GuideViewController.h"
#import "CenterTabBarController.h"



#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation GuideViewController{
    UIButton *btn;

}



- (void)viewDidLoad {
    [super viewDidLoad];

    //创建滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.pagingEnabled = YES;

    //隐藏滑动条
    scrollView.showsHorizontalScrollIndicator = NO;

    scrollView.delegate = self;

    scrollView.contentSize = CGSizeMake(5 * kScreenWidth, kScreenHeight);

    for (NSInteger i = 0;  i < 5; i++) {

        NSString *imageName = [NSString stringWithFormat:@"pic%ld.jpg",i + 1];
//        NSString *progressImg = [NSString stringWithFormat:@"guideProgress%d",i + 1];
        //图片视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        //分页视图
        UIImageView *progressView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 26, kScreenWidth, 26)];

        progressView.contentMode = UIViewContentModeScaleAspectFit;

//        progressView.image = [UIImage imageNamed:progressImg];

        [imageView addSubview:progressView];

    }

    [self.view addSubview:scrollView];



    //创建调转按钮
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake((kScreenWidth - 200)/2,kScreenHeight * 4 / 5, 200, 30);

    [btn setTitle:@"点击开启" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.hidden = YES;
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];


}

//滑动停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger index =  scrollView.contentOffset.x / kScreenWidth;

    if (index == 4) {
        btn.hidden = NO;

        //关闭滑动视图的滑动效果
        scrollView.scrollEnabled = NO;

    }
}

- (void)clickAction:(UIButton *)btn{

    //首页视图控制器
    CenterTabBarController *menuVC = [[CenterTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = menuVC;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

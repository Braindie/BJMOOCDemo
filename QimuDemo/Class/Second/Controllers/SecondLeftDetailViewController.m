//
//  SecondLeftDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/9.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "SecondLeftDetailViewController.h"
#import "BJWaveView.h"
#import "BJLoadingView.h"
#import "BJRingtLoadingView.h"
#import "BJYoukuPlayerButton.h"

#import "BJYYLabelView.h"

@interface SecondLeftDetailViewController ()
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) BJYoukuPlayerButton *youkuBtn;
@property (nonatomic, strong) BJRingtLoadingView *loadingView;
@end

@implementation SecondLeftDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"QuartzCore";
    self.isCustomBack = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //波浪图
    BJWaveView *waveView = [[BJWaveView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50)];
    [self.view addSubview:waveView];
    
    
    
    //转场动画（layer图片）
    BJLoadingView *view = [[BJLoadingView alloc] initWithFrame:CGRectMake(50, 200, 40, 31)];
    [self.view addSubview:view];
    [view startLoading];
    
    //转场动画（layer实现）
    _loadingView = [[BJRingtLoadingView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    [self.view addSubview:_loadingView];
    
    
    
    //点击动画（膨胀动画）
    self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeBtn.frame = CGRectMake(50, 400, 50, 50);
    //        btn.backgroundColor = LINE_GRAY_COLOREE;
    [self.likeBtn setImage:[UIImage imageNamed:@"Shape_selected"] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"Shape_unselected"] forState:UIControlStateSelected];
    self.likeBtn.selected = NO;
    self.likeBtn.tag = 200+1;
    [self.likeBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.likeBtn];
    
    //点击动画（优酷logo）
    _youkuBtn = [[BJYoukuPlayerButton alloc] initWithFrame:CGRectMake(150, 400, 60, 60) withState:BJYoukuPlayerButtonStatePlay];
    [_youkuBtn addTarget:self action:@selector(youKuPlayMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_youkuBtn];
    
    
    BJYYLabelView *yyLabelView = [[BJYYLabelView alloc] initWithFrame:CGRectMake(50, 500, 100, 100)];
    yyLabelView.backgroundColor = [UIColor orangeColor];
    yyLabelView.textStr = [NSString stringWithFormat:@"http://www.baidu.com ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 [微笑] ✺◟(∗❛ัᴗ❛ั)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫"];
    yyLabelView.font = [UIFont systemFontOfSize:36];
    [self.view addSubview:yyLabelView];

}

- (void)youKuPlayMethod{
    if (_youkuBtn.buttonState == BJYoukuPlayerButtonStatePause) {
        _youkuBtn.buttonState = BJYoukuPlayerButtonStatePlay;
    }else{
        _youkuBtn.buttonState = BJYoukuPlayerButtonStatePause;
    }
}


- (void)clickAction:(UIButton *)sender{
    
    if (sender.isSelected == NO) {
        sender.selected = YES;
        [self.loadingView pauseAnimation];

    }else{
        sender.selected = NO;
        [self.loadingView resumeAnimation];

    }
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.2)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [sender.layer addAnimation:k forKey:@"SHOW"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

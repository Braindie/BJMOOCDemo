//
//  BJButtonViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/11.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJButtonViewController.h"
#import "BJYoukuPlayerButton.h"

@interface BJButtonViewController ()

@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) BJYoukuPlayerButton *youkuBtn;
@end

@implementation BJButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"按钮";
    self.isCustomBack = YES;
    
    

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
        //        [self.loadingView pauseAnimation];
        
    }else{
        sender.selected = NO;
        //        [self.loadingView resumeAnimation];
        
    }
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.2)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [sender.layer addAnimation:k forKey:@"SHOW"];
}



@end

//
//  UINavBarView.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/9.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "UINavBarView.h"

@implementation UINavBarView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self updateData];

        [self loadTopData];


    }
    return self;
}

- (void)loadTopData{

//    NSArray *arr11 = [NSArray arrayWithObjects:@"全部",@"河南",@"河北",@"湖南",@"湖北",@"北京",@"天津",@"上海",@"广州",@"深圳", nil];
//    NSArray *arr12 = [NSArray arrayWithObjects:@"全部",@"动作",@"冒险",@"喜剧",@"爱情",@"战争",@"恐怖",@"科幻",@"悬疑", nil];

//    self.dataArr11 = [NSMutableArray arrayWithArray:arr11];
//    self.dataArr12 = [NSMutableArray arrayWithArray:arr12];

}

- (void)updateData{


    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 149, self.frame.size.width, 1)];
    self.lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.lineView];

//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setTitle:@"最新" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////    btn1.backgroundColor = [UIColor greenColor];
//    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    btn1.frame = CGRectMake(10, 10, 60, 30);
//    [self addSubview:btn1];
//
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setTitle:@"最热" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////    btn2.backgroundColor = [UIColor greenColor];
//    [btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    btn2.frame = CGRectMake(80, 10, 60, 30);
//    [self addSubview:btn2];

    
    self.scrollView0 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 40)];
//    self.scrollView0.backgroundColor = [UIColor grayColor];
    self.scrollView0.contentSize = CGSizeMake(10 + 70 * self.dataArr10.count, 40);
    self.scrollView0.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView0];

    self.scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 55, self.frame.size.width, 40)];
//    scrollView1.backgroundColor = [UIColor grayColor];
    self.scrollView1.contentSize = CGSizeMake(10 + 70 * self.dataArr11.count, 40);
    self.scrollView1.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView1];

    self.scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, self.frame.size.width, 40)];
//    scrollView2.backgroundColor = [UIColor grayColor];
    self.scrollView2.contentSize = CGSizeMake(10 + 70 * self.dataArr12.count, 40);
    self.scrollView2.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView2];




    CGFloat button0X = 0.0f;
    for (NSInteger i = 0; i < self.dataArr10.count; i++) {
        UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
        button0.tag  = i;
        //        button1.backgroundColor = [UIColor greenColor];
        button0.frame  = CGRectMake(10+button0X, 5, 60, 30);
        [button0 setTitle:self.dataArr10[i] forState:UIControlStateNormal];
        [button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button0 addTarget:self action:@selector(buttonAction0:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView0 addSubview:button0];

        button0X = button0X + 70;

        if (i == 0) {
            // 创建选中按钮的背景图片
            _selectedImageView0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
            _selectedImageView0.layer.cornerRadius = 15;
            _selectedImageView0.layer.masksToBounds = YES;
            _selectedImageView0.backgroundColor = [UIColor grayColor];
            // 设置图片
            [self.scrollView0 insertSubview:_selectedImageView0 atIndex:0];
            // 设置选中按钮的位置
            _selectedImageView0.center = button0.center;
        }
        
    }

    

    CGFloat button1X = 0.0f;
    for (NSInteger i = 0; i < self.dataArr11.count; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.tag  = i;
//        button1.backgroundColor = [UIColor greenColor];
        button1.frame  = CGRectMake(10+button1X, 5, 60, 30);
        [button1 setTitle:self.dataArr11[i] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView1 addSubview:button1];

        button1X = button1X + 70;

        if (i == 0) {
            // 创建选中按钮的背景图片
            _selectedImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 45)];
            _selectedImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
            _selectedImageView1.layer.cornerRadius = 15;
            _selectedImageView1.backgroundColor = [UIColor grayColor];
            // 设置图片
            [self.scrollView1 insertSubview:_selectedImageView1 atIndex:0];
            // 设置选中按钮的位置
            _selectedImageView1.center = button1.center;
        }

    }

    CGFloat button2X = 0.0f;
    for (NSInteger i = 0; i < self.dataArr12.count; i++) {
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.tag  = i;
//        button2.backgroundColor = [UIColor greenColor];
        button2.frame  = CGRectMake(10+button2X, 5, 60, 30);
        [button2 setTitle:self.dataArr12[i] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView2 addSubview:button2];

        button2X = button2X + 70;

        if (i == 0) {
            // 创建选中按钮的背景图片
            _selectedImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
            _selectedImageView2.layer.cornerRadius = 15;
            _selectedImageView2.backgroundColor = [UIColor grayColor];
            // 设置图片
            [self.scrollView2 insertSubview:_selectedImageView2 atIndex:0];
            // 设置选中按钮的位置
            _selectedImageView2.center = button2.center;
        }

    }

}

- (void)buttonAction0:(UIButton *)button{


    [self.scrollView0 insertSubview:_selectedImageView0 atIndex:button.tag];
    //设置选中背景视图跟随动画
    [UIView animateWithDuration:.25 animations:^{
        _selectedImageView0.center = button.center;
    }];

    NSLog(@"%@",button.titleLabel.text);
    [_delegate itemPressedWithIndex1:button.titleLabel.text];

//    self.selectedIndex = button.tag;

}

- (void)buttonAction1:(UIButton *)button{

    [self.scrollView1 insertSubview:_selectedImageView1 atIndex:button.tag];
    //设置选中背景视图跟随动画
    [UIView animateWithDuration:.25 animations:^{
        _selectedImageView1.center = button.center;
    }];

    NSLog(@"%@",button.titleLabel.text);
    [_delegate itemPressedWithIndex2:button.titleLabel.text];


}

- (void)buttonAction2:(UIButton *)button{

    [self.scrollView2 insertSubview:_selectedImageView2 atIndex:button.tag];
    //设置选中背景视图跟随动画
    [UIView animateWithDuration:.25 animations:^{
        _selectedImageView2.center = button.center;
    }];

    if (button.tag == 0 || button.tag > self.dataArr13.count) {

        [self.scrollView3 removeFromSuperview];
        [self.button3 removeFromSuperview];
        [_selectedImageView3 removeFromSuperview];
        
        self.frame = CGRectMake(0, 0, self.frame.size.width, 155);
        self.lineView.frame = CGRectMake(0, 149, self.frame.size.width, 1);
        [_delegate itemPressedWithIndex3:button.titleLabel.text withIsBar:NO];


    }else{
        self.myDataArr = self.dataArr13[button.tag - 1];


        [self.scrollView3 removeFromSuperview];
        [self.button3 removeFromSuperview];
        [_selectedImageView3 removeFromSuperview];

        [self initOtherData];


        NSLog(@"%@",button.titleLabel.text);

        self.frame = CGRectMake(0, 0, self.frame.size.width, 200);
        self.lineView.frame = CGRectMake(0, 199, self.frame.size.width, 1);
        [_delegate itemPressedWithIndex3:button.titleLabel.text withIsBar:YES];

    }
}


- (void)initOtherData{

//    if (self.scrollView3 == nil) {
        self.scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 155, self.frame.size.width, 40)];
//    }
//    self.scrollView3.backgroundColor = [UIColor redColor];
    self.scrollView3.contentSize = CGSizeMake(10 + 70 * self.myDataArr.count, 40);
    self.scrollView3.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView3];



    CGFloat button3X = 0.0f;
    for (NSInteger i = 0; i < self.myDataArr.count; i++) {
//        if (self.button3 == nil) {
            self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
//        }
        self.button3.tag  = i;
        CGSize button3Size = [self.myDataArr[i] sizeWithFont:[UIFont systemFontOfSize:18]];
//        CGSize button3Size = [self.myDataArr[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        self.button3.titleLabel.font = [UIFont systemFontOfSize:18];
        self.button3.frame  = CGRectMake(20+button3X, 5, button3Size.width, button3Size.height);
        [self.button3 setTitle:self.myDataArr[i] forState:UIControlStateNormal];
        [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button3 addTarget:self action:@selector(buttonAction3:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView3 addSubview:self.button3];

        button3X = button3X + button3Size.width +20;

        if (i == 0) {
            // 创建选中按钮的背景图片
//            if (_selectedImageView3 == nil) {
                _selectedImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
//            }
            [_selectedImageView3 setImage:[UIImage imageNamed:@"c.png"]];
            _selectedImageView3.layer.cornerRadius = 15;
            _selectedImageView3.backgroundColor = [UIColor grayColor];
            // 设置图片
            [self.scrollView3 insertSubview:_selectedImageView3 atIndex:0];
            // 设置选中按钮的位置
            _selectedImageView3.center = self.button3.center;
        }
    }
}

- (void)buttonAction3:(UIButton *)button{


    CGSize button3Size = [button.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:18]];
//    [_selectedImageView3 drawRect:CGRectMake(0, 0, button3Size.width +10, button3Size.height)];
//    _selectedImageView3.frame = CGRectMake(0, 0, button3Size.width +10, button3Size.height);
    _selectedImageView3.bounds = CGRectMake(0, 0, button3Size.width +10, button3Size.height);
    [_selectedImageView3 sizeThatFits:button3Size];
    [self.scrollView3 insertSubview:_selectedImageView3 atIndex:button.tag];
    //设置选中背景视图跟随动画
    [UIView animateWithDuration:.15 animations:^{
        _selectedImageView3.center = button.center;
    }];


    NSLog(@"%@",button.titleLabel.text);
    [_delegate itemPressedWithIndex4:button.titleLabel.text];
}

@end

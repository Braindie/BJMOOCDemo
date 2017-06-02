//
//  FiveViewCtrl.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/7/4.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FiveViewCtrl.h"
#import "PhotoSelectView.h"

@interface FiveViewCtrl ()<BunnyPhotoViewDelegate>
@property (nonatomic, strong) PhotoSelectView *photoView;
@end

@implementation FiveViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isNavCtrlSet = YES;
    self.navigationItem.title = @"图片选择器";

    
    [self creatView];
    
    [self creatPhotoView];
}


- (void)creatView{
    self.photoView = [[PhotoSelectView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)  withIsOnlyPreview:NO] ;

    self.photoView.delegate = self ;

    //刷新图片回调
    self.photoView.onRefreshImage = ^(PhotoSelectView *photoView){

    };
    //删除图片回调
    self.photoView.onDeleteImage = ^(PhotoSelectView *photoView,NSInteger index, PhotoModel *photoModel){
        
        [photoView removeImageFromList:index];
    };
    [self.view addSubview:self.photoView];
}

- (void)creatPhotoView{
    self.b1PhotoView = [[BunnyPhotoView alloc] initWithFrame:CGRectMake(20, 264, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
    self.b1PhotoView.VCdelegate = self;
    [self.view addSubview:self.b1PhotoView];
    
    self.b2PhotoView = [[BunnyPhotoView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-60)/2 + 40, 264, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
    [self.view addSubview:self.b2PhotoView];
    
    self.b1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 380, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    self.b1ImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.b1ImageView setImage:[UIImage imageNamed:@"headerView"]];
    [self.view addSubview:self.b1ImageView];
    
    self.b2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-60)/2 + 40, 380, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    self.b1ImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.b2ImageView setImage:[UIImage imageNamed:@"headerView"]];
    [self.view addSubview:self.b2ImageView];
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

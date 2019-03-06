//
//  BJPictureSelectedViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/6.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJPictureSelectedViewController.h"
#import "PhotoSelectView.h"

@interface BJPictureSelectedViewController ()
@property (nonatomic, strong) PhotoSelectView *photoView;

@end

@implementation BJPictureSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"图片选择器";
    
    [self creatView];

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

@end

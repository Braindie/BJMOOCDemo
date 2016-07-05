//
//  PhotoSelectViewCtrlDemo.m
//  terminal-ios-sichuan
//
//  Created by 宗波 on 16/1/29.
//  Copyright © 2016年 ctitc. All rights reserved.
//

#import "PhotoSelectViewCtrlDemo.h"
#import "PhotoSelectView.h"
#import "PhotoModel.h"

@interface PhotoSelectViewCtrlDemo ()

@property(nonatomic,strong) PhotoSelectView *photoView ;

@end
@implementation PhotoSelectViewCtrlDemo


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor] ;
    //isOnlyPreview是否为只读（只展示图片）
//    self.photoView = [[PhotoSelectView alloc]initWithFrame: CGRectMake(0, RUNNING_PAGE_START_Y, self.view.frame.size.width, 200) withIsOnlyPreview:false ];
    self.photoView.delegate = self ;
    self.photoView.onRefreshImage = ^(PhotoSelectView *photoView){
        NSLog(@"我刷新图片了哦") ;
    };
    self.photoView.onDeleteImage = ^(PhotoSelectView *photoView,NSInteger index, PhotoModel *photoModel){
        NSLog(@"我删除图片了哦") ;
        [photoView removeImageFromList:index] ;
    };
    
    
    
    [self.view addSubview:self.photoView] ;
    
}

@end

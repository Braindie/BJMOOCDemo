//
//  PhotoSelectView.h
//  ZLAssetsPickerDemo
//
//  Created by 宗波 on 16/1/28.
//  Copyright © 2016年 com.zixue101.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"

@interface PhotoSelectView : UIView

@property (nonatomic, assign) IBInspectable NSInteger maxImageNum ;//允许选择的最大图片数量
@property (nonatomic, assign) NSInteger columns ;//列数（从1开始）
@property (nonatomic, assign) IBInspectable BOOL isOnlyPreview ;//只显示
@property (nonatomic, weak) UIViewController *delegate ;//iewController代理
@property (nonatomic,copy) void(^onRefreshImage)(PhotoSelectView *photoView) ;//刷新图片时回调
@property (nonatomic,copy) void(^onDeleteImage)(PhotoSelectView *photoView,NSInteger index, PhotoModel *photoModel) ;//删除图片时回调



//构造方法 isOnlyPreview ： 是否为显示
-(instancetype) initWithFrame:(CGRect)frame withIsOnlyPreview: (BOOL) isOnlyPreview ;
//增加图片,格式为：[<PhotoMode>,<PhotoMode>,...]
-(void) addImageToList:(NSArray *)myImageList ;
//获取新增的图片列表格式为：[<UIImage>,<UIImage>,...]
-(NSMutableArray *) getPhotoList ;
//根据索引，从图片列表中删除图片
-(void) removeImageFromList:(NSInteger) index ;

//刷新图片列表视图
-(void)refreshImageListView ;

@end

//
//  PhotoSelectView.m
//  ZLAssetsPickerDemo
//
//  Created by 宗波 on 16/1/28.
//  Copyright © 2016年 ctitc All rights reserved.
//

#import "PhotoSelectView.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "UIButton+WebCache.h"
//#import "Utils.h"


//ZLPhotoPickerBrowserViewControllerDataSource  查看图片的数据源
//ZLPhotoPickerBrowserViewControllerDelegate    查看图片的代理

@interface PhotoSelectView () <ZLPhotoPickerBrowserViewControllerDataSource,ZLPhotoPickerBrowserViewControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *imageList ;//当前显示的图片列表
@property (nonatomic, assign) NSInteger wSpace ;//水平空白
@property (nonatomic, assign) NSInteger hSpace ;//垂直空白
@property (nonatomic, assign) NSInteger imageWidth ;//缩略图宽度
@property (nonatomic, assign) NSInteger imageHeight ;//缩略图高度
@property (nonatomic, assign) NSInteger rows ;//行数(从1开始）
@property (nonatomic, assign) NSInteger totalHeight ;//总高度

@end



@implementation PhotoSelectView

//构造函数
- (instancetype)initWithFrame:(CGRect)frame withIsOnlyPreview:(BOOL)isOnlyPreview {
    self = [super initWithFrame:frame];
    if (self) {
        [self initParams];
        self.isOnlyPreview = isOnlyPreview;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self initParams];
    }
    return self;
}

-(void) initParams{
    self.backgroundColor = [UIColor whiteColor];
    self.imageList = [NSMutableArray array];
    self.maxImageNum = 9;
    self.rows = 1;
    self.columns = 3; //默认三列
    self.wSpace = 10;
    self.hSpace = 10;
    self.imageWidth = 100;
    self.imageHeight = 100;
    //刷新图片列表视图
    [self refreshImageListView] ;
}

//增加图片,格式为：[<PhotoMode>,<PhotoMode>,...]
-(void) addImageToList:(NSArray *)myImageList {
    if (myImageList  == nil) {
        return ;
    }
    
    if (self.isOnlyPreview) {//显示模式下，不限制数量
        [self.imageList addObjectsFromArray:myImageList ] ;
    }else{
        //非显示模式下，限制总数量不能超过maxImageNum
        //剩余可添加的图片数量
        NSInteger leftImageNum = self.maxImageNum - self.imageList.count ;
        
        if(leftImageNum <= 0){
            return ;//无法添加新图片了
        }
        if ( leftImageNum < myImageList.count) {
            //新增进来的图片数量>剩余可添加的图片数量，只截取一部分添加过来
            [self.imageList addObjectsFromArray:[myImageList subarrayWithRange:NSMakeRange(0, leftImageNum)]] ;
        }else{
            //足够容纳新图片
            [self.imageList addObjectsFromArray:myImageList ] ;
        }
        
    }
    
    //刷新图片列表视图
    [self refreshImageListView] ;
    
}

//删除图片
-(void) removeImageFromList:(NSInteger) index{
    if (index < self.imageList.count) {
        [self.imageList removeObjectAtIndex:index] ;
        //刷新图片列表视图
        [self refreshImageListView] ;
    }
    
}

//获取新增的图片列表格式为：[<UIImage>,<UIImage>,...]
-(NSMutableArray *) getPhotoList {
    
    NSMutableArray *photoList = [NSMutableArray array] ;
    for (NSInteger i = 0; i < self.imageList.count; i++) {
        //取出对象
        id item =[self.imageList objectAtIndex:i] ;
        if ([ item isKindOfClass:[ZLPhotoAssets class]]) {//相册
            [photoList addObject:((ZLPhotoAssets *)item).originImage ] ;
        }else if ([item isKindOfClass:[ZLCamera class]]){//拍照
            [photoList addObject:((ZLCamera *)item).photoImage ] ;
        }
        //已经上传过的图片不再返回
    }
    
    return photoList ;
}


#pragma mark - 刷新图片列表视图
//刷新图片列表视图
-(void)refreshImageListView {
    
    NSLog(@"wwwww=%fd",self.frame.size.width) ;
    // 先移除，后添加
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //重新计算图片的宽高
    [self calculateImageSize] ;
    //重新设置新高度
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.totalHeight) ;
    
    // 总图片数,包括"添加图片"
    NSInteger itemCount = [self getShowItemCount];
    
    for (NSInteger i = 0; i < itemCount; i++) {
        NSArray *rowAndCol = [self findPosition:i] ;//计算行列
        NSInteger row = [rowAndCol[0] integerValue ];
        NSInteger col = [rowAndCol[1] integerValue ];
        //计算x y坐标
        NSInteger x =  col * (self.imageWidth + self.wSpace) + self.wSpace ;
        NSInteger y =  row * (self.imageHeight + self.hSpace) + self.hSpace ;
        
        CGRect frame = CGRectMake(x, y, self.imageWidth, self.imageHeight) ;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btn.frame = CGRectMake(0, 0, self.imageWidth, self.imageHeight);
        
        
        UIView *contentView = [[UIView alloc]initWithFrame:frame] ;
        [contentView addSubview:btn] ;
        // 添加图片的UIButton
        if (i + 1 == itemCount && !self.isOnlyPreview && self.imageList.count <self.maxImageNum ){
            
            // 最后一个Button
            [btn setImage:[UIImage imageNamed:@"icon_addpic_unfocused"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(onClickAddBtn) forControlEvents:UIControlEventTouchUpInside];
        }else{
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            id item =[self.imageList objectAtIndex:i] ;
            if ([ item isKindOfClass:[ZLPhotoAssets class]]) {//相册
                NSLog(@"11xxxxxxxx=%f",[item thumbImage].size.width) ;
                [btn setImage:[item thumbImage] forState:UIControlStateNormal];
            }else if ([item isKindOfClass:[ZLCamera class]]){//拍照
                NSLog(@"22xxxxxxxx=%f",[item thumbImage].size.width) ;
                [btn setImage:[item thumbImage] forState:UIControlStateNormal];
            }else{//网络图片PhotoMode
                //                [btn sd_setImageWithURL:[NSURL URLWithString:[item stringValue]] forState:UIControlStateNormal];
                PhotoModel *model = (PhotoModel *)item ;
                [btn sd_setImageWithURL:[NSURL URLWithString:model.path] forState:UIControlStateNormal];
            }
            btn.tag = i;
            [btn addTarget:self action:@selector(onClickImage:) forControlEvents:UIControlEventTouchUpInside];
            
            if (!self.isOnlyPreview) {//添加删除图片按钮
                UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.imageWidth-20, 0,20,20)] ;
                [deleteBtn setImage:[UIImage imageNamed:@"zl_X"] forState:UIControlStateNormal];
                deleteBtn.tag = 1234 + i ;
                [deleteBtn addTarget:self action:@selector(onClickDeleteLabel:) forControlEvents:UIControlEventTouchUpInside] ;
                [contentView addSubview:deleteBtn];
            }
            
        }
        
        [self addSubview:contentView ] ;
        
    }
    //回调
    if (self.onRefreshImage) {
        self.onRefreshImage(self) ;
    }
    
}



#pragma mark - 添加图片事件
- (void)onClickAddBtn {
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                              delegate:self
                                                     cancelButtonTitle:@"取消"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"打开照相机",@"从手机相册获取",nil];
    
    [myActionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

#pragma mark - 添加图片对话框ActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self openCamera];
            break;
        case 1:  //打开本地相册
            [self openLocalPhoto];
            break;
    }
}
//打开相机
- (void)openCamera{
    ZLCameraViewController *cameraVc = [[ZLCameraViewController alloc] init];
    // 拍照最多个数
    cameraVc.maxCount = self.maxImageNum - self.imageList.count ;
    
    cameraVc.callback = ^(NSArray *cameras){
        [self addImageToList:cameras];
    };
    [cameraVc showPickerVc:self.delegate];
}

//打开相册
- (void)openLocalPhoto{
    
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // 选择最多个数
    pickerVc.maxCount = self.maxImageNum - self.imageList.count ;
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.callBack = ^(NSArray *status){
        NSLog(@"status = %@",status) ;
        [self addImageToList:status];
    };
    
    [pickerVc showPickerVc:self.delegate];
}


#pragma mark - 浏览图片事件

- (void)onClickImage:(UIButton *)btn{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
    // pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    //    pickerBrowser.toView = btn;
    // 数据源/delegate
    pickerBrowser.delegate = self;
    pickerBrowser.dataSource = self;
    // 当前选中的值
    pickerBrowser.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    // 展示控制器
    [pickerBrowser showPickerVc:self.delegate];
}

#pragma mark - 浏览图片数据源<ZLPhotoPickerBrowserViewControllerDataSource>
//有多少组
- (NSInteger)numberOfSectionInPhotosInPickerBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowser{
    return 1;
}
//每个组多少个图片
- (NSInteger)photoBrowser:(ZLPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section{
    return self.imageList.count;
}

//每个组展示什么图片,需要包装下ZLPhotoPickerBrowserPhoto
- (ZLPhotoPickerBrowserPhoto *) photoBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= self.imageList.count) {
        return nil ;
    }
    ZLPhotoAssets *imageObj = [self.imageList objectAtIndex:indexPath.row];
    // 包装下imageObj 成 ZLPhotoPickerBrowserPhoto 传给数据源
    ZLPhotoPickerBrowserPhoto *photo = [ZLPhotoPickerBrowserPhoto photoAnyImageObjWith:imageObj];
    
    UIButton *btn = self.subviews[indexPath.row].subviews[0];
    photo.toView = btn.imageView;
    // 缩略图
    photo.thumbImage = btn.imageView.image;
    return photo;
}



#pragma mark - 私有方法
//删除图片
-(void)onClickDeleteLabel :(UIButton *)btn{
    NSInteger i = btn.tag - 1234 ;//索引 1234不要动哦
    //取出要删除的对象
    id item =[self.imageList objectAtIndex:i] ;
    
    
    if (self.onDeleteImage) {
        self.onDeleteImage(self,i,item) ;
    }
//    [Utils showDialog:@"是否删除该照片?" confirmBlock:^{
//        if ([item isKindOfClass:[PhotoModel class]]){//初始化进来的图片(网络图片)
//            //回调
//            if (self.onDeleteImage) {
//                self.onDeleteImage(self,i,item) ;
//            }
//        }else{//本地图片
//            [self removeImageFromList:i] ;
//        }
//        
//    } cancelBlock:^{
//        
//    }] ;
    
}


// 计算最新的图片宽高和总高度
-(void) calculateImageSize {
    //根据列数计算每个图片宽高
    self.imageWidth = (self.frame.size.width - self.wSpace * (self.columns + 1))/self.columns ;
    self.imageHeight = self.imageWidth ;
    
    NSInteger itemCount = [self getShowItemCount];
    // 总行数
    if ((itemCount % self.columns) == 0) {
        self.rows = itemCount / self.columns;
    } else {
        self.rows = itemCount / self.columns + 1;
    }
    
    //计算总高度
    self.totalHeight = self.rows * (self.imageHeight + self.hSpace) + self.hSpace ;
}


//获取第childNum个图片 所在的行列
-(NSArray *) findPosition :(NSInteger) childNum {
    
    for (NSInteger i = 0; i < self.rows; i++) {
        for (NSInteger j = 0; j < self.columns; j++) {
            if ((i * self.columns + j) == childNum) {
                return @[@(i) , @(j)] ;
                break;
            }
        }
    }
    return @[@(1) ,@(1)] ;//随便给的一个值
}

//获取总共要显示的图片数,包括"添加图片"
-(NSInteger) getShowItemCount{
    // 总图片数,包括"添加图片"
    NSInteger itemCount = self.imageList.count ;
    if (!self.isOnlyPreview && itemCount < self.maxImageNum) {
        itemCount ++ ;
    }
    
    return itemCount ;
}

@end

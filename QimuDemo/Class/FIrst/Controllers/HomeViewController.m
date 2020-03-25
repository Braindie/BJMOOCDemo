//
//  HomeViewController.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/2.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "HomeViewController.h"

#import "CYLDBManager.h"//json文件解析
#import "HomeViewCell.h"
#import "HomeSectionHeaderView.h"

#import "SGWCustomBlockAlertManager.h"
#import "SGWBlockAlertManager.h"
#import "UILabel+StringFrame.h"
#import "HxToastView.h"

#import "FirstDetailViewController.h"
#import "BJMasnoryViewController.h"
#import "BJTouchAndGestureViewController.h"
//#import "BJTextrueControllerViewController.h"
#import "BJTextureASViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


static NSString * CellIdentifier           = @"CellIdentifier";
static NSString * HeaderViewCellIdentifier = @"HeaderViewCellIdentifier";


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic ,strong) NSArray *dataArr2;

@end


@implementation HomeViewController




- (void)viewDidLoad{
    [super viewDidLoad];

    self.navigationItem.title = @"布局";
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSetLeft = NO;
    self.isNavCtrlSetRight = YES;
    [self.rightButton setTitle:@"筛选" forState:UIControlStateNormal];

    //加载数据
    [self loadTopData];

    //创建视图
    [self creatView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark -
- (void)leftButtonAction:(UIButton *)button{

}

- (void)rightButtonAction:(UIButton *)button{
    FirstDetailViewController *vc = [[FirstDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loadTopData{
    self.dataArr2 = [NSArray arrayWithArray:[CYLDBManager dataSource]];
}


- (void)creatView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = kScreenWidth - 20;
    CGFloat height = 30;
    layout.itemSize = CGSizeMake(width, height);

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49-64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);


    //注册单元格
    [self.collectionView registerClass:[HomeViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [self.collectionView registerClass:[HomeSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewCellIdentifier];

    layout.sectionInset = UIEdgeInsetsMake(100,0,0,0);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);//必填

    [self.view addSubview:self.collectionView];
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.dataArr2.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *tmpArr = [NSArray arrayWithArray:[self.dataArr2[section] objectForKey:@"Symptoms"]];
    return tmpArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    HomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.backgroundColor = [UIColor whiteColor];

    NSMutableArray *symptoms = [NSMutableArray arrayWithArray:[self.dataArr2[indexPath.section]
                                                               objectForKey:kDataSourceSectionKey]];
    NSString *text = [symptoms[indexPath.row] objectForKey:kDataSourceCellTextKey];

    [cell.button setTitle:text forState:UIControlStateNormal];
    [cell.button setTitle:text forState:UIControlStateSelected];
    [cell.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cell.section = indexPath.section;
    cell.row = indexPath.row;

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{


    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        HomeSectionHeaderView *filterHeaderView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:HeaderViewCellIdentifier
                                                  forIndexPath:indexPath];
        NSString *sectionTitle = [self.dataArr2[indexPath.section] objectForKey:@"Type"];
        filterHeaderView.titleButton.tag = indexPath.section;
        
        filterHeaderView.moreButton.hidden = NO;
        filterHeaderView.moreButton.tag = indexPath.section;
        filterHeaderView.moreButton.selected = NO;
        [filterHeaderView.titleButton setTitle:sectionTitle forState:UIControlStateNormal];
        [filterHeaderView.titleButton setTitle:sectionTitle forState:UIControlStateSelected];
        switch (indexPath.section) {
            case 0:
                [filterHeaderView.titleButton setImage:[UIImage imageNamed:@"home_icon_list@2x"]
                                              forState:UIControlStateNormal];
                break;
            case 1:
                [filterHeaderView.titleButton setImage:[UIImage imageNamed:@"home_icon_list@2x"]
                                              forState:UIControlStateNormal];
                break;
            case 2:
                [filterHeaderView.titleButton setImage:[UIImage imageNamed:@"home_icon_list@2x"]
                                              forState:UIControlStateNormal];
                break;
            case 3:
                [filterHeaderView.titleButton setImage:[UIImage imageNamed:@"home_icon_list@2x"]
                                              forState:UIControlStateNormal];
                break;
            default:
                break;
        }

        return (UICollectionReusableView *)filterHeaderView;
    }
    return nil;

}

//调整单元格距离父视图边缘的位置
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 10, 10, 10);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    /*
    //二级菜单数组
    NSArray *symptoms = [NSArray arrayWithArray:[self.dataArr2[indexPath.section] objectForKey:kDataSourceSectionKey]];
    NSString *sectionTitle = [self.dataArr2[indexPath.section] objectForKey:@"Type"];
    BOOL shouldShowPic = YES;
    NSString *cellTitle = [symptoms[indexPath.row] objectForKey:kDataSourceCellTextKey];
    NSString *message = shouldShowPic?[NSString stringWithFormat:@"%@",cellTitle]:cellTitle;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:sectionTitle
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil];
    [alert show];
    NSUInteger delaySeconds = 1;
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySeconds * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
    */
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                BJMasnoryViewController *vc = [[BJMasnoryViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
        
    }else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                [SGWCustomBlockAlertManager alertWithMessage:@"你确定取消吗" cancelButtonTitle:@"取消" cancelBlock:nil];
            }
                break;
            case 1:{
                [SGWBlockAlertManager alertWithTitle:@"" message:@"我是提示框" cancelButtonTitle:@"取消"];
            }
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:{
                [UILabel showErrorProgressLabelWithString:@"我就是个提示框，我就是个提示框"];
            }
                break;
            case 1:{
                CGSize toastSize = [HxToastView sizeForText:@"我就是个提示框，我就是个提示框"];
                HxToastView *toastView = [[HxToastView alloc] initWithFrame:CGRectZero];
                toastView.frame = CGRectMake((self.view.bounds.size.width - toastSize.width) / 2, (SCREEN_HEIGHT-toastSize.height-10)/2 - 20, toastSize.width, toastSize.height+10);
                [self.view addSubview:toastView];
                [self.view bringSubviewToFront:toastView];
                [toastView setToastText:@"我就是个提示框，我就是个提示框"];
                [toastView show:YES];
            }
                
            default:
                break;
        }
    }else if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:{
                BJTouchAndGestureViewController *vc = [[BJTouchAndGestureViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    } else if (indexPath.section == 4) {
        switch (indexPath.row) {
            case 0: {
                BJTextureASViewController *vc = [[BJTextureASViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
}






@end

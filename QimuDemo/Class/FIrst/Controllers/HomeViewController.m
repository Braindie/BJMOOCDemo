//
//  HomeViewController.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/2.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "HomeSectionHeaderView.h"
#import "CYLDBManager.h"//json文件解析
#import "FirstDetailViewController.h"
#import "FirstTableViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


static NSString * CellIdentifier           = @"CellIdentifier";
static NSString * HeaderViewCellIdentifier = @"HeaderViewCellIdentifier";


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

//@property (nonatomic, strong) UIScrollView  * myScrollView;     //滚动广告底图
//@property (nonatomic, strong) UIPageControl * myPageControl;    //翻页控件


@property (nonatomic, strong) UIScrollView *backScrollView;

@property (nonatomic, strong) UICollectionView *collectionView;


@property (nonatomic ,strong) NSMutableArray *collectionData;

@property (nonatomic ,strong) NSMutableArray *dataArr1;

@property (nonatomic ,strong) NSArray *dataArr2;

@end


@implementation HomeViewController




- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];

    self.isNavCtrlSet = YES;

    self.navigationItem.title = @"精选";

    //加载数据
    [self loadTopData];

    //创建视图
    [self creatView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.backScrollView.scrollEnabled = YES;
    [self updateViewHeight];
}

- (void)leftButtonAction:(UIButton *)button{
    FirstTableViewController *vc = [[FirstTableViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightButtonAction:(UIButton *)button{

}


- (void)updateViewHeight {
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView.collectionViewLayout prepareLayout];
    //仅修改self.collectionView的高度,xyw值不变
    self.collectionView.frame = CGRectMake(CGRectGetMinX(self.collectionView.frame),
                                           CGRectGetMinY(self.collectionView.frame),
                                           CGRectGetWidth(self.collectionView.frame),
                                           self.collectionView.contentSize.height +
                                           1000);
    self.backScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,
                                                 self.collectionView.contentSize.height +
                                                 1000);
}



- (void)loadTopData{


    NSArray *dataArr1 = [NSArray arrayWithObjects:@"data1",@"data1",@"data1",@"data1", nil];

//    NSArray *dataArr2 = [NSArray arrayWithObjects:@"data2",@"data2",@"data2",@"data2", nil];


//    self.collectionData = [NSMutableArray arrayWithArray:dataArr1];
    self.dataArr1 = [NSMutableArray arrayWithArray:dataArr1];
    self.dataArr2 = [NSArray arrayWithArray:[CYLDBManager dataSource]];

}


- (void)creatView{

    //底层视图
    self.backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    self.backScrollView.showsVerticalScrollIndicator = NO;
    self.backScrollView.alwaysBounceVertical = YES;
    self.backScrollView.backgroundColor = [UIColor colorWithRed:252.0f/255.f green:252.0f/255.f blue:252.0f/255.f alpha:2.f];
//    self.backgroundView.scrollEnabled = YES;
    [self.view addSubview:self.backScrollView];
    


    //头视图
//    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
//    tableHeaderView.backgroundColor = [UIColor orangeColor];
//    [self.backgroundView addSubview:tableHeaderView];

    //滑动视图
//    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//    myScrollView.pagingEnabled = YES;
//    myScrollView.showsVerticalScrollIndicator = NO;
//    myScrollView.showsHorizontalScrollIndicator = NO;
//    myScrollView.delegate = self;
//    myScrollView.tag = 200;
//    myScrollView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:myScrollView];
//    //底部阴影视图
//    bottomInfoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.width/1.57-25, self.view.frame.size.width, 25)];
//    bottomInfoImgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
//    //滑动图片标题
//    scrollImgTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.view.frame.size.width - 60, 25)];
//    scrollImgTitle.backgroundColor = [UIColor clearColor];
//    scrollImgTitle.font = [UIFont systemFontOfSize:14];
//    scrollImgTitle.textColor = [UIColor whiteColor];
//    [bottomInfoImgView addSubview:scrollImgTitle];
//    //点点
//    myPageCon = [[SMPageControl alloc] initWithFrame:CGRectMake(260, 0, 60, 25)];
//    [myPageCon setPageIndicatorImage:[UIImage imageNamed:@"b.png"]];
//    [myPageCon setCurrentPageIndicatorImage:[UIImage imageNamed:@"c.png"]];
//    myPageCon.backgroundColor = [UIColor clearColor];
//    myPageCon.currentPage = 0;
//    [bottomInfoImgView addSubview:myPageCon];
//
//    //单指单击
//    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer   alloc] initWithTarget:self
//                                                                                        action:@selector(handleSingleFingerEvent:)];
//    singleFingerOne.numberOfTouchesRequired = 1; //手指数
//    singleFingerOne.numberOfTapsRequired = 1; //tap次数
//    [myScrollView addGestureRecognizer:singleFingerOne];
//


//    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320+55, (320+55)/2.2)];
//    self.myScrollView.pagingEnabled = YES;
//    self.myScrollView.showsVerticalScrollIndicator = NO;
//    self.myScrollView.showsHorizontalScrollIndicator = NO;
//    self.myScrollView.tag = 1111;
//    self.myScrollView.backgroundColor = [UIColor redColor];
//
//    self.myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((320+55)/2-50, self.myScrollView.frame.size.height-25, 100, 25)];
//    self.myPageControl.tag = 1212;
//    self.myPageControl.backgroundColor = [UIColor clearColor];
//    self.myPageControl.numberOfPages = 5;
//    self.myPageControl.currentPage = 0;
//    [self.myPageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
//
//    //单指单击
//    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer   alloc] initWithTarget:self
//                                                                                        action:@selector(handleSingleFingerEvent:)];
//    singleFingerOne.numberOfTouchesRequired = 1; //手指数
//    singleFingerOne.numberOfTapsRequired = 1; //tap次数
//    [self.myScrollView addGestureRecognizer:singleFingerOne];





    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    CGFloat width = (kScreenWidth - 10 * 4) / 2;
    CGFloat height = width / 5 * 4;
    layout.itemSize = CGSizeMake(width, height);

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenHeight-49-kScreenWidth*3/5) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    //注册单元格
    [self.collectionView registerClass:[HomeViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [self.collectionView registerClass:[HomeSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewCellIdentifier];

    layout.sectionInset = UIEdgeInsetsMake(100,0,0,0);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);//必填

    self.collectionView.scrollsToTop = NO;
    self.collectionView.scrollEnabled = NO;

    [self.backScrollView addSubview:self.collectionView];
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.dataArr2.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSArray *tmpArr = [NSArray arrayWithArray:[self.dataArr2[section] objectForKey:@"Symptoms"]];
//    for (NSNumber *i in tmpArr) {
//        if (section == [i integerValue]) {
//            return [tmpArr count];
//        }
//    }
    return tmpArr.count;
//    return [self.dataArr2[section] integerValue];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    HomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.backgroundColor = [UIColor orangeColor];

    NSMutableArray *symptoms = [NSMutableArray arrayWithArray:[self.dataArr2[indexPath.section]
                                                               objectForKey:kDataSourceSectionKey]];
    NSString *text = [symptoms[indexPath.row] objectForKey:kDataSourceCellTextKey];

    [cell.button setTitle:text forState:UIControlStateNormal];
    [cell.button setTitle:text forState:UIControlStateSelected];
//    [cell.button addTarget:self action:@selector(itemButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
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
//        filterHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
        filterHeaderView.moreButton.hidden = NO;
//        [self.collectionHeaderMoreBtnHideBoolArray[indexPath.section] boolValue];
//        filterHeaderView.delegate = self;
        NSString *sectionTitle = [self.dataArr2[indexPath.section] objectForKey:@"Type"];
        filterHeaderView.titleButton.tag = indexPath.section;
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
//        for (NSNumber *i in self.expandSectionArray) {
//            if (indexPath.section == [i integerValue]) {
//                filterHeaderView.moreButton.selected = YES;
//            }
//        }
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
    
    FirstDetailViewController *vc = [[FirstDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}






@end

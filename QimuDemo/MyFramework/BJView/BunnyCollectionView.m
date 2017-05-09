//
//  BunnyCollectionView.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "BunnyCollectionView.h"
#import "UICollectionViewLeftAlignedLayout.h"
//#import "MonthCollectionViewCell.h"
#import "MonthXibCollectionViewCell.h"

static NSString *kCellIdentifier = @"CellIdentifier";

@interface BunnyCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *myDataArr;
@property (nonatomic, assign) NSInteger currentSelectItem;
@end

@implementation BunnyCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self builUI];
    }
    return self;
}


- (void)builUI{
    //初始化当前选中的item，1111代表未选择
    self.currentSelectItem = 1111;
    self.backgroundColor = [UIColor orangeColor];
    
    self.myDataArr = @[@"工薪族",@"私营业主",@"网店买卖",@"学生",@"其他",@"有缴纳",@"无缴纳"];
    
    CGRect collectionViewFrame = CGRectMake(0,  0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-80);
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    
    //初始化、代理
    self.collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 105);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
//    [self.collectionView registerClass:[MonthCollectionViewCell class]
//            forCellWithReuseIdentifier:kCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MonthXibCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentifier];
    
    //注册headerView
//    [self.collectionView registerClass:[MonthCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewCellIdentifier];
    
    self.collectionView.allowsMultipleSelection = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    self.collectionView.scrollsToTop = NO;
    self.collectionView.scrollEnabled = YES;
    [self addSubview:self.collectionView];
}
#pragma mark -  UICollectionViewDataSource Method

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return [self.myDataArr count];
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.myDataArr count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 需要配置的代码
//    [collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    MonthXibCollectionViewCell *cell =
    (MonthXibCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier
                                                                         forIndexPath:indexPath];
    
    cell.titleLabel.text = self.myDataArr[indexPath.row];
    
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.layer.cornerRadius = 5;
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    cell.layer.borderWidth = 0.5;
//    cell.layer.masksToBounds = YES;

    
    if (self.currentSelectItem < 1110) {
        if (indexPath.row == self.currentSelectItem) {
            [cell.titleImage setImage:[UIImage imageNamed:@"xin_hongbao_xuanzhong"]];
        }else{
            [cell.titleImage setImage:[UIImage imageNamed:@"xin_hongbao_weixuanzhong"]];
        }
    }else{
        [cell.titleImage setImage:[UIImage imageNamed:@"xin_hongbao_weixuanzhong"]];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentSelectItem = indexPath.row;
    [collectionView reloadData];
}

//取消选中某个Item时触发的方法
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
//    MonthXibCollectionViewCell *cell = (MonthXibCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [cell.titleImage setImage:[UIImage imageNamed:@"xin_hongbao_weixuanzhong"]];
////    [collectionView reloadData];
//}




//根据文字长度获取label宽度
-(CGFloat)changeStationWidth:(NSString *)string anHeightTxtt:(CGFloat)widthText anfont:(CGFloat)fontSize{
    
    UIFont * tfont = [UIFont systemFontOfSize:fontSize];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    
    CGSize size =CGSizeMake(MAXFLOAT,widthText);
    //获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，
    CGSize actualsize =[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    
    return actualsize.width;
}

#pragma mark -  UICollectionViewDelegateLeftAlignedLayout Method
//cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *barNameStr = self.myDataArr[indexPath.row];
    
    CGFloat wide = [self changeStationWidth:barNameStr anHeightTxtt:30 anfont:13];
    
    return CGSizeMake(wide+30, 30);
}

//cell的左右间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
//header的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 38);
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(12, 16, 10, 8);
}

@end

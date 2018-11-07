//
//  BunnyCollectionView.m
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "BunnyCollectionView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "MonthXibCollectionViewCell.h"

static NSString *kCellIdentifier = @"CellIdentifier";

@interface BunnyCollectionView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *myDataArr;
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
    self.backgroundColor = [UIColor clearColor];
    
    
    CGRect collectionViewFrame = CGRectMake(0,  0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-80);
    //如果用系统的，item会左右散开
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    //初始化、代理
    self.collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:layout];
    self.collectionView.frame = self.bounds;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"MonthXibCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentifier];
    
    self.collectionView.allowsMultipleSelection = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = YES;
    [self addSubview:self.collectionView];
}


- (void)setDataSource:(id<BunnyCollectionViewDataSource>)dataSource{
    _dataSource = dataSource;
    
    if ([_dataSource respondsToSelector:@selector(arrayInCollectionView:)]) {
        _myDataArr = [[_dataSource arrayInCollectionView:self] copy];
    }
}


#pragma mark -  UICollectionViewDataSource Method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MonthXibCollectionViewCell *cell =
    (MonthXibCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier
                                                                         forIndexPath:indexPath];
    
    cell.titleLabel.text = self.myDataArr[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];

    if (self.currentSelectItem < 1110) {
        if (indexPath.row == self.currentSelectItem) {
            [cell.titleImage setImage:[UIImage imageNamed:@"xin_hongbao_xuanzhong"]];
            if ([_delegate respondsToSelector:@selector(currentSelectedItem:)]) {
                [_delegate currentSelectedItem:self.myDataArr[indexPath.section][indexPath.row]];
            }
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



#pragma mark -  UICollectionViewDelegateLayout Method

/**
 *   设置cell的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *barNameStr = self.myDataArr[indexPath.row];
    CGFloat wide = [self changeStationWidth:barNameStr anHeightTxtt:30 anfont:13];
    return CGSizeMake(wide+30, 30);
}

/**
 *   每个分区的EdgeInsets
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

/**
 *   动态设置每列的间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


#pragma mark -
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

@end

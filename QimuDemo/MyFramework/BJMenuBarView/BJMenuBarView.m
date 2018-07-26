//
//  BJMenuBarView.m
//  QimuDemo
//
//  Created by zhangwenjun on 2018/7/26.
//  Copyright © 2018年 ll. All rights reserved.
//

#import "BJMenuBarView.h"
#import "MenuBTCollectionViewCell.h"
#import "MenuBTSectionHeaderView.h"


#define M_PI        3.14159265358979323846264338327950288   /* pi             */

typedef void(^Complete)();
static NSString *collectCellID = @"MenuBTCollectionViewCell";
static NSString * HeaderViewCellIdentifier = @"HeaderViewCellIdentifier";

@interface BJMenuBarView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
//@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) UIView *backGroundView;//底部黑色背景视图
@property (nonatomic, strong) UIView *selectView;//筛选视图
@property (nonatomic, strong) UIView *bottomLine;  //底部的线条

@property (nonatomic, strong) UIButton *leftBtn;//重置按钮
@property (nonatomic, strong) UIButton *rightBtn; //确定按钮


@property (nonatomic, strong) MenuBTCollectionViewCell *mycell;
@property (nonatomic, strong) MenuBTSectionHeaderView *scetionHeaderView;
@property (nonatomic, assign) NSInteger numberOfColumn;  //列数
@property (nonatomic, assign) NSInteger currentSelectedColumn;  //当前选中列
@property (nonatomic, assign) NSInteger currentSelectedSection;  //当前选中组

@property (nonatomic, strong) NSArray *titleArr;//接收的标题数组
@property (nonatomic, strong) NSArray *cellArr;//cell数组

@property (nonatomic, strong) NSMutableArray *labelArr;//元素为layer的标题数组
@property (nonatomic, strong) NSMutableArray *upTipArr;//元素为上箭头的数组
@property (nonatomic, strong) NSMutableArray *downTipArr;//元素为下箭头的数组

@property (nonatomic, assign) BOOL isSecondUp;//第二个
@property (nonatomic, assign) NSInteger currentSecondUp;//第二个：0代表未选；1代表上；2代表下；

@property (nonatomic, assign) BOOL isThirdUp;//第三个
@property (nonatomic, assign) NSInteger currentThirdUp;//第三个：0代表未选；1代表上；2代表下；

@property (nonatomic, assign) BOOL isShowMenu;//是否展示筛选界面
@property (nonatomic, assign) BOOL isHasSelect;//筛选中是否有选择


@property (nonatomic, assign) NSInteger currentType;
@property (nonatomic, assign) NSInteger currentRate;
@property (nonatomic, assign) NSInteger currentTime;

@end

@implementation BJMenuBarView

//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height {
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, SCREEN_WIDTH, height)];
    if (self) {
        _titleArr = [[NSArray alloc] init];
        _cellArr = [[NSArray alloc] init];
        _labelArr = [[NSMutableArray alloc] init];
        _upTipArr = [[NSMutableArray alloc] init];
        _downTipArr = [[NSMutableArray alloc] init];
        _height = height;
        
        _currentType = 0;
        _currentRate = 0;
        _currentTime = 0;
        
        //默认箭头不向上
        _isSecondUp = NO;
        _isThirdUp = NO;
        _isShowMenu = NO;
        _isHasSelect = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        
        //菜单条点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapped:)];
        [self addGestureRecognizer:tap];
        
        
        //筛选界面
        _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 380)];
        _selectView.backgroundColor = [UIColor whiteColor];
        
        
        //筛选顶部线条
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
        [_selectView addSubview:_bottomLine];
        
        //筛选的CollectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 299) collectionViewLayout:layout];
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        [_myCollectionView registerClass:[MenuBTCollectionViewCell class] forCellWithReuseIdentifier:collectCellID];
        [_myCollectionView registerClass:[MenuBTSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewCellIdentifier];
        layout.sectionInset = UIEdgeInsetsMake(100,0,0,0);
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 30);//必填
        [_selectView addSubview:_myCollectionView];
        
        
        //重置，确定按钮
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake(31, CGRectGetHeight(_selectView.frame)-44, (SCREEN_WIDTH-62-18)/2, 35);
        self.leftBtn.backgroundColor = [UIColor redColor];
        self.leftBtn.layer.cornerRadius=8;
        [self.leftBtn setTitle:@"重置" forState:UIControlStateNormal];
        [self.leftBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_selectView addSubview:self.leftBtn];
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.leftBtn.frame)+18, CGRectGetMinY(self.leftBtn.frame), (SCREEN_WIDTH-62-18)/2, 35);
        self.rightBtn.backgroundColor = [UIColor blackColor];
        self.rightBtn.layer.cornerRadius=8;
        [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.rightBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectView addSubview:self.rightBtn];
        
        //底部黑色背景
        _backGroundView = [[UIView alloc] init];
        _backGroundView.frame = CGRectMake(origin.x, origin.y, SCREEN_WIDTH, SCREEN_HEIGHT);
        _backGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _backGroundView.opaque = NO;
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapped:)];
        [_backGroundView addGestureRecognizer:backTap];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    
    if (_isHasSelect) {
        UIImage *chooseImage = [UIImage imageNamed:@"ChooseMenuOrange"];
        [chooseImage drawAtPoint:CGPointMake(SCREEN_WIDTH-25, self.height/2-5)];//保持图片大小在point点开始画图
    }else{
        UIImage *chooseImage = [UIImage imageNamed:@"ChooseMenuGray"];
        [chooseImage drawAtPoint:CGPointMake(SCREEN_WIDTH-25, self.height/2-5)];//保持图片大小在point点开始画图
    }
}

- (void)setDataSource:(id<BJMenuBarViewDataSource>)dataSource{
    
    //    NSLog(@"绘图");
    
    _dataSource = dataSource;
    
    if ([_dataSource respondsToSelector:@selector(cellTitelForRowAtIndexPathMenu:)]) {
        self.cellArr = [_dataSource cellTitelForRowAtIndexPathMenu:self];
    }
    
    _numberOfColumn = 4;
    
    
    CGFloat numberOfLine = SCREEN_WIDTH / _numberOfColumn;
    CGFloat numberOfBackground = SCREEN_WIDTH / _numberOfColumn;
    CGFloat numberOfTextLayer = SCREEN_WIDTH / (_numberOfColumn * 2);
    
    //画出标题菜单
    for (int i = 0; i < _numberOfColumn; i++) {
        //backgrounLayer背景
        CGPoint positionForBackgroundLayer = CGPointMake((i + 0.5) * numberOfBackground, self.height / 2);
        CALayer *bgLayer = [self createBackgroundLayerWithPosition:positionForBackgroundLayer color:[UIColor clearColor]];
        [self.layer addSublayer:bgLayer];
        
        //titleLayer文字
        if ([_dataSource respondsToSelector:@selector(titleForRowAtIndexPathMenu:)]) {
            self.titleArr = [_dataSource titleForRowAtIndexPathMenu:self];
        }
        
        NSString *titleString = self.titleArr[i];
        CGPoint positionForTitle = CGPointMake(( i * 2 + 1) * numberOfTextLayer, self.height / 2);
        if (i == 0) {//“默认”初始时为淡金色
            CATextLayer *textLayer = [self createTitleLayerWithString:titleString position:positionForTitle color:[UIColor redColor]];
            
            [self.layer addSublayer:textLayer];
            [self.labelArr addObject:textLayer];
        }else{//其他为黑色
            CATextLayer *textLayer = [self createTitleLayerWithString:titleString position:positionForTitle color:[UIColor blackColor]];
            [self.layer addSublayer:textLayer];
            [self.labelArr addObject:textLayer];
        }
        
        
        //分割线
        CGPoint separatorLine = CGPointMake(i*numberOfBackground, self.height/2);
        CALayer *separatorLineLayer = [self createSeparatorWithPosition:separatorLine color:[UIColor lightGrayColor]];
        [self.layer addSublayer:separatorLineLayer];
        
        if (i == 0) {
            //画的三角隐藏了（默认）
            CGPoint indicatorUpPosition = CGPointMake((i + 1) * numberOfLine - 20, self.height/2-2);//上三角
            CGPoint indicatorDownsition = CGPointMake((i + 1) * numberOfLine - 20, self.height/2+5);//下三角
            CAShapeLayer *sharpUpLayer = [self createZhengIndicatorWithPosition:indicatorUpPosition color:[UIColor lightGrayColor]];
            CAShapeLayer *sharpDownLayer = [self createIndicatorWithPosition:indicatorDownsition color:[UIColor lightGrayColor]];
            [self.upTipArr addObject:sharpUpLayer];
            [self.downTipArr addObject:sharpDownLayer];
            
        }else if (i == 1){
            //indicatorLayer三角（年利率）
            CGPoint indicatorUpPosition = CGPointMake((i + 1) * numberOfLine - 15, self.height/2-2);//上三角
            CGPoint indicatorDownsition = CGPointMake((i + 1) * numberOfLine - 15, self.height/2+5);//下三角
            CAShapeLayer *sharpUpLayer = [self createZhengIndicatorWithPosition:indicatorUpPosition color:[UIColor lightGrayColor]];
            CAShapeLayer *sharpDownLayer = [self createIndicatorWithPosition:indicatorDownsition color:[UIColor lightGrayColor]];
            
            [self.layer addSublayer:sharpUpLayer];
            [self.layer addSublayer:sharpDownLayer];
            [self.upTipArr addObject:sharpUpLayer];
            [self.downTipArr addObject:sharpDownLayer];
            
        }else if (i == 2){
            //indicatorLayer三角（期限）
            CGPoint indicatorUpPosition = CGPointMake((i + 1) * numberOfLine - 20, self.height/2-2);//上三角
            CGPoint indicatorDownsition = CGPointMake((i + 1) * numberOfLine - 20, self.height/2+5);//下三角
            CAShapeLayer *sharpUpLayer = [self createZhengIndicatorWithPosition:indicatorUpPosition color:[UIColor lightGrayColor]];
            CAShapeLayer *sharpDownLayer = [self createIndicatorWithPosition:indicatorDownsition color:[UIColor lightGrayColor]];
            
            [self.layer addSublayer:sharpUpLayer];
            [self.layer addSublayer:sharpDownLayer];
            [self.upTipArr addObject:sharpUpLayer];
            [self.downTipArr addObject:sharpDownLayer];
        }else{
            //画个筛选图片
        }
        
        
    }
    
}

#pragma mark - 点击菜单
- (void)menuTapped:(UITapGestureRecognizer *)gesture {
    if (_dataSource == nil) {
        return;
    }
    //触摸的地方的index
    CGPoint touchPoint = [gesture locationInView:self];
    NSInteger touchIndex = touchPoint.x / (SCREEN_WIDTH / self.numberOfColumn);
    //    NSLog(@"当前点击的是：%ld",(long)touchIndex);
    _currentSelectedColumn = touchIndex;
    
    if (touchIndex == 0) {//点击的是“默认”
        //修改“默认”字体颜色
        CATextLayer *layer = self.labelArr[touchIndex];
        layer.foregroundColor = [UIColor lightGrayColor].CGColor;
        //收起筛选页面
        if (_isShowMenu) {
            _isShowMenu = NO;
            [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[3] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
                
            }];
        }
        //年利率、期限置灰
        _isSecondUp = NO;
        _currentSecondUp = 0;
        _isThirdUp = NO;
        _currentThirdUp = 0;
        [self animateIndicatorUp:self.upTipArr[1] withIndicatorDown:self.downTipArr[1] withTitle:self.labelArr[1] reverse:NO isUp:NO];
        [self animateIndicatorUp:self.upTipArr[2] withIndicatorDown:self.downTipArr[2] withTitle:self.labelArr[2] reverse:NO isUp:NO];
        
        //点击了默认（代理事件）
        if ([self.delegate respondsToSelector:@selector(clickDefaultAction)]) {
            [_delegate clickDefaultAction];
        }
        
        
    }else if (touchIndex == 1){//点击的是“年利率”
        //修改“默认”字体颜色
        CATextLayer *layer = self.labelArr[0];
        layer.foregroundColor = [UIColor lightGrayColor].CGColor;
        //收起筛选界面
        if (_isShowMenu) {
            _isShowMenu = NO;
            [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[3] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
            }];
        }
        //修改上下上下箭头
        if (_isSecondUp) {
            _isSecondUp = NO;
            _currentSecondUp = 1;
            [self animateIndicatorUp:self.upTipArr[touchIndex] withIndicatorDown:self.downTipArr[touchIndex] withTitle:self.labelArr[touchIndex] reverse:YES isUp:_isSecondUp];
        }else{
            _isSecondUp = YES;
            _currentSecondUp = 2;
            [self animateIndicatorUp:self.upTipArr[touchIndex] withIndicatorDown:self.downTipArr[touchIndex] withTitle:self.labelArr[touchIndex] reverse:YES isUp:_isSecondUp];
        }
        //置灰期限
        [self animateIndicatorUp:self.upTipArr[2] withIndicatorDown:self.downTipArr[2] withTitle:self.labelArr[2] reverse:NO isUp:NO];
        
        //点击了年利率按钮（代理事件）
        if ([self.delegate respondsToSelector:@selector(clickRateActionIsUp:)]) {
            [self.delegate clickRateActionIsUp:_isSecondUp];
        }
        
    }else if (touchIndex == 2){//点击的是“期限”
        //修改“默认”字体颜色
        CATextLayer *layer = self.labelArr[0];
        layer.foregroundColor = [UIColor lightGrayColor].CGColor;
        //收起筛选界面
        if (_isShowMenu) {
            _isShowMenu = NO;
            [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[3] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
            }];
        }
        //修改上下箭头
        if (_isThirdUp) {
            _isThirdUp = NO;
            _currentThirdUp = 1;
            [self animateIndicatorUp:self.upTipArr[touchIndex] withIndicatorDown:self.downTipArr[touchIndex] withTitle:self.labelArr[touchIndex] reverse:YES isUp:_isThirdUp];
        }else{
            _isThirdUp = YES;
            _currentThirdUp = 2;
            [self animateIndicatorUp:self.upTipArr[touchIndex] withIndicatorDown:self.downTipArr[touchIndex] withTitle:self.labelArr[touchIndex] reverse:YES isUp:_isThirdUp];
        }
        //置灰年利率
        [self animateIndicatorUp:self.upTipArr[1] withIndicatorDown:self.downTipArr[1] withTitle:self.labelArr[1] reverse:NO isUp:NO];
        
        //点击了期限按钮（代理事件）
        if ([self.delegate respondsToSelector:@selector(clickTimeActionIsUp:)]) {
            [self.delegate clickTimeActionIsUp:_isThirdUp];
        }
        
    }else{//点击的是筛选
        
        if (_isShowMenu) {
            _isShowMenu = NO;
            [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[touchIndex] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
            }];
            
        }else{
            _isShowMenu = YES;
            [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[touchIndex] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
            }];
            
        }
    }
    //重绘筛选图片
    [self setNeedsDisplay];
    
}



#pragma mark - 点击蒙版
- (void)backTapped:(UITapGestureRecognizer *)gesture {
    _isShowMenu = NO;
    [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[3] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
        
    }];
    [self setNeedsDisplay];
}

#pragma mark - 点击筛选中确定按钮
- (void)selectAction:(UIButton *)btn{
    if (btn == self.leftBtn) {
        if ([_delegate respondsToSelector:@selector(clickSelectActionWithType:withRate:withTime:)]) {
            _currentType = 0;
            _currentRate = 0;
            _currentTime = 0;
            [_myCollectionView reloadData];
            [_delegate clickSelectActionWithType:_currentType withRate:_currentRate withTime:_currentTime];
        }
    }else{
        if ([_delegate respondsToSelector:@selector(clickSelectActionWithType:withRate:withTime:)]) {
            [_delegate clickSelectActionWithType:_currentType withRate:_currentRate withTime:_currentTime];
        }
    }
    //判断是否
    if (_currentType == 0 && _currentRate == 0 && _currentTime == 0) {
        _isHasSelect = NO;
        //无筛选，“默认”字体为橙色
        if (_currentSecondUp == 0 && _currentThirdUp == 0) {
            CATextLayer *layer = self.labelArr[0];
            layer.foregroundColor = [UIColor lightGrayColor].CGColor;
        }
    }else{
        _isHasSelect = YES;
        //修改“默认”字体颜色
        CATextLayer *layer = self.labelArr[0];
        layer.foregroundColor = [UIColor lightGrayColor].CGColor;
    }
    //收起筛选界面
    _isShowMenu = NO;
    [self animateIndicator:nil background:_backGroundView collectionView:_selectView title:self.labelArr[3] reverse:_isShowMenu withIsSelect:_isHasSelect complecte:^{
    }];
    //重绘筛选图片
    [self setNeedsDisplay];
    
}


#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.cellArr[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.cellArr.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _mycell = [collectionView dequeueReusableCellWithReuseIdentifier:collectCellID forIndexPath:indexPath];
    if (_mycell == nil) {
        _mycell = (MenuBTCollectionViewCell *)[[UICollectionViewCell alloc] init];;
    }else{
        //删除cell的所有子视图
        while ([_mycell.contentView.subviews lastObject] != nil){
            [(UIView*)[_mycell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    _mycell.menuLabel.text = self.cellArr[indexPath.section][indexPath.row];
    _mycell.menuLabel.font = [UIFont systemFontOfSize:14];
    
    
    if (indexPath.section==0) {
        if (indexPath.row == _currentType) {
            _mycell.menuLabel.textColor = [UIColor lightGrayColor];
            _mycell.menuLabel.backgroundColor=[UIColor lightGrayColor];
            //_mycell.menuLabel.layer.borderColor=[UIColor clearColor].CGColor;
            _mycell.menuImage.hidden = NO;
        }else{
            _mycell.menuLabel.textColor = [UIColor lightGrayColor];
            _mycell.menuLabel.backgroundColor=[UIColor clearColor];
            _mycell.menuLabel.layer.borderColor=[UIColor lightGrayColor].CGColor;
            _mycell.menuImage.hidden = YES;
        }
    }
    else if (indexPath.section==1) {
        if (indexPath.row == _currentRate) {
            _mycell.menuLabel.textColor = [UIColor lightGrayColor];
            _mycell.menuLabel.backgroundColor=[UIColor lightGrayColor];
            //_mycell.menuLabel.layer.borderColor=[UIColor clearColor].CGColor;
            _mycell.menuImage.hidden = NO;
        }else{
            _mycell.menuLabel.textColor = [UIColor lightGrayColor];
            _mycell.menuLabel.backgroundColor=[UIColor clearColor];
            _mycell.menuLabel.layer.borderColor=[UIColor lightGrayColor].CGColor;
            _mycell.menuImage.hidden = YES;
        }
    }else{
        if (indexPath.row == _currentTime) {
            _mycell.menuLabel.textColor = [UIColor lightGrayColor];
            _mycell.menuLabel.backgroundColor=[UIColor orangeColor];
            //_mycell.menuLabel.layer.borderColor=[UIColor clearColor].CGColor;
            _mycell.menuImage.hidden = NO;
        }else{
            _mycell.menuLabel.textColor = [UIColor orangeColor];
            _mycell.menuLabel.backgroundColor=[UIColor clearColor];
            _mycell.menuLabel.layer.borderColor=[UIColor orangeColor].CGColor;
            _mycell.menuImage.hidden = YES;
        }
    }
    return _mycell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        MenuBTSectionHeaderView *scetionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewCellIdentifier forIndexPath:indexPath];
        scetionHeaderView.titleLabel.font = [UIFont systemFontOfSize:15];
        
        switch (indexPath.section) {
            case 0:
                scetionHeaderView.titleLabel.text = @"状态";
                break;
            case 1:
                scetionHeaderView.titleLabel.text = @"年化利率";
                break;
            case 2:
                scetionHeaderView.titleLabel.text = @"期限";
                break;
                
            default:
                break;
        }
        
        return (UICollectionReusableView *)scetionHeaderView;
    }
    return nil;
    
}
#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _currentSelectedSection = indexPath.section;
    
    if (indexPath.section==0) {
        _currentType = indexPath.row;
    }else if (indexPath.section==1){
        _currentRate = indexPath.row;
    }else{
        _currentTime = indexPath.row;
    }
    
    [_myCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH-20)/3, (SCREEN_WIDTH-20)/9);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 5, 0, 5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}




#pragma mark - 绘图
//背景
- (CALayer *)createBackgroundLayerWithPosition:(CGPoint)position color:(UIColor *)color {
    CALayer *layer = [CALayer layer];
    layer.position = position;//锚点（中心点）
    layer.bounds = CGRectMake(0, 0, SCREEN_WIDTH / self.numberOfColumn, self.height - 1);
    layer.backgroundColor = color.CGColor;
    return layer;
}

//标题
- (CATextLayer *)createTitleLayerWithString:(NSString *)string position:(CGPoint)position color:(UIColor *)color {
//    CGSize size = [Utils calculateTitleSizeWithString:string withFontSize:14];
    CGSize size = CGSizeMake(30, 50);

    CATextLayer *layer = [CATextLayer new];
    //    NSLog(@"%f",self.frame.size.width);
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numberOfColumn) - 25) ? size.width : self.frame.size.width / _numberOfColumn - 25;
    layer.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    layer.string = string;
    layer.fontSize = 14;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.truncationMode = kCATruncationEnd;
    layer.foregroundColor = color.CGColor;
    layer.contentsScale = [[UIScreen mainScreen] scale];
    layer.position = position;
    
    return layer;
}


//指示器
- (CAShapeLayer *)createIndicatorWithPosition:(CGPoint)position color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(8, 0)];
    [path addLineToPoint:CGPointMake(4, 4)];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = 0.8;
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = position;
    
    return layer;
}
//正指示器
- (CAShapeLayer *)createZhengIndicatorWithPosition:(CGPoint)position color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(8, 0)];
    [path addLineToPoint:CGPointMake(4, -4)];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = 0.8;
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = position;
    
    return layer;
}

//分隔线
- (CAShapeLayer *)createSeparatorWithPosition:(CGPoint)position color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(position.x,0.0)];
    [path addLineToPoint:CGPointMake(position.x, self.height)];
    
    layer.path = path.CGPath;
    layer.lineWidth = 1;
    layer.strokeColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = position;
    return layer;
}


#pragma mark - 动画
//点击@“筛选”按钮入口
- (void)animateIndicator:(CAShapeLayer *)indicator background:(UIView *)background collectionView:(UIView *)collection title:(CATextLayer *)title reverse:(BOOL)reverse withIsSelect:(BOOL)isSelect complecte:(void(^)())complete {
    
    [self animateTitle:title show:reverse complete:^{//改变字体颜色
        [self animateBackGroundView:background show:reverse complete:^{//添加、隐藏背景蒙版
            [self animateCollectionView:collection show:reverse complete:^{//修改CollectionView的Frame
                
            }];
        }];
    }];
    
    complete();
}

//点击前三个按钮控制入口
- (void)animateIndicatorUp:(CAShapeLayer *)indicatorUp withIndicatorDown:(CAShapeLayer *)indicatorDown withTitle:(CATextLayer *)title reverse:(BOOL)reverse isUp:(BOOL)isUp{
    
    if (!reverse) {//点击了默认
        indicatorUp.fillColor = [UIColor grayColor].CGColor;
        indicatorDown.fillColor = [UIColor grayColor].CGColor;
        
        title.foregroundColor = [UIColor grayColor].CGColor;
    }else{
        if (isUp) {//点击了@“年利率”或@"期限"
            indicatorUp.fillColor = [UIColor grayColor].CGColor;
            indicatorDown.fillColor = [UIColor grayColor].CGColor;
            
            title.foregroundColor = [UIColor grayColor].CGColor;
        }else{
            indicatorUp.fillColor = [UIColor grayColor].CGColor;
            indicatorDown.fillColor = [UIColor grayColor].CGColor;
            
            title.foregroundColor = [UIColor grayColor].CGColor;
        }
    }
}

//旋转三角
//- (void)animateIndicator:(CAShapeLayer *)indicator reverse:(BOOL)reverse complete:(Complete)complete {
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:0.01];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
//
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
//    anim.values = reverse ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
//
//    if (!anim.removedOnCompletion) {
//        [indicator addAnimation:anim forKey:anim.keyPath];
//    } else {
//        [indicator addAnimation:anim forKey:anim.keyPath];
//        [indicator setValue:anim.values.lastObject forKeyPath:anim.keyPath];
//    }
//
//    [CATransaction commit];
//    if (reverse) {
//        indicator.fillColor = [UIColor orangeColor].CGColor;
//    }else {
//        indicator.fillColor = [UIColor redColor].CGColor;
//    }
//    complete();
//}

//改变字体颜色
- (void)animateTitle:(CATextLayer *)title show:(BOOL)show complete:(Complete)complete {
    CGSize size = CGSizeMake(30, 50);
//    CGSize size = [Utils calculateTitleSizeWithString:title.string withFontSize:14];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numberOfColumn) - 25) ? size.width : self.frame.size.width / _numberOfColumn - 25;
    title.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    
    
    if (!show) {
        title.foregroundColor = [UIColor grayColor].CGColor;
    } else {
        title.foregroundColor = [UIColor grayColor].CGColor;
    }
    complete();
}

//添加、隐藏背景蒙版
- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(Complete)complete {
    
    if (show) {
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        
        [UIView animateWithDuration:0.05 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        }];
    }else {
        
        [UIView animateWithDuration:0.05 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            if (finished) {
                [view removeFromSuperview];
            }
        }];
    }
    
    complete();
}
//修改CollectionView的Frame
- (void)animateCollectionView:(UIView *)collection show:(BOOL)show complete:(Complete)complete {
    
    if (show) {
        
        [self.superview addSubview:_selectView];
        
        //重新设置frame
        [UIView animateWithDuration:0.05 animations:^{
            _myCollectionView.frame = CGRectMake(0, 1, SCREEN_WIDTH, 299);
            _selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 380);
        }];
        
    }else {
        [UIView animateWithDuration:0.05 animations:^{
            
            _selectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
            
        } completion:^(BOOL finished) {
            
            [_selectView removeFromSuperview];
        }];
    }
    
    complete();
}

@end

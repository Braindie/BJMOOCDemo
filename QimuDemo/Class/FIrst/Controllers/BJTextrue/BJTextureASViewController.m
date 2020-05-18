//
//  BJTextureASViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2020/3/24.
//  Copyright © 2020 ll. All rights reserved.
//

#import "BJTextureASViewController.h"
#import "BJBannerASCellNode.h"
#import "BJPageASCellNode.h"
#import "BJRefresh.h"

#import "XBASTableNode.h"

@interface BJTextureASViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, copy) NSString *contentStr;

@property (nonatomic, strong) XBASTableNode *tableNode;

///// tableView在历史列表顶部是否可以滑动
//@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
///// 上次的状态
//@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

/// 外层table是否可以滑动
@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, strong) BJPageASCellNode *pageCellNode;


@end

@implementation BJTextureASViewController

- (instancetype)init {
    _tableNode = [[XBASTableNode alloc] init];
    self = [super initWithNode:_tableNode];

    if (self) {
        
        self.navigationItem.title = @"Texture";
        
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
        
        self.canScroll = YES;
    
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isCustomBack = YES;
    self.contentStr = @"你好";
    
    @weakify(self)
    self.tableNode.view.bj_header = [BJRefreshGifStateHeader headerWithRefreshingBlock:^{
        NSLog(@"开始刷新");
        @strongify(self)
        [self requestData];
    }];
}

- (void)requestData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableNode.view.bj_header endRefreshing];
        [self.tableNode reloadData];
    });
}

- (void)loadView {
    [super loadView];
    
    self.tableNode.leadingScreensForBatching = 2.5;  // overriding default of 2.0
}

- (void)loadPage
{
  [self loadPageWithContext:nil];
}

- (void)loadPageWithContext:(ASBatchContext *)context
{
  [context completeBatchFetching:YES];
}


#pragma mark - ASTableDataSource methods
//- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
//    return 6;
//}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.section == 5) {
//        ASCellNode *(^ASPageCellNodeBlock)() = ^ASCellNode *() {
//            self.pageCellNode = [[BJPageASCellNode alloc] init];
//            @weakify(self)
//            self.pageCellNode.outTableCanScrollBlock = ^{
//                @strongify(self);
//                self.canScroll = YES;
//            };
//            return self.pageCellNode;
//        };
//        return ASPageCellNodeBlock;
//
//    } else {
//
//    }
    ASCellNode *(^ASBannerCellNodeBlock)() = ^ASCellNode *() {
        BJBannerASCellNode *cellNode = [[BJBannerASCellNode alloc] init];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    return ASBannerCellNodeBlock;
}

#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSInteger historySection = [self.tableNode numberOfSections] - 1;
//    if (historySection >= 0) {
//        // 菜单顶部偏移量
//        NSInteger menuTop = 300-84;
//        NSInteger offsetY = scrollView.contentOffset.y;
//        NSLog(@"--------->>>%ld", offsetY);
//
//        if (offsetY >= menuTop) {
//            scrollView.contentOffset = CGPointMake(0.f, menuTop);
//            
//            if (self.canScroll) {
//                self.canScroll = NO;
//                self.pageCellNode.pagerNode.isCanScroll = YES;            }
//        } else {
//            if (!self.canScroll) {
//                scrollView.contentOffset = CGPointMake(0, menuTop);
//            }
//        }
////        if (self.isTopIsCanNotMoveTabView != self.isTopIsCanNotMoveTabViewPre) {
////            if (!self.isTopIsCanNotMoveTabViewPre && self.isTopIsCanNotMoveTabView) {
////                self.pageCellNode.pagerNode.isCanScroll = YES;
////                self.canScroll = NO;
////            }
////            if(self.isTopIsCanNotMoveTabViewPre && !self.isTopIsCanNotMoveTabView) {
////                if (!self.canScroll) {
////                    scrollView.contentOffset = CGPointMake(0.f, menuTop);
////                } else {
////                    [self.pageCellNode.pagerNode resetContentOffset];
////                }
////            }
////        }
//    }
//}

- (void)setCanScroll:(BOOL)canScroll {
    _canScroll = canScroll;
    self.tableNode.view.showsVerticalScrollIndicator = canScroll;
}

@end

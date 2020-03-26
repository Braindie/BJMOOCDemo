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

@interface BJTextureASViewController ()<ASTableDelegate, ASTableDataSource>

//@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, copy) NSString *contentStr;

@property (nonatomic, strong) ASTableNode *tableNode;
@end

@implementation BJTextureASViewController

- (instancetype)init {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    self = [super initWithNode:_tableNode];

    if (self) {
        
        self.navigationItem.title = @"Texture";
        
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableNode.view.bj_header endRefreshing];
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

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 9) {
        ASCellNode *(^ASPageCellNodeBlock)() = ^ASCellNode *() {
            BJPageASCellNode *cellNode = [[BJPageASCellNode alloc] init];
            return cellNode;
        };
        return ASPageCellNodeBlock;
        
    } else {
        ASCellNode *(^ASBannerCellNodeBlock)() = ^ASCellNode *() {
            BJBannerASCellNode *cellNode = [[BJBannerASCellNode alloc] init];
            return cellNode;
        };
        return ASBannerCellNodeBlock;
    }
    
//    ASCellNode *(^ASCellNodeBlock)() = ^ASCellNode *() {
//        @weakify(self)
//        BJTextureASCellNode *cellNode = [[BJTextureASCellNode alloc] initWithObject:self.contentStr];
//        cellNode.addBlock = ^{
//            @strongify(self)
//            self.contentStr = @"你要呀呀呀呀呀呀呀呀呀呀呀呀呀";
//            [self.tableNode reloadData];
//            NSLog(@"添加好友");
//        };
//        return cellNode;
//    };
}

@end

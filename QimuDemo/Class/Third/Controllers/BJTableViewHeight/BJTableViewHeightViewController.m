//
//  BJTableViewHeightViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/19.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJTableViewHeightViewController.h"
#import "BJTableViewHeightCell.h"
#import "BJTableViewHeightModel.h"

#import "UITableView+FDTemplateLayoutCell.h"


@interface BJTableViewHeightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *myDataArray;
@end

@implementation BJTableViewHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
//    _tableView.estimatedRowHeight = 100;
    _tableView.fd_debugLogEnabled = YES;
    [_tableView registerNib:[UINib nibWithNibName:@"BJTableViewHeightCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self configData];
}

- (void)configData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"datalist" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataPath];
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedArr = rootDic[@"feed"];//找不到key会崩
        
        NSMutableArray *arr = @[].mutableCopy;
        [feedArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [arr addObject:[[BJTableViewHeightModel alloc] initWithDictionary:obj]];
        }];
        
        self.myDataArray = arr;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BJTableViewHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BJTableViewHeightCell" owner:self options:nil] lastObject];
    }
    cell.model = self.myDataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /**
     *   通过key
     */
//    BJTableViewHeightModel *model = self.myDataArray[indexPath.row];
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" cacheByKey:model.identifier configuration:^(id cell) {
//        BJTableViewHeightCell *ce = cell;
//        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
//        ce.model = self.myDataArray[indexPath.row];
//    }];
    
    /**
     *   没有缓存
     */
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(id cell) {
        BJTableViewHeightCell *ce = cell;
        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
        ce.model = self.myDataArray[indexPath.row];
    }];
    
    /**
     *   通过indexPath
     */
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(id cell) {
//        BJTableViewHeightCell *ce = cell;
//        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
//        ce.model = self.myDataArray[indexPath.row];
//    }];
    
//    CGFloat height = 100;
    return height;
}



@end

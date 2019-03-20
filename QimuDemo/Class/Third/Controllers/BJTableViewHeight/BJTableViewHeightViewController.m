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
@property (nonatomic, copy) NSArray *jsonArray;
@property (nonatomic, strong) NSMutableArray *myDataArray;
@end

@implementation BJTableViewHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"TableView缓存高度";
    self.isCustomBack = YES;
    
    self.isNavCtrlSetRight = YES;
    [self.rightButton setTitle:@"Action" forState:UIControlStateNormal];
    
    
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
        
        self.jsonArray = arr;
        
        self.myDataArray = [self.jsonArray mutableCopy];
        
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
//    NSLog(@"heightForRowAtIndexPath");
    /**
     *   通过key作为Dic的key来缓存
     */
    BJTableViewHeightModel *model = self.myDataArray[indexPath.row];
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" cacheByKey:model.identifier configuration:^(id cell) {
        BJTableViewHeightCell *ce = cell;
        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
        ce.model = self.myDataArray[indexPath.row];
    }];
    
    /**
     *   没有缓存
     */
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(id cell) {
//        BJTableViewHeightCell *ce = cell;
//        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
//        ce.model = self.myDataArray[indexPath.row];
//    }];
    
    /**
     *   通过indexPath做为Dic的key来缓存
     */
//    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(id cell) {
//        BJTableViewHeightCell *ce = cell;
//        ce.fd_enforceFrameLayout = NO;//手动布局还是自动布局，手动布局需要重写sizeThatFits
//        ce.model = self.myDataArray[indexPath.row];
//    }];
    
//    CGFloat height = 100;
    return height;
}

- (void)rightButtonAction:(UIButton *)button{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Action" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"插入一个" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSInteger randomNumber = arc4random_uniform((int32_t)self.jsonArray.count);
        BJTableViewHeightModel *model = self.jsonArray[randomNumber];
        
        [self.myDataArray insertObject:model atIndex:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    [alert addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"删除一个" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (self.myDataArray.count > 0) {
            [self.myDataArray removeObjectAtIndex:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
    [alert addAction:action2];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"销毁了");
}

@end

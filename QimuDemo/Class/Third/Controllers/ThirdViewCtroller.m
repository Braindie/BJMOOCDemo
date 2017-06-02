//
//  ThirdViewCtroller.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdViewCtroller.h"
//#import "ThirdCell.h"
//#import "ThirdDetailViewController.h"
#import "LiveListCell.h"

#import "KxMovieViewController.h"

#import "AFHTTPSessionManager.h"
#import "LiveListModel.h"
#import "LiverModel.h"
#import <YYModel/YYModel.h>

#import "UIImageView+WebCache.h"

#import <MBProgressHUD/MBProgressHUD.h>

static NSString *identifer = @"tableViewCell";

@implementation ThirdViewCtroller



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSet = NO;

    self.navigationItem.title = @"映客直播列表";


    //    //加载数据
    [self loadTopData];
    
    
    //    //创建视图
    [self creatView];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)loadTopData{
    
    NSURL *URL = [NSURL URLWithString:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"加载中";
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [hud hideAnimated:YES];
        NSLog(@"JSON: %@", responseObject);
        LiveListModel *model = [LiveListModel yy_modelWithJSON:responseObject];

        NSLog(@"%@",model);
        self.myDataArr = [NSMutableArray arrayWithArray:model.lives];
        self.thirdTableView.hidden = NO;
        [self.thirdTableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", error);

    }];

}

- (void)creatView{

    self.thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];
    self.thirdTableView.hidden = YES;
    
}




#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LiveListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        UINib *nib = [UINib nibWithNibName:@"LiveListCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:@"CellID"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    }

    if (self.myDataArr.count != 0) {
        LiverModel *model = self.myDataArr[indexPath.row];
        cell.titleLabel.text = model.creator.nick;
        [cell.titleImage sd_setImageWithURL:[NSURL URLWithString:model.creator.portrait]];
//        NSURL *url = [NSURL URLWithString:model.creator.portrait];
//        [cell.titleImage sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            NSLog(@"error : %@",error);
//        }];
        cell.titleUrl.text = model.stream_addr;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    ThirdDetailViewController *thirdDetailViewCtrl = [[ThirdDetailViewController alloc] init];
//    thirdDetailViewCtrl.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:thirdDetailViewCtrl animated:NO];
    
    LiverModel *model = self.myDataArr[indexPath.row];
    NSString *url = model.stream_addr;
    KxMovieViewController *vc = [KxMovieViewController movieViewControllerWithContentPath:url parameters:nil];
    [self presentViewController:vc animated:YES completion:nil];
    
//    http://pull99.a8.com/live/1493629218418259.flv
//    http://pull.a8.com/live/1493627977729613.flv
//    江苏卫视
//    http://14.18.17.141:9009/live/chid=23
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.width;
}


@end

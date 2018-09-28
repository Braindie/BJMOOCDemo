//
//  ThirdViewCtroller.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "ThirdViewCtroller.h"
#import "LiveListCell.h"
#import "LiveListModel.h"
#import "LiverModel.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import "AFHTTPSessionManager.h"

#import <YYModel/YYModel.h>
#import "UITableView+FDTemplateLayoutCell.h"



@interface ThirdViewCtroller ()<NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableData *mData;

@end

@implementation ThirdViewCtroller



- (void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.isNavCtrlSetLeft = NO;
    self.isNavCtrlSetRight = NO;
    self.navigationItem.title = @"网络";
    
    //创建视图
    self.thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];
    self.thirdTableView.hidden = YES;
    
    self.thirdTableView.fd_debugLogEnabled = YES;

    //使用FDTemplateLayoutCell必须要注册
    UINib *nib = [UINib nibWithNibName:@"LiveListCell" bundle:nil];
    [self.thirdTableView registerNib:nib forCellReuseIdentifier:@"LiveListCell"];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
        
    //加载数据
        [self requestDataWithAFN];
    
//    self.mData = [[NSMutableData alloc] init];
//    [self requestDataWithNSURLSession];

}

#pragma mark - AFN
- (void)requestDataWithAFN{
    
    NSString *urlString = @"http://cbox.cntv.cn/json2015/fenleierjiye/tiyuyexinban/sports2017/2018wordcup/renwuguojia/index.json";

//    NSString *urlString = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=2";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", nil];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"加载中";
    
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [hud hideAnimated:YES];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"JSON: %@", responseObject);
        LiveListModel *model = [LiveListModel yy_modelWithJSON:dic[@"data"]];

        NSLog(@"%@",model);
        self.myDataArr = [NSMutableArray arrayWithArray:model.itemList];
        if (self.myDataArr.count == 0) {
            self.thirdTableView.hidden = YES;
        }else{
            self.thirdTableView.hidden = NO;
            [self.thirdTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", error);

    }];

}

#pragma mark - NSURLSession
- (void)requestDataWithNSURLSession{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:queue];
    
    
    
//    NSURL *url = [NSURL URLWithString:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=2"];
    NSURL *url = [NSURL URLWithString:@"http://cbox.cntv.cn/json2015/fenleierjiye/tiyuyexinban/sports2017/2018wordcup/renwuguojia/index.json"];

    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    mRequest.HTTPMethod = @"Get";
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:mRequest];
    
    
//    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//    }];
    [task resume];
}

#pragma mark -- NSURLSessionDelegate
//最后一条消息
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error{
    NSLog(@"%s",__func__);
}
//身份认证凭证
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    NSLog(@"%s",__func__);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session{
    NSLog(@"%s",__func__);
}


#pragma mark -- NSURLSessionDataDelegate
//收到相应
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{
//    NSLog(@"%s",__func__);
//
//    //默认情况下不接收数据
//    //必须告诉系统是否接收服务器返回的数据。。。。。。否则：下面的代理就不再调用了。。。。
//    completionHandler(NSURLSessionResponseAllow);
//}

//接收到服务器数据（多次调用）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"%s",__func__);
    
    //!< 拼接服务器返回的数据
    [self.mData appendData:data];
}

//任务完成时调用
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"%s",__func__);
    
    //解析服务器返回的数据
    NSLog(@"mData = %@", [[NSString alloc] initWithData:self.mData encoding:NSUTF8StringEncoding]);
}




#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LiveListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LiveListCell"];
    cell.model = self.myDataArr[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *url = @"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"LiveListCell" configuration:^(id cell) {
        LiveListCell *listCell = (LiveListCell *)cell;
        listCell.model = self.myDataArr[indexPath.row];
    }];
}


@end

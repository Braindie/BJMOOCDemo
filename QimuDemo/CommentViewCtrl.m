//
//  CommentViewCtrl.m
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "CommentViewCtrl.h"
#import "CommentCell.h"
static NSString *identifer = @"commentTableViewCell";

@implementation CommentViewCtrl

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"评论";
    [self loadData];

    [self addView];

}

- (void)loadData{
    NSMutableDictionary * dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"天下霸唱",@"name",
                                  @"只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1只是一段测试语句1",@"content",
                                  @"2015-10-1",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"3",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"秦时明月",@"name",
                                  @"只是一段测试语句22",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"赵大头",@"name",
                                  @"只是一段测试语句333",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"钱2",@"name",
                                  @"只是一段测试语句4444",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    NSMutableDictionary * dic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"孙5",@"name",
                                  @"只是一段测试语句55555",@"content",
                                  @"2015-10-15",@"createDateStr",
                                  @"110",@"cellHeight",
                                  @"5",@"supportSum",
                                  @"565244831",@"userid",
                                  @"107519825",@"evaluateId",
                                  nil];
    self.myDataArr = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
}

- (void)addView{

    self.commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 62) style:UITableViewStylePlain];
    self.commentTableView.delegate = self;
    self.commentTableView.dataSource = self;
//    self.commentTableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.commentTableView];

    NSLog(@"%f",self.view.frame.size.height);


    //文本框背景
    _editBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-106, self.view.frame.size.width, 42)];
    _editBgView.backgroundColor =[UIColor whiteColor];
//    _editBgView.userInteractionEnabled = YES;
//    _editBgView.hidden = YES;
    [self.view addSubview:_editBgView];

//    StarView=[[RatingView alloc] initWithFrame:CGRectMake(54, 6+2, 200, 20)];
//    StarView.span=5;
//    StarView.type=1;
//    [StarView setImagesDeselected:@"starda_k.png" partlySelected:@"" fullSelected:@"starda_f.png" andDelegate:self];
//    StarView.hidden=YES;
//    [editBgView addSubview:StarView];

//    _mylabel = [[UILabel alloc] initWithFrame:CGRectMake(6, 5+2, 74, 25)];
//    _mylabel.backgroundColor = [UIColor clearColor];
//    _mylabel.font = [UIFont systemFontOfSize:14];
//    _mylabel.textAlignment = NSTextAlignmentLeft;
//    _mylabel.text = @"给星星:";
//    [_mylabel setTextColor:[UIColor darkGrayColor]];
////    _mylabel.hidden=YES;
//    [_editBgView addSubview:_mylabel];

    _TextView= [[UITextView alloc] initWithFrame:CGRectMake(6, _editBgView.frame.size.height-36, 248+10+40, 28)];
    _TextView.backgroundColor = [UIColor whiteColor];
    _TextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _TextView.layer.borderWidth = 1;
    _TextView.returnKeyType = UIReturnKeyDone;
    _TextView.delegate = self;
    _placeholder.text = @"请输入评论内容";
    _TextView.tag = 1005;
    [_editBgView addSubview:_TextView];


    _placeholder = [[UILabel alloc] initWithFrame:CGRectMake(10, _editBgView.frame.size.height-36, 248+10+40, 28)];
    _placeholder.backgroundColor = [UIColor clearColor];
    _placeholder.font = [UIFont systemFontOfSize:13];
    _placeholder.textAlignment = NSTextAlignmentLeft;
    _placeholder.text = @"请输入评论内容";
    [_placeholder setTextColor:[UIColor lightGrayColor]];
    [_editBgView addSubview:_placeholder];

    _submitBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _submitBt.frame = CGRectMake(260+55, _editBgView.frame.size.height-37, 45, 30);
    [_submitBt setImage:[UIImage imageNamed:@"submit.png"] forState:UIControlStateNormal];
//    [submitBt addTarget:self action:@selector(SubmitComment) forControlEvents:UIControlEventTouchUpInside];
    [_editBgView addSubview:_submitBt];

    _cancelBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBt.frame = CGRectMake(170, 60, 80, 26);
    [_cancelBt setBackgroundImage:[UIImage imageNamed:@"tt_101.png"] forState:UIControlStateNormal];
    [_cancelBt setTitle:@"取 消" forState:UIControlStateNormal];
    _cancelBt.titleLabel.font = [UIFont systemFontOfSize:12];
//    [cancelBt addTarget:self action:@selector(CancelEdit) forControlEvents:UIControlEventTouchUpInside];
//    _cancelBt.hidden = YES;
    [_editBgView addSubview:_cancelBt];

//    _EventBtu = [UIButton buttonWithType:UIButtonTypeCustom];
//    _EventBtu.frame = CGRectMake(250, 400, 60, 60);
//    _EventBtu.hidden=YES;
//    [_EventBtu setBackgroundImage:[UIImage imageNamed:@"comment.png"] forState:UIControlStateNormal];
////    [EventBtu addTarget:self action:@selector(EventButtonSelector) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_EventBtu];

}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommentCell *cell = [self.commentTableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }


    NSDictionary *dic = [self.myDataArr objectAtIndex:indexPath.row];
    //名字
    cell.nameLabel.text = [dic objectForKey:@"name"];
    //内容
    cell.contentLabel.text = [dic objectForKey:@"content"];
    cell.contentLabel.numberOfLines = 0;
    CGSize size = [cell.contentLabel.text sizeWithFont:cell.contentLabel.font constrainedToSize:CGSizeMake(310, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    cell.contentLabel.frame = CGRectMake(30, 50, size.width, size.height);
    //赞
    NSString *SupportStr=[NSString stringWithFormat:@"赞(%@)",[dic objectForKey:@"supportSum"]];
    [cell.supportSumBtn setTitle:SupportStr forState:UIControlStateNormal];
    cell.supportSumBtn.frame = CGRectMake(20, 60+size.height, 100, 30);

    //日期
    cell.dataLabel.text = [dic objectForKey:@"createDateStr"];
    cell.dataLabel.frame = CGRectMake(280, 62+size.height, 90, 30);

    cell.lineImage.frame = CGRectMake(20, 94+size.height, self.view.frame.size.width - 20, 1);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    NSDictionary *dic = [self.myDataArr objectAtIndex:indexPath.row];
    NSString *contentString = [dic objectForKey:@"content"];

    CGSize size = [contentString sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(310, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];


    return 95 + size.height;
}


@end

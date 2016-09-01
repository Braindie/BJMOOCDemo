//
//  CommentViewCtrl.h
//  QimuDemo
//
//  Created by sniper_yj on 15/12/15.
//  Copyright © 2015年 ll. All rights reserved.
//

#import "BaseViewController.h"

@interface CommentViewCtrl : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>{

    int myStarNum;


}

@property (nonatomic ,strong) UIImageView *editBgView;//评论框背景
@property (nonatomic ,strong) UIView *starView;//填星星小视图

@property (nonatomic ,strong)    UITextField *textField;

@property (nonatomic ,strong)    UIButton *submitBt;

@property (nonatomic ,strong)    UIImageView *textBgView;

@property (nonatomic ,strong)    UIButton *cancelBt;
@property (nonatomic ,strong)    UIButton *starBt;

@property (nonatomic ,strong)    UIButton *EventBtu;//评论按钮

@property (nonatomic ,strong)    UIButton *BgBut;

@property (nonatomic ,strong)    UITextView *TextView;

@property (nonatomic ,strong)    UILabel *mylabel;

@property (nonatomic ,strong)    UILabel *placeholder;








@property (nonatomic ,strong) UITableView *commentTableView;


@property (nonatomic ,strong) NSArray *myDataArr;
@end

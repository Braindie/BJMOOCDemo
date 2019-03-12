//
//  BJFMDBViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/12.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJFMDBViewController.h"
#import "UserModel.h"

@interface BJFMDBViewController ()

@end

@implementation BJFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"FMDB";
    self.isCustomBack = YES;
    
    UserModel *model = [[UserModel alloc] init];
    model.pk = 1;
    model.name = @"李四";
    model.sex = @"18";
    model.mobile = @"110";
    model.detail = @"新签名";
    
    NSArray *arr = @[model];
    
//    BOOL isSave = [UserModel saveObjects:arr];
//    if (isSave) {
//        NSLog(@"保存成功");
//    }else{
//        NSLog(@"保存失败");
//    }
    
    
    //通过主键更新    model.pk = 1;
    BOOL isSave = [UserModel updateObjects:arr];
    if (isSave) {
        NSLog(@"更新成功");
    }else{
        NSLog(@"更新失败");
    }
//    UPDATE Person SET Address = 'Zhongshan 23', City = 'Nanjing'
//    WHERE LastName = 'Wilson'
    
    
    
    //全部查找
//    NSArray *array = [UserModel findByCriteria:@""];

    //条件查找
//    NSArray *array = [UserModel findByCriteria:@"WHERE name='张三'"];
//    NSArray *array = [UserModel findByCriteria:@"WHERE pk=1"];

//    NSLog(@"%@",array);
    
    
    
    //通过主键删除    model.pk = 1;
//    [UserModel deleteObjects:arr];
    //清空表
//    [UserModel clearTable];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

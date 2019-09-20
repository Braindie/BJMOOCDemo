//
//  FourthVM.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FourthVM.h"
#import "FourthCell.h"
#import "FourthModel.h"


@implementation FourthVM

// 请求数据
- (void)requestDataComplete:(void (^)(BOOL))completeBlock{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.model = [[FourthModel alloc] init];
        self.model.name = @"名称";
        self.model.price = @"价格";
        self.model.discount = @"折扣";
        completeBlock(YES);
    });
}

// 传递数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FourthCell"];
    if (cell == nil) {
        cell = [[FourthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FourthCell"];
    }
    if (self.model) {
        cell.label.text = [NSString stringWithFormat:@"%@---%@---%@",self.model.name,self.model.price,self.model.discount];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s",__func__);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end

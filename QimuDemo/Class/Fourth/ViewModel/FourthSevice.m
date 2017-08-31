//
//  FourthSevice.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FourthSevice.h"
#import "FourthCell.h"
#import "FourthModel.h"


//static NSString *identifer = @"FourthCell";

@implementation FourthSevice

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FourthCell"];
    if (cell == nil) {
        cell = [[FourthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FourthCell"];
    }
    cell.label.text = [NSString stringWithFormat:@"%@---%@---%@",self.viewModel.name,self.viewModel.price,self.viewModel.discount];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s",__func__);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



@end

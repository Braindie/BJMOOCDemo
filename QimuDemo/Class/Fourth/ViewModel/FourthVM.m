//
//  FourthVM.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FourthVM.h"



@implementation FourthVM

- (id)initWithName:(NSString *)name price:(NSString *)price discount:(NSString *)discount{
    if (self = [super init]) {
        _name = name;
        _price = price;
        _discount = discount;
        [self chuliModel];
    }
    return self;
}

- (void)chuliModel{
    
    self.name = @"处理后的name";
}

@end

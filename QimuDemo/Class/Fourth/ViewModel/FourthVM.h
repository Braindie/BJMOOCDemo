//
//  FourthVM.h
//  QimuDemo
//
//  Created by zhangwenjun on 16/8/10.
//  Copyright © 2016年 ll. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FourthVM : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *discount;

- (id)initWithName:(NSString *)name price:(NSString *)price discount:(NSString *)discount;

@end

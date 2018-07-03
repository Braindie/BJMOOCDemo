//
//  LiverModel.h
//  QimuDemo
//
//  Created by zhangwenjun on 17/6/2.
//  Copyright © 2017年 ll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiverCreatorModel.h"

@interface LiverModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, copy) NSString *PlayerBigImg;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *countryDetailsUrl;


//推流地址
@property (nonatomic, strong) NSString *stream_addr;

@property (nonatomic, strong) LiverCreatorModel *creator;

@end

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

//推流地址
@property (nonatomic, strong) NSString *stream_addr;

@property (nonatomic, strong) LiverCreatorModel *creator;

//                 city = "\U676d\U5dde\U5e02";
//                 creator =             {
//                     gender = 0;
//                     id = 51514994;
//                     level = 19;
//                     nick = "jessie\U6709\U4e00\U9897\U5c0f\U9152\U7a9d";
//                     portrait = "http://img2.inke.cn/MTQ5NTk1MDk0NDYzMiM0NTgjanBn.jpg";
//                 };
//                 extra =             {
//                     cover = "<null>";
//                     label =                 (
//                                              {
//                                                  cl =                         (
//                                                                                0,
//                                                                                216,
//                                                                                201,
//                                                                                1
//                                                                                );
//                                                  "tab_key" = "\U6c14\U8d28";
//                                                  "tab_name" = "\U6c14\U8d28";
//                                              },
//                                              {
//                                                  cl =                         (
//                                                                                0,
//                                                                                216,
//                                                                                201,
//                                                                                1
//                                                                                );
//                                                  "tab_key" = "\U6e05\U7eaf";
//                                                  "tab_name" = "\U6e05\U7eaf";
//                                              },
//                                              {
//                                                  cl =                         (
//                                                                                0,
//                                                                                216,
//                                                                                201,
//                                                                                1
//                                                                                );
//                                                  "tab_key" = "\U6027\U611f";
//                                                  "tab_name" = "\U6027\U611f";
//                                              },
//                                              {
//                                                  cl =                         (
//                                                                                0,
//                                                                                216,
//                                                                                201,
//                                                                                1
//                                                                                );
//                                                  "tab_key" = "\U676d\U5dde\U5e02";
//                                                  "tab_name" = "\U676d\U5dde\U5e02";
//                                              }
//                                              );
//                 };
//                 group = 0;
//                 id = 1496381044910272;
//                 landscape = 0;
//                 like =             (
//                 );
//                 link = 0;
//                 "live_type" = "";
//                 multi = 0;
//                 name = "\U8fdb\U6765\U522b\U6f5c\U6c34\Uff0c\U676d\U5dde\U6709\U4e00\U70b9\U70ed";
//                 "online_users" = 32014;
//                 optimal = 0;
//                 rotate = 0;
//                 "share_addr" = "http://mlive13.inke.cn/share/live.html?uid=51514994&liveid=1496381044910272&ctime=1496381044";
//                 slot = 5;
//                 "stream_addr" = "http://pull4.a8.com/live/1496381044910272.flv?ikHost=ws&ikOp=1&codecInfo=8192";
//                 version = 0;
//             },

@end

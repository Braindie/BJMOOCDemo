//
//  BunnyCollectionView.h
//  QimuDemo
//
//  Created by zhangwenjun on 17/5/9.
//  Copyright © 2017年 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BunnyCollectionView;

#pragma mark - datasource
@protocol BunnyCollectionViewDataSource <NSObject>

//@required
//- (void)collectionView:(BunnyCollectionView *)bunnyView itemFromArray:(NSArray *)array;
- (NSArray *)arrayInCollectionView:(BunnyCollectionView *)view;

//@optional
//- (void *)currentSelectedItem:(id *)model;

@end


#pragma mark - delegate

@protocol BunnyCollectionViewDelegate <NSObject>

- (void)currentSelectedItem:(NSString *)model;

@end



@interface BunnyCollectionView : UIView
@property (nonatomic, weak) id<BunnyCollectionViewDelegate> delegate;
@property (nonatomic, weak) id<BunnyCollectionViewDataSource> dataSource;


@end

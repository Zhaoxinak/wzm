//
//  BaseTableViewController.h
//  ZXProject
//
//  Created by Mr.X on 2016/11/30.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController


@property(nonatomic, strong)ZXTableView *tableView;
@property (nonatomic, getter=isLoading) BOOL loading;

#pragma mark - 重置数据
-(void)loadNewData;
#pragma mark - 加载数据
-(void)loadMoreData;
#pragma mark - 结束刷新
-(void)endRefresh;
#pragma mark - 模拟加载延迟 结束刷新
-(void)setDelayEndRefreshing;

@end

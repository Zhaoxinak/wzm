//
//  SegmentedViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

@interface SegmentedViewController : BaseViewController

@property(nonatomic, retain)UISegmentedControl *seg;
@property(nonatomic, retain)ZXScrollView *pageScrollView;
@property(nonatomic, retain)ZXTableView *lefttableView;
@property(nonatomic, retain)ZXTableView *rightTableView;


@end

//
//  PersonalSegViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"
#import "LLSegmentedControl.h"

@interface PersonalSegViewController : BaseViewController

@property(nonatomic, retain)LLSegmentedControl *seg;
@property(nonatomic, retain)ZXScrollView *pageScrollView;
@property(nonatomic, retain)ZXTableView *onetableView;
@property(nonatomic, retain)ZXTableView *twoTableView;
@property(nonatomic, retain)ZXTableView *threetableView;
@property(nonatomic, retain)ZXTableView *fourTableView;


@end

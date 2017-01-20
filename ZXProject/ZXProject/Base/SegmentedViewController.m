//
//  SegmentedViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>




@end

@implementation SegmentedViewController



#pragma mark -设置seg
- (UISegmentedControl *)seg
{
    if (_seg == nil) {
        _seg = [[UISegmentedControl alloc] initWithItems:@[@"", @""]];
        _seg.frame = CGRectMake(0, 0, 150, 30);
        _seg.backgroundColor = [UIColor clearColor];
        _seg.tintColor = [UIColor whiteColor];
        _seg.selectedSegmentIndex = 0;
         [_seg addTarget:self action:@selector(viewChangeAction:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _seg;
}


#pragma mark -设置tableView
- (ZXScrollView *)pageScrollView
{
    if (_pageScrollView == nil) {
        _pageScrollView = [[ZXScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight)];
        _pageScrollView.contentSize = CGSizeMake(2 * kScreen_Width, 0);
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.delegate = self;
        
        
    }
    return _pageScrollView;
}


#pragma mark -设置tableView
- (ZXTableView *)lefttableView
{
    if (_lefttableView == nil) {
        _lefttableView = [[ZXTableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight)];
        _lefttableView.delegate = self;
        _lefttableView.dataSource = self;
        _lefttableView.separatorStyle = NO;
        _lefttableView.backgroundColor = [UIColor clearColor];
        
    }
    return _lefttableView;
}

#pragma mark -设置tableView
- (ZXTableView *)rightTableView
{
    if (_rightTableView == nil) {
        _rightTableView = [[ZXTableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight)];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.separatorStyle = NO;
        _rightTableView.backgroundColor = [UIColor clearColor];
        
    }
    return _rightTableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = BGColor;
   
}


#pragma mark -切换tableview

- (void)viewChangeAction: (UISegmentedControl *)seg {
    switch (seg.selectedSegmentIndex) {
        case 0: {
            self.pageScrollView.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 1: {
            self.pageScrollView.contentOffset = CGPointMake(kScreen_Width, 0);
        }
            break;
        default:
            break;
    }
    [self changeCurrentPage:seg.selectedSegmentIndex];
}

- (void)changeCurrentPage:(NSInteger)index {
    switch (index) {
        case 0:{
            self.seg.selectedSegmentIndex = 0;
            [self loadLeftTableViewData];
        }
            break;
            
        case 1:{
            self.seg.selectedSegmentIndex = 1;
            [self loadRightTableViewData];
        }
            break;
        default:
            break;
    }
}


-(void)loadLeftTableViewData{
    
    
}

-(void)loadRightTableViewData{
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.lefttableView || scrollView == self.rightTableView) {
        return;
    }
    CGFloat offset = scrollView.contentOffset.x;
    NSLog(@"%f", offset);
    if (offset >= kScreen_Width / 2) {
        [self changeCurrentPage:1];
    } else {
        [self changeCurrentPage:0];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

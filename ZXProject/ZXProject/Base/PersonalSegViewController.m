//
//  PersonalSegViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PersonalSegViewController.h"

@interface PersonalSegViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


@end

@implementation PersonalSegViewController

#pragma mark -设置seg
- (LLSegmentedControl *)seg{
    
    if (_seg == nil) {
      
        _seg = [[LLSegmentedControl alloc]init];
        _seg.backgroundColor = [UIColor whiteColor];
        _seg.segmentedControlLineStyle = LLSegmentedControlStyleUnderline;
        _seg.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthFixed;
        _seg.lineWidthEqualToTextWidth = YES;
        _seg.textColor = OneTextColor;
        _seg.selectedTextColor = TwoTextColor;
        _seg.font = [UIFont systemFontOfSize:14];
        _seg.selectedFont = [UIFont boldSystemFontOfSize:14];
        _seg.lineColor = TwoTextColor;
        _seg.lineHeight = 3.f;
        // segmentedControlTitleSpacingStyle 属性设置为 LLSegmentedControlTitleSpacingStyleWidthFixed
        // 则不需要设置titleSpacing，只需要设置titleWidth即可
        _seg.defaultSelectedIndex = 0;
        [_seg segmentedControlSelectedWithBlock:^(LLSegmentedControl *segmentedControl, NSInteger selectedIndex) {
            NSLog(@"selectedIndex : %zd", selectedIndex);
            [self viewChangeAction:_seg selectedIndex:selectedIndex];
            
        }];
    }
    return _seg;
    
    
    
}

#pragma mark -设置tableView
- (ZXScrollView *)pageScrollView
{
    if (_pageScrollView == nil) {
        _pageScrollView = [[ZXScrollView alloc] init];
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.delegate = self;
        
        
    }
    return _pageScrollView;
}


#pragma mark -设置tableView
- (ZXTableView *)onetableView
{
    if (_onetableView == nil) {
        _onetableView = [[ZXTableView alloc]init];
        _onetableView.delegate = self;
        _onetableView.dataSource = self;
        _onetableView.separatorStyle = YES;
        _onetableView.backgroundColor = [UIColor clearColor];
        
    }
    return _onetableView;
}

#pragma mark -设置tableView
- (ZXTableView *)twoTableView
{
    if (_twoTableView == nil) {
        _twoTableView = [[ZXTableView alloc]init];
        _twoTableView.delegate = self;
        _twoTableView.dataSource = self;
        _twoTableView.separatorStyle = YES;
        _twoTableView.backgroundColor = [UIColor clearColor];
        
    }
    return _twoTableView;
}

#pragma mark -设置tableView
- (ZXTableView *)threetableView
{
    if (_threetableView == nil) {
        _threetableView = [[ZXTableView alloc]init];
        _threetableView.delegate = self;
        _threetableView.dataSource = self;
        _threetableView.separatorStyle = YES;
        _threetableView.backgroundColor = [UIColor clearColor];
        
    }
    return _threetableView;
}

#pragma mark -设置tableView
- (ZXTableView *)fourTableView
{
    if (_fourTableView == nil) {
        _fourTableView = [[ZXTableView alloc]init];
        _fourTableView.delegate = self;
        _fourTableView.dataSource = self;
        _fourTableView.separatorStyle = YES;
        _fourTableView.backgroundColor = [UIColor clearColor];
        
    }
    return _fourTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BGColor;
}


#pragma mark -切换tableview

- (void)viewChangeAction: (LLSegmentedControl *)seg selectedIndex:(NSInteger)selectedIndex{
    switch (seg.selectedIndex) {
        case 0: {
            self.pageScrollView.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 1: {
            self.pageScrollView.contentOffset = CGPointMake(kScreen_Width, 0);
        }
            break;
        case 2: {
            self.pageScrollView.contentOffset = CGPointMake(kScreen_Width*2, 0);
        }
            break;
        case 3: {
            self.pageScrollView.contentOffset = CGPointMake(kScreen_Width*3, 0);
        }
            break;
        default:
            break;
    }
    [self changeCurrentPage:seg.selectedIndex];
}

- (void)changeCurrentPage:(NSInteger)index {
    switch (index) {
        case 0:{
           
            [self.seg segmentedControlSetSelectedIndex:0];
            [self loadOneTableViewData];
        }
            break;
            
        case 1:{
            [self.seg segmentedControlSetSelectedIndex:1];
            [self loadTwoTableViewData];
        }
            break;
        case 2:{
            [self.seg segmentedControlSetSelectedIndex:2];
            [self loadThreeTableViewData];
        }
            break;
        case 3:{
            [self.seg segmentedControlSetSelectedIndex:3];
            [self loadFourTableViewData];
        }
            break;
        default:
            break;
    }
}


-(void)loadOneTableViewData{
    
    
}

-(void)loadTwoTableViewData{
    
    
}

-(void)loadThreeTableViewData{
    
    
}

-(void)loadFourTableViewData{
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   
    if(scrollView == self.pageScrollView) {
        
        self.onetableView.scrollEnabled = YES;
        self.twoTableView.scrollEnabled = YES;
        self.threetableView.scrollEnabled = YES;
        self.fourTableView.scrollEnabled = YES;
        
    }
    
    
    if (scrollView == self.onetableView || scrollView == self.twoTableView || scrollView == self.threetableView || scrollView == self.fourTableView) {
        return;
    }
    CGFloat offset = scrollView.contentOffset.x;
    NSLog(@"%f", offset);
    
    if (offset >= kScreen_Width / 2+ 2*kScreen_Width) {
        [self changeCurrentPage:3];
    }else
    if (offset >= kScreen_Width / 2+ kScreen_Width) {
        [self changeCurrentPage:2];
    }else
    if (offset >= kScreen_Width / 2) {
        [self changeCurrentPage:1];
    } else {
        [self changeCurrentPage:0];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if(scrollView == self.pageScrollView) {
        
        self.onetableView.scrollEnabled = NO;
        self.twoTableView.scrollEnabled = NO;
        self.threetableView.scrollEnabled = NO;
        self.fourTableView.scrollEnabled = NO;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

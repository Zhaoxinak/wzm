//
//  MapViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"
#import <MAMapKit/MAMapKit.h>

@class MapViewController;
@protocol MapViewControllerDelegate <NSObject>

@optional
- (void)selectAddress:(NSString *)address andProvince:(NSString *)province andCity:(NSString *)city andArea:(NSString *)area andLocation:(CLLocationCoordinate2D)coord inView:(MapViewController *)view;

@end

@interface MapViewController : BaseViewController

@property (weak , nonatomic) id<MapViewControllerDelegate> delegate;

@property (nonatomic, copy) NSString *targetName;
@property (nonatomic, copy) NSString *targetAddress;



@property (nonatomic, assign) NSInteger currentAnnotionIndex;

@property (nonatomic, strong) MAPointAnnotation *xl_annotation;//搜索结果位置大头针
@property (nonatomic, strong) UIImageView *xl_centerImageView;
@property (nonatomic, assign) BOOL isClickedSearch;//是否已经点击搜索按钮
@property (nonatomic, assign) NSInteger selectedIndex;//选中的cell
@property (nonatomic, copy) NSString *searchStr;
@property (nonatomic, assign) BOOL isSureAddress;//是否已经点击确认按钮
@property (nonatomic, assign) BOOL isMoveByUser;
@property (nonatomic, assign) BOOL isSearchByBtn;//是否是点击搜索按钮的搜索

@property (nonatomic, copy) NSString *currentLocationAddress;
@property (nonatomic, copy) NSString *currentLocationCity;

/**
 *  传入的坐标
 */
@property (nonatomic, assign) CLLocationCoordinate2D location;


@end

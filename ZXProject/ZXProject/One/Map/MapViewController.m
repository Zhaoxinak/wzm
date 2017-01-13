//
//  MapViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MAMapViewDelegate,AMapSearchDelegate,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

/**
 *  高德地图view
 */
@property (nonatomic, strong) MAMapView *mapView;
//高德地图定位
@property (nonatomic, strong) AMapLocationManager *locationManager;
//高德地图逆编码
@property (nonatomic, strong) AMapSearchAPI *AMapSearch;
/**
 *  选择位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D targetCoordinate;


@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UITableView *searchResultTableview;

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSMutableArray *searchList;

@property (nonatomic, strong) UIButton *hideBtn;

@property (nonatomic, strong) MAPointAnnotation *selectPoint;

@property (nonatomic, strong) AMapPOIAroundSearchRequest *searchRequest;


@end

@implementation MapViewController

- (NSMutableArray *)searchList {
    if (_searchList == nil) {
        _searchList = [NSMutableArray array];
    }
    return _searchList;
}

- (void)map_keyboardWillShow:(NSNotification *)noti {
    self.hideBtn.hidden = NO;
}

- (void)map_keyboardWillHidden:(NSNotification *)noti {
    self.hideBtn.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    self.searchRequest = request;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(map_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(map_keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    self.dataList = [NSMutableArray array];
    // Do any additional setup after loading the view.
    [self setupVars];
    [self setupViews];
}

- (void)hideAction {
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    self.isSearchByBtn = YES;
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    //发起输入提示搜索
    AMapInputTipsSearchRequest *tipsRequest = [[AMapInputTipsSearchRequest alloc] init];
    tipsRequest.keywords = self.searchBar.text;
    //    tipsRequest.city = self.currentLocationCity;
    NSLog(@"当前所在城市--%@ 地址--%@", self.currentLocationCity, self.currentLocationAddress);
    [self.AMapSearch AMapInputTipsSearch: tipsRequest];
    self.searchStr = searchText;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.searchBar resignFirstResponder];
    self.isSearchByBtn = YES;
    AMapPOIAroundSearchRequest *request = self.searchRequest;
    request.location = [AMapGeoPoint locationWithLatitude:self.location.latitude longitude:self.location.longitude];
    request.keywords = self.searchBar.text;
    request.radius = 1000;
    request.sortrule = 0;
    request.requireExtension = YES;
    self.searchRequest = request;
    NSLog(@"location=%f  longitude=%f", self.location.latitude, self.location.longitude);
    [self.AMapSearch AMapPOIAroundSearch:request];
}
//实现POI搜索对应的回调函数
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if(response.pois.count == 0)
    {
        return;
    }
    if (!self.isSearchByBtn) {
        AMapPOI *poi = response.pois[0];
        [self.dataList removeAllObjects];
        [self.dataList addObject:poi];
        self.searchBar.text = poi.address;
        
        self.location = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
        
        [self configSelectMapView];
        
        [self.searchResultTableview reloadData];
        return;
    }
    //通过 AMapPOISearchResponse 对象处理搜索结果
    [self.dataList removeAllObjects];
    for (AMapPOI *p in response.pois) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@\nPOI: %@,%@", p.description,p.name,p.address]);
        //搜索结果存在数组
        [self.dataList addObject:p];
    }
    self.isClickedSearch = YES;
    [self.searchResultTableview reloadData];
}
//实现输入提示的回调函数
-(void)onInputTipsSearchDone:(AMapInputTipsSearchRequest*)request response:(AMapInputTipsSearchResponse *)response
{
    if(response.tips.count == 0)
    {
        return;
    }
    if (!self.isSearchByBtn) {
        AMapTip *poi = response.tips[0];
        [self.searchList removeAllObjects];
        [self.searchList addObject:poi];
        self.searchBar.text = poi.address;
        
        self.location = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
        
        [self configSelectMapView];
        
        [self.searchResultTableview reloadData];
        return;
    }
    //通过AMapInputTipsSearchResponse对象处理搜索结果
    
    //先清空数组
    [self.searchList removeAllObjects];
    for (AMapTip *p in response.tips) {
        
        //把搜索结果存在数组
        
        [self.searchList addObject:p];
    }
    
    AMapTip *poi = response.tips[0];
    self.location = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
    _targetCoordinate.latitude = poi.location.latitude;
    _targetCoordinate.longitude = poi.location.longitude;
    
    
    self.isClickedSearch = NO;
    //刷新表格
    [self.searchResultTableview reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isClickedSearch) {
        return self.dataList.count;
    }
    return self.searchList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AMapPOI *poi = nil;
    if (self.isClickedSearch) {
        poi = _dataList[indexPath.row];
    } else {
        poi = _searchList[indexPath.row];
    }
    
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude) animated:YES];
    
    self.selectedIndex = indexPath.row;
    
    [self.searchResultTableview reloadData];
    
    self.searchBar.text = [NSString stringWithFormat:@"%@", poi.name];
    _targetCoordinate = self.mapView.centerCoordinate                         ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64*WIDTH_NIT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *flag=@"CELL";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:flag];
    }
    AMapPOI *poi = nil;
    if (self.isClickedSearch) {
        poi = self.dataList[indexPath.row];
    } else {
        poi = self.searchList[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = poi.name;
    
    cell.detailTextLabel.text = poi.address;
    
    NSString *searchStr = self.searchStr == nil ? self.searchBar.text : self.searchStr;
    
    
    NSRange range = [poi.name rangeOfString:searchStr];
    
    [cell.textLabel setColorWithRange:range withColor:[UIColor py_colorWithHexString:@"f1a31b"]];
    
    
    
    if (indexPath.row == self.selectedIndex) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup methods
- (void)setupVars {
    _locationManager = [[AMapLocationManager alloc] init];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    _AMapSearch = [[AMapSearchAPI alloc] init];
    _AMapSearch.delegate = self;
}

- (void)setupViews {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"确认详细地址";
    self.isSureAddress = NO;
    self.isMoveByUser = NO;
    self.isSearchByBtn = NO;
    
    
        self.searchResultTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreen_Height / 2-64, kScreen_Width, kScreen_Height / 2) style:UITableViewStylePlain];
        self.searchResultTableview.tableHeaderView = [UIView new];
        self.searchResultTableview.dataSource = self;
        self.searchResultTableview.delegate = self;
        [self.view addSubview:self.searchResultTableview];
        
        self.hideBtn = [UIButton new];
        self.hideBtn.frame = self.view.bounds;
        self.hideBtn.hidden = YES;
        self.hideBtn.backgroundColor = [UIColor clearColor];
        [self.hideBtn addTarget:self action:@selector(hideAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.hideBtn];
        
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 5*WIDTH_NIT, kScreen_Width, 50*WIDTH_NIT)];
        self.searchBar.delegate = self;
        self.searchBar.placeholder = @"搜索周边";
        self.searchBar.returnKeyType = UIReturnKeySearch;
        [self.view addSubview:self.searchBar];
    
    
    [self setupMapView];
    [self setupNaviItem];
}


- (void)mapView:(MAMapView *)mapView didTouchPois:(NSArray *)pois {
    //    if (pois.count > 0) {
    //        MATouchPoi *poi = pois[0];
    //        NSLog(@"%@", poi.name);
    //        self.searchBar.text = poi.name;
    //        [UIView animateWithDuration:1 animations:^{
    //            _mapView.centerCoordinate = poi.coordinate;
    //            self.touchImageView.center = _mapView.center;
    //        }];
    //
    //    }
}

- (void)getLocationByAddress:(NSString *)oreillyAddress {
    CLGeocoder *myGeocoder = [[CLGeocoder alloc] init];
    [myGeocoder geocodeAddressString:oreillyAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0 && error == nil) {
            NSLog(@"Found %lu placemark(s).", (unsigned long)[placemarks count]);
            CLPlacemark *firstPlacemark = [placemarks objectAtIndex:0];
            NSLog(@"Longitude = %f", firstPlacemark.location.coordinate.longitude);
            NSLog(@"Latitude = %f", firstPlacemark.location.coordinate.latitude);
        }
        else if ([placemarks count] == 0 && error == nil) {
            NSLog(@"Found no placemarks.");
        } else if (error != nil) {
            NSLog(@"An error occurred = %@", error);
        }
    }];
}

- (void)updateAnnotation:(CLLocationCoordinate2D)coordinate {
    
    
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    self.searchBar.text = @"定位中...";
    [clGeoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude] completionHandler: ^(NSArray *placemarks,NSError *error) {
        for (CLPlacemark *placeMark in placemarks)
        {
            NSDictionary *addressDic=placeMark.addressDictionary;
            
            NSString *state=[addressDic objectForKey:@"State"];
            NSString *city=[addressDic objectForKey:@"City"];
            NSString *subLocality=[addressDic objectForKey:@"SubLocality"];
            NSString *street=[addressDic objectForKey:@"Street"];
            
            NSLog(@"%@", street);
            
            self.searchBar.text = [NSString stringWithFormat:@"%@%@", subLocality,street];
        }
        
    }];
    
    _targetCoordinate = coordinate;
}

- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate {
    //    [self updateAnnotation:coordinate];
}

- (void)setupMapView {
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/2)];
   
    _mapView.delegate = self;
    _targetCoordinate = _mapView.centerCoordinate;
    _mapView.zoomLevel = 18;
    _mapView.maxZoomLevel = 19;
    _mapView.showsBuildings = NO;
    
    
    /**
     * @brief 罗盘原点位置
     */
    //@property (nonatomic) CGPoint compassOrigin;
    /**
     * @brief 比例尺原点位置
     */
    //@property (nonatomic) CGPoint scaleOrigin;
    [self.view addSubview:_mapView];
    
    self.isSearchByBtn = NO;
    NSDictionary *currentDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"location_map"];
    
    if (currentDic) {
        NSString *currentDistrict = currentDic[@"district"];
        
        NSString *latitude = currentDic[@"latitude"];
        NSString *longitude = currentDic[@"longitude"];
        
        self.location = CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
        
        AMapPOI *poi = [AMapPOI new];
        poi.name = currentDic[@"poiName"];
        poi.address = currentDic[@"formattedAddress"];
        [self.searchList removeAllObjects];
        [self.searchList addObject:poi];
        
        self.searchBar.text = poi.address;
        
        [self configSelectMapView];
        
        [self searchBarSearchButtonClicked:self.searchBar];
        
    } else {
        AMapInputTipsSearchRequest *tipsRequest = [[AMapInputTipsSearchRequest alloc] init];
        tipsRequest.keywords = self.currentLocationAddress;
        tipsRequest.city = self.currentLocationCity;
        [self.AMapSearch AMapInputTipsSearch: tipsRequest];
    }
    
    self.xl_centerImageView = [UIImageView new];
    self.xl_centerImageView.frame = CGRectMake(0, 0, 47, 56);
    self.xl_centerImageView.image = [UIImage imageNamed:@"img_selectlocation"];
    self.xl_centerImageView.center = self.mapView.center;
    [self.view addSubview:self.xl_centerImageView];
    
    
    UIButton *locationBtn = [UIButton new];
    [locationBtn setImage:[UIImage imageNamed:@"img_current_location"] forState:UIControlStateNormal];
    [locationBtn addTarget:self action:@selector(locationBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    locationBtn.frame = CGRectMake(screenWidth() - 44*WIDTH_NIT - 13*WIDTH_NIT, maxY(self.mapView) - 44*WIDTH_NIT - 13*WIDTH_NIT - 64, 44*WIDTH_NIT, 44*WIDTH_NIT);
    [self.view addSubview:locationBtn];
    
    if (self.searchBar) {
        [self.view bringSubviewToFront:self.searchBar];
    }
}

- (void)locationBtnAction:(UIButton *)btn {
    [self updateAnnotation:self.location];
    [self.mapView setCenterCoordinate:self.location animated:YES];
}

- (void)configSelectMapView {
    
    [self.mapView setCenterCoordinate:self.location animated:YES];
}




- (void)setupNaviItem {
    UIButton *leftBackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 21)];
    [leftBackButton setImage:[UIImage imageNamed:@"nav_left_arrow"] forState:UIControlStateNormal];
    [leftBackButton addTarget:self action:@selector(navBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBackButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, 0, 50, 30);
    confirmButton.clipsToBounds = YES;
    confirmButton.layer.cornerRadius = 4;
    confirmButton.layer.borderColor = [UIColor whiteColor].CGColor;
    confirmButton.layer.borderWidth = 1.0f;
    [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];
    self.navigationItem.rightBarButtonItem = confirmItem;
}

#pragma mark - action
- (void)navBackAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirmAction {
  
    self.isSureAddress = YES;
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    
    regeo.location                    = [AMapGeoPoint locationWithLatitude:_targetCoordinate.latitude
                                                                 longitude:_targetCoordinate.longitude];
    regeo.requireExtension            = YES;
    [_AMapSearch AMapReGoecodeSearch:regeo];
}
#pragma mark - MAMap Delegate
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    _targetCoordinate = mapView.centerCoordinate;
  
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    
    regeo.location                    = [AMapGeoPoint locationWithLatitude:_targetCoordinate.latitude
                                                                 longitude:_targetCoordinate.longitude];
    regeo.requireExtension            = YES;
    [_AMapSearch AMapReGoecodeSearch:regeo];
    
}

- (void)mapView:(MAMapView *)mapView mapWillMoveByUser:(BOOL)wasUserAction {
    self.isMoveByUser = wasUserAction;
    [self.view endEditing:YES];
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode.formattedAddress.length > 0)
    {
        if (self.isSureAddress) {
            // 点击确认按钮后的搜索
            if ([_delegate respondsToSelector:@selector(selectAddress:andProvince:andCity:andArea:andLocation:inView:)]) {
                
                
                NSString *province = response.regeocode.addressComponent.province;
                NSString *city = response.regeocode.addressComponent.city;
                if ([NSString isEmpty:city]) {
                    city = response.regeocode.addressComponent.province;
                }
                
                [_delegate selectAddress:[NSString stringWithFormat:@"%@", response.regeocode.formattedAddress] andProvince:province andCity: city andArea:response.regeocode.addressComponent.district andLocation:_targetCoordinate inView:self];
                
                
                NSDictionary *locationDic = @{@"latitude":@(_targetCoordinate.latitude),
                                              @"longitude":@(_targetCoordinate.longitude),
                                              @"poiName": self.searchBar.text,
                                              @"formattedAddress": [NSString stringWithFormat:@"%@", response.regeocode.formattedAddress]
                                              };
                [[NSUserDefaults standardUserDefaults] setValue:locationDic forKey:@"location_map"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //            self.searchBar.text = response.regeocode.formattedAddress;
                self.searchBar.text = [NSString stringWithFormat:@"%@%@%@", response.regeocode.addressComponent.township, response.regeocode.addressComponent.streetNumber.street, response.regeocode.addressComponent.streetNumber.number];
                
                self.isSearchByBtn = YES;
                AMapPOIAroundSearchRequest *request = self.searchRequest;
                request.location = [AMapGeoPoint locationWithLatitude:_targetCoordinate.latitude longitude:_targetCoordinate.longitude];
                request.keywords = [NSString stringWithFormat:@"%@%@", response.regeocode.addressComponent.township, response.regeocode.addressComponent.streetNumber.street];
                request.radius = 5000;
                request.sortrule = 0;
                request.requireExtension = YES;
                NSLog(@"location=%f  longitude=%f", self.location.latitude, self.location.longitude);
                [self.AMapSearch AMapPOIAroundSearch:request];
            });
        }
        
    }
}

- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response {
    
    if (response.geocodes.count == 0) {
        NSDictionary *locationDic = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"location"];
        NSNumber *lat = locationDic[@"latitude"];
        NSNumber *lng = locationDic[@"longitude"];
        if ([lat doubleValue] > 0 && [lng doubleValue] > 0) {
            _location = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
        }else {
            _location = CLLocationCoordinate2DMake(29.5640213741, 106.5428222877);
        }
    } else {
        AMapGeocode *geo = response.geocodes[0];
        //self.searchBar.text = [NSString stringWithFormat:@"%@%@%@", geo.city, geo.district, geo.township];
        self.searchBar.text = geo.formattedAddress;
        self.location = CLLocationCoordinate2DMake(geo.location.latitude, geo.location.longitude);
        self.targetCoordinate = self.location;
    }
    [self configSelectMapView];
    
}
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error {
    
    
    NSDictionary *locationDic = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"location"];
    NSNumber *lat = locationDic[@"latitude"];
    NSNumber *lng = locationDic[@"longitude"];
    if ([lat doubleValue] > 0 && [lng doubleValue] > 0) {
        _location = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
    }else {
        _location = CLLocationCoordinate2DMake(29.5640213741, 106.5428222877);
    }
    [self configSelectMapView];
    
    
//    [self.dataList removeAllObjects];
//    [self.searchResultTableview reloadData];
}
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view didChangeDragState:(MAAnnotationViewDragState)newState
   fromOldState:(MAAnnotationViewDragState)oldState {
    switch (newState) {
        case MKAnnotationViewDragStateStarting: {
            NSLog(@"拿起");
            return;
        }
        case MKAnnotationViewDragStateDragging: {
            NSLog(@"开始拖拽");
            return;
        }
        case MKAnnotationViewDragStateEnding: {
            NSLog(@"放下,并将大头针");
            CLLocationCoordinate2D destCoordinate=view.annotation.coordinate;
            [self updateAnnotation:destCoordinate];
            return;
        }
        default:
            return;
    }
}

//添加标注

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    NSString *reuseIndetifier = [NSString stringWithFormat:@"anno%ld", (long)self.currentAnnotionIndex++];//防止起点大头针被重用
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        
        
        if (annotation == self.xl_annotation) {
            
            MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
            
            if (annotationView == nil) {
                
                annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
                annotationView.image = [UIImage imageNamed:@"img_selectlocation"];
                annotationView.draggable = NO;
            }
            
            return annotationView;
        }
        
    
        
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        
        if (annotationView == nil) {
            
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
            annotationView.image = [UIImage imageNamed:@"img_selectlocation"];
            annotationView.draggable = NO;
        }
        
        return annotationView;
    }
    return nil;
}



- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    NSLog(@"select");
   
    self.searchBar.text = [NSString stringWithFormat:@"%@", [(MAPointAnnotation *)view.annotation subtitle]];
    _targetCoordinate = [(MAPointAnnotation *)view.annotation coordinate];
    
}

- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view {
    NSLog(@"cancel selec");
}

#define IS_SystemVersionGreaterThanEight  ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)



@end

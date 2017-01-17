//
//  PublishPartyViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "PublishPartyViewController.h"
#import "MapViewController.h" //地图
/************V************/
#import "AddPartyTableViewCell.h" //cell视图
#import "AddPicturesCell.h" //添加图片
/************M************/
#import "AddPartyDataModel.h"  //上传数据
#import "AddPartyCellModel.h"  //cell数据
#import "AddPictureModel.h"    //图片数据

@interface PublishPartyViewController ()<MapViewControllerDelegate,AddPicturesCellDelegate,UIImagePickerControllerDelegate,QBImagePickerControllerDelegate,UINavigationControllerDelegate>


//cell数据源
@property (nonatomic, strong) NSArray *dataArray0;
//cell数据源
@property (nonatomic, strong) NSArray *dataArray2;
//时间选择器
@property (nonatomic, strong) UIDatePicker *datePicker;
//修改中的model
@property (nonatomic, strong) AddPartyCellModel *model;
//格式转换器
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
//选择器出现时点击收回用view
@property (nonatomic, strong) UIView *pickerShadowView;
//添加数据模型
@property (nonatomic, strong) AddPartyDataModel *dataModel;
//时间确定按钮
@property (nonatomic, strong) UIButton *commitTimeBtn;


@end

@implementation PublishPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDatas];
    
    [self setupViews];
    
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    if (_picArray.count) {
//        [_tableView reloadData];
//    }
//}

#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
}



#pragma mark - setup method
//初始化数据源
- (void)setupDatas {
    
    _picArray = [NSMutableArray array];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分"];
    
    _dataModel = [[AddPartyDataModel alloc] init];
    
    NSNumber *userId = [ZXLoginModel sharedZXLoginModel].userId;
    
    _dataModel.creatorid = [NSString stringWithFormat:@"%@",userId ? userId : @""];
    
    [self setupAddData];
   
    [self setupCellModels];
    
}

- (void)setupAddData {
 
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"location"];
    
    // 经纬度
    double longitude = [dic[@"longitude"] doubleValue];
    NSString *lon = [NSString stringWithFormat:@"%f", longitude];
    
    double latitude = [dic[@"latitude"] doubleValue];
    NSString *lat = [NSString stringWithFormat:@"%f", latitude];
    
    NSString *province = dic[@"province"];
    NSString *city = dic[@"city"];
    if ([NSString isEmpty:city]) {
        city = dic[@"province"]?: @"";
    }
    NSString *district = dic[@"district"]?: @"";
    NSString *township = dic[@"township"]?: @"";
    NSString *street = dic[@"street"]?: @"";
    NSString *number = dic[@"number"]?: @"";
    
    
    if (![NSString isEmpty:lon] && ![NSString isEmpty:lat] && ![NSString isEmpty:city] && ![NSString isEmpty:district] && ![NSString isEmpty:township] ) {
        
        NSString *address = [NSString stringWithFormat:@"%@%@%@%@%@",city, district, township, street, number];
        
        _dataModel.address = address;
        _dataModel.longitude = lon;
        _dataModel.latitude = lat;
        _dataModel.province = province;
        _dataModel.city = city;
        _dataModel.area = district;
        
    }

    
}

- (void)setupCellModels {
  
    
    AddPartyCellModel *nameCell = [[AddPartyCellModel alloc] init];
    nameCell.titleText = @"活动主题";
    nameCell.placeHolderText = @"请输入活动主题";
    nameCell.fullScreenSeperateLine = YES;
    nameCell.selectType = AddPartyCellTypeTextField;
    
    AddPartyCellModel * joinTimeCell = [[AddPartyCellModel alloc] init];
    joinTimeCell.titleText = @"报名时间";
    joinTimeCell.showDownArrow = YES;
    joinTimeCell.fullScreenSeperateLine = YES;
    joinTimeCell.selectType = AddPartyCellTypeTime;
    
    AddPartyCellModel * partyTimeCell = [[AddPartyCellModel alloc] init];
    partyTimeCell.titleText = @"活动时间";
    partyTimeCell.showDownArrow = YES;
    partyTimeCell.fullScreenSeperateLine = YES;
    partyTimeCell.selectType = AddPartyCellTypeTime;
    
    
    
    AddPartyCellModel *addressCell = [[AddPartyCellModel alloc] init];
    addressCell.titleText = @"活动位置";
    addressCell.placeHolderText = @"请选择详细地址";
    addressCell.showDownArrow = YES;
    addressCell.fullScreenSeperateLine = YES;
    addressCell.selectType = AddPartyCellTypeMap;
    addressCell.detailText = _dataModel.address;
    
    
    AddPartyCellModel *typeCell = [[AddPartyCellModel alloc] init];
    typeCell.titleText = @"活动类型";
    typeCell.placeHolderText = @"选择活动类型";
    typeCell.showDownArrow = YES;
    typeCell.fullScreenSeperateLine = YES;
    typeCell.selectType = AddPartyCellTypeStyle;
    
    AddPartyCellModel *costCell = [[AddPartyCellModel alloc] init];
    costCell.titleText = @"活动费用";
    costCell.placeHolderText = @"请填写活动费用";
    costCell.fullScreenSeperateLine = YES;
    costCell.selectType = AddPartyCellTypeCost;
    
    
    AddPartyCellModel *phoneCell = [[AddPartyCellModel alloc] init];
    phoneCell.titleText = @"联系电话";
    phoneCell.detailText = @"";
    phoneCell.placeHolderText = @"请输入电话";
    phoneCell.fullScreenSeperateLine = YES;
    phoneCell.selectType = AddPartyCellTypePhone;
    
    
    AddPartyCellModel *numLimitCell = [[AddPartyCellModel alloc] init];
    numLimitCell.titleText = @"名额限制";
    numLimitCell.detailText = @"";
    numLimitCell.placeHolderText = @"默认无限制人数";
    numLimitCell.selectType = AddPartyCellTypeNumLimit;
    
    
    _dataArray0 = @[nameCell];
    _dataArray2 = @[joinTimeCell,partyTimeCell,addressCell,typeCell,costCell,phoneCell,numLimitCell];


}


- (void)setupViews {

    //初始化导航
    [self setupNaviItem];
    //初始化表视图
    [self setupTableView];
    //初始化时间选择器
    [self setupDatePicker];
    //蒙版
    [self setupPickerBlockView];
}

- (void)setupNaviItem {
    self.title = @"发起活动";
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, 0, 56, 30);
    [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize:14];
    confirmButton.layer.borderColor = [UIColor whiteColor].CGColor;
    confirmButton.layer.borderWidth = 1.;
    confirmButton.layer.cornerRadius = 4;
    [confirmButton setTitle:@"提交" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];
    self.navigationItem.rightBarButtonItem = confirmItem;
    
}

- (void)setupTableView {
    
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height - kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
}

- (void)setupDatePicker {
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216)];
    _datePicker.backgroundColor = [UIColor whiteColor];
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [_datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_datePicker];
    _datePicker.hidden = YES;
    
}

#pragma mark --picker确定按钮
-(void)commitTimeBtn:(UIButton *)button{
    [self hideDatePicker];
    NSDate *date = _datePicker.date;
    _model.detailText = [_dateFormatter stringFromDate:date];
    if (self.isJoinTime) {
        _dataModel.joinTime = _model.detailText;
    } else {
        _dataModel.partyTime = _model.detailText;
    }
    [self.tableView reloadData];
    
}


-(void)setupPickerBlockView{
    
    _pickerShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - 216)];
    UITapGestureRecognizer *tapForHidePicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDatePicker)];
    [_pickerShadowView addGestureRecognizer:tapForHidePicker];
    [self.view addSubview:_pickerShadowView];
    _pickerShadowView.hidden = YES;
    

    [_commitTimeBtn removeFromSuperview];
    _commitTimeBtn = [[UIButton alloc]initWithFrame:CGRectMake(_pickerShadowView.width-80, _pickerShadowView.height - 44, 80, 40)];
    _commitTimeBtn.hidden = YES;
    [_commitTimeBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_commitTimeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_commitTimeBtn addTarget:self action:@selector(commitTimeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_pickerShadowView addSubview:_commitTimeBtn];
    
    
    
   }


#pragma mark - private
- (BOOL)needCompleteInfo {
    return !_dataModel.name.length || !_dataModel.area.length || !_dataModel.city.length || !_dataModel.province.length || !_dataModel.address || !_dataModel.type.length || !_dataModel.phone.length;
}

- (void)setupDataForAddParty {
    NSDictionary *param = [_dataModel modelToJSONObject];
    [self sendRequestId:ZXInterfaceAddParty rMethod:POSTMethod params:param];
}

- (NSString *)picJsonString {
    NSMutableArray *picDicArray = [[NSMutableArray alloc] init];
    for (AddPictureModel *model in _picArray) {
        NSDictionary *picDic = @{@"url"         : model.picUrl ? model.picUrl : @"",
                                 @"description" : model.desString ? model.desString : @"",
                                 @"pictype"     : model.resType ? model.resType : @""
                                 };
        [picDicArray addObject:picDic];
    }
    NSData *jsData = [NSJSONSerialization dataWithJSONObject:picDicArray options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsData encoding:NSUTF8StringEncoding];
}


#pragma mark - action

- (void)hideKeyBoard {
    [self.view endEditing:YES];
}

- (void)showDatePicker {
    _datePicker.hidden = NO;
    _pickerShadowView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, kScreen_Height - 216 - 44, kScreen_Width, 216) ;
    } completion:^(BOOL finished) {
        _commitTimeBtn.hidden = NO;
    }];
}

- (void)hideDatePicker {
    _commitTimeBtn.hidden = YES;
    _pickerShadowView.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216) ;
    } completion:^(BOOL finished) {
        _datePicker.hidden = YES;
    }];
  
}

- (void)datePickerValueChange:(UIDatePicker *)datePicker {
    NSDate *date = datePicker.date;
    _model.detailText = [_dateFormatter stringFromDate:date];
    if (self.isJoinTime) {
        _dataModel.joinTime = _model.detailText;
    } else {
        _dataModel.partyTime = _model.detailText;
    }
    [self.tableView reloadData];
    
}



- (void)selectPhotoFromSource {
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"请选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self turnToCameraAndTakePhoto];
    }];
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self turnToAlbumAndSelectPhotos];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [actionController addAction:photo];
    [actionController addAction:album];
    [actionController addAction:cancel];
    
    [self presentViewController:actionController animated:YES completion:nil];
}

- (void)turnToCameraAndTakePhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picker.allowsEditing = YES;
    picker.videoQuality = UIImagePickerControllerQualityTypeLow;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:^{
    }];
}

- (void)turnToAlbumAndSelectPhotos {
    NSInteger maxNum = 5 - _picArray.count;
    if (maxNum>0) {
        
        QBImagePickerController *imagePicker = [[QBImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.showsNumberOfSelectedAssets = YES;
        imagePicker.allowsMultipleSelection = YES;
        imagePicker.maximumNumberOfSelection = maxNum;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else{
        ALERTTK(@"提示", @"最多添加5张图片");
    }
}

- (void)showNeedInfoCompleteAlert {
    UIAlertController *infoAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"需要完善信息!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [infoAlert addAction:cancel];
    [self presentViewController:infoAlert animated:YES completion:nil];
}

- (void)confirmAction {
   
    //主题名字
    AddPartyCellModel *nameModel = _dataArray0[0];
    nameModel.detailText = [nameModel.detailText stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (nameModel.detailText.length) {
        _dataModel.name = nameModel.detailText;
    }
 
    //主题类型
    AddPartyCellModel *typeModel = _dataArray2[3];
    typeModel.detailText = [typeModel.detailText stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (typeModel.detailText.length) {
        _dataModel.type = typeModel.detailText;
    }
    
    
    //报名费用
    AddPartyCellModel *costModel = _dataArray2[4];
    costModel.detailText = [costModel.detailText stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (costModel.detailText.length) {
        _dataModel.cost = costModel.detailText;
    }
    
    //主题电话
    AddPartyCellModel *phoneModel = _dataArray2[5];
    phoneModel.detailText = [phoneModel.detailText stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (phoneModel.detailText.length) {
        _dataModel.cost = phoneModel.detailText;
    }
    
    //人数限制
    AddPartyCellModel *numLimitModel = _dataArray2[6];
    numLimitModel.detailText = [numLimitModel.detailText stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (numLimitModel.detailText.length) {
        _dataModel.cost = numLimitModel.detailText;
    }

   
    if ([self needCompleteInfo]) {
        [self showNeedInfoCompleteAlert];
        return;
    }
    
  

    NSMutableArray *image = [[NSMutableArray alloc] init];
    if (_picArray.count) {
        for (AddPictureModel *model in _picArray) {
            [image addObject:model.addImage];
        }
        [self uploadImages:image];
    }else {
        [self setupDataForAddParty];
    }
}


#pragma mark - UIImagePicker delegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (image) {
        AddPictureModel *picModel = [[AddPictureModel alloc] init];
        picModel.addImage = image;
        [picker dismissViewControllerAnimated:YES completion:^{
        [_picArray addObjectsFromArray:@[picModel]];
            
        }];
    }else {
        [picker dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

#pragma mark - QBImagePicker delegate
- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {
    //do something
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
}

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets {
    NSMutableArray *selectImage = [[NSMutableArray alloc] init];
    for (ALAsset *asset in assets) {
        // 从asset中获得图片
        UIImage *result = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
        AddPictureModel *picModel = [[AddPictureModel alloc] init];
        picModel.addImage = result;
        [selectImage addObject:picModel];
    }
    
    [imagePickerController dismissViewControllerAnimated:YES completion:^{
       [_picArray addObjectsFromArray:selectImage];
        [self.tableView reloadData];
    }];
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _dataArray0.count;
    }else
    if (section == 2) {
        return _dataArray2.count;
    }else{
        return 1;
    }
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 2) {
        return 49.f;
    } else
    if (indexPath.section == 1) {
        return [AddPicturesCell caculateAddPicturesCellHeightWithPictureArray:_picArray];
    }else{
        return 0;
    }
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AddPartyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPartyTableViewCell0"];
        if (!cell) {
            cell = [[AddPartyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddPartyTableViewCell0"];
            
        }
        
        cell.detailText.keyboardType = UIKeyboardTypeDefault;
        cell.cellModel = _dataArray0[indexPath.row];
        return cell;
    }else
    if (indexPath.section == 1) {
        AddPicturesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addPicturesCell"];
        if (!cell) {
            cell = [[AddPicturesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addPicturesCell"];
            cell.delegate = self;
        }
        [cell setEditing:NO animated:YES];
        cell.picArray = _picArray;
        return cell;
    }else
    {
        AddPartyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPartyTableViewCell2"];
        if (!cell) {
            cell = [[AddPartyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddPartyTableViewCell2"];
        }
                
        cell.detailText.keyboardType = UIKeyboardTypeDefault;
        cell.cellModel = _dataArray2[indexPath.row];
        return cell;
    }
    
    
    
}


#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    if (indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2) {
        
        AddPartyCellModel *model;
        switch (indexPath.section) {
            case 0:
                model = _dataArray0[indexPath.row];
                break;
            case 2:
                model = _dataArray2[indexPath.row];
                break;
            default:
                break;
        }
        
        switch (model.selectType) {
            case AddPartyCellTypeTime:
            {
                AddPartyTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                if ([cell.cellModel.titleText isEqualToString:@"报名时间"]) {
                    self.isJoinTime = YES;
                    if (![NSString isEmpty:_dataModel.joinTime]) {
                        _datePicker.date = [_dateFormatter dateFromString:_dataModel.joinTime];
                    }
                    
                    
                } else {
                    self.isJoinTime = NO;
                    if (![NSString isEmpty:_dataModel.partyTime]) {
                        _datePicker.date = [_dateFormatter dateFromString:_dataModel.partyTime];
                    }
                }
                _model = model;
                [self showDatePicker];
            }
                break;
            case AddPartyCellTypeMap:
            {
            
                _model = model;
                MapViewController *mapView = [[MapViewController alloc] init];
                mapView.delegate = self;
                [self.navigationController pushViewController:mapView animated:YES];
                break;
            }
                
            case AddPartyCellTypeStyle:
            {
                _model = model;
               
                
                break;
            }
            
            default:
                break;
        }
    }
}


#pragma mark - UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self hideKeyBoard];
}

#pragma mark - mapView delegate
- (void)selectAddress:(NSString *)address andProvince:(NSString *)province andCity:(NSString *)city andArea:(NSString *)area andLocation:(CLLocationCoordinate2D)coord inView:(MapViewController *)view{
    _model.detailText = address;
    _dataModel.longitude = [NSString stringWithFormat:@"%f", coord.longitude];
    _dataModel.latitude = [NSString stringWithFormat:@"%f", coord.latitude];
    _dataModel.province = province;
    _dataModel.city = city;
    _dataModel.area = area;
    _dataModel.address = address;
    [self.tableView reloadData];
    
    
}



#pragma mark - PLAddPicturesCellDelegate
- (void)addButtonClick:(UIButton *)sender inCell:(AddPicturesCell *)cell {
    [self selectPhotoFromSource];
    
}

- (void)delePicClick:(UIButton *)sender inCell:(AddPicturesCell *)cell {
    
    NSLog(@"%ld",(long)sender.tag);
    [_picArray removeObjectAtIndex:sender.tag-1000];
    [self.tableView reloadData];
    
}

#pragma mark - network method
- (void)handleData:(id)data byRequestId:(NSInteger)requestId {
   
    if (requestId == ZXInterfaceUploadPic) {
        [self handleUploadPicturesSucceedData:data];
    }else if (requestId == ZXInterfaceAddParty) {
        
        NSString *message = data[@"message"];
        if (![NSString isEmpty:message] && [message containsString:@"已存在"]) {
            ALERTTK(@"提示", message);
            return;
        }
        
        
    }
}

- (void)handleError:(id)error byRequestId:(NSInteger)requestId {
    ALERTTK(nil, error[@"message"]);
}


- (void)handleUploadPicturesSucceedData:(id)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSArray *urlArray = data[@"data"][@"URLS"];
        if (urlArray.count == _picArray.count) {
            for (int i = 0; i < urlArray.count; i++) {
                NSString *imageName = [NSString stringWithFormat:@"pic%d", i];
                NSString *url = urlArray[i][imageName];
                AddPictureModel *model = _picArray[i];
                model.picUrl = url;
            }
        }
    }
    NSString *picJson = [self picJsonString];
    _dataModel.restaurantPic = picJson;
    [self setupDataForAddParty];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

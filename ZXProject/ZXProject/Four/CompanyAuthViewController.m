//
//  CompanyAuthViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "CompanyAuthViewController.h"
/************V************/
#import "AddPartyTableViewCell.h" //cell视图
#import "AddAuthPicturesCell.h" //添加图片
/************M************/
#import "AddAuthDataModel.h"  //上传数据
#import "AddPartyCellModel.h"  //cell数据
#import "AddPictureModel.h"    //图片数据

@interface CompanyAuthViewController ()<AddAuthPicturesCellCellDelegate,UIImagePickerControllerDelegate,QBImagePickerControllerDelegate,UINavigationControllerDelegate>

//cell数据源
@property (nonatomic, strong) NSArray *dataArray0;
//cell数据源
@property (nonatomic, strong) NSArray *dataArray1;
//修改中的model
@property (nonatomic, strong) AddPartyCellModel *model;
//添加数据模型
@property (nonatomic, strong) AddAuthDataModel *dataModel;
//上传图片数组
@property (nonatomic, strong) NSMutableArray *picArray;
//记录点击图片的index
@property (nonatomic, assign) NSInteger picIndex;

@end

@implementation CompanyAuthViewController

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
    
    _dataModel = [[AddAuthDataModel alloc] init];
    
    
    [self setupAddData];
    
    [self setupCellModels];
    
}

- (void)setupAddData {
    
    NSNumber *userId = [ZXLoginModel sharedZXLoginModel].userId;
    
    _dataModel.creatorid = [NSString stringWithFormat:@"%@",userId ? userId : @""];
    
}

- (void)setupCellModels {
    
    
    AddPartyCellModel *companyCell = [[AddPartyCellModel alloc] init];
    companyCell.titleText = @"公司名称";
    companyCell.placeHolderText = @"填写公司名称";
    companyCell.placeHolderLeft = YES;
    companyCell.fullScreenSeperateLine = YES;
    companyCell.selectType = AddPartyCellTypeTextField;
    
    AddPartyCellModel *managerCell = [[AddPartyCellModel alloc] init];
    managerCell.titleText = @"法人姓名";
    managerCell.placeHolderText = @"填写法人姓名";
    managerCell.placeHolderLeft = YES;
    managerCell.fullScreenSeperateLine = YES;
    managerCell.selectType = AddPartyCellTypeTextField;
    
  
    AddPartyCellModel *phoneCell = [[AddPartyCellModel alloc] init];
    phoneCell.titleText = @"法人电话";
    phoneCell.placeHolderText = @"请输入电话";
    phoneCell.placeHolderLeft = YES;
    phoneCell.fullScreenSeperateLine = YES;
    phoneCell.selectType = AddPartyCellTypePhone;
    
    
    AddPictureModel *companyPic = [[AddPictureModel alloc]init];
    companyPic.desString = @"营业执照";
    
    AddPictureModel *frontPic = [[AddPictureModel alloc]init];
    frontPic.desString = @"身份证正面";
    
    AddPictureModel *backPic = [[AddPictureModel alloc]init];
    backPic.desString = @"身份证背面";
    
  
    _dataArray0 = @[companyCell,managerCell,phoneCell];
    _dataArray1 = @[companyPic,frontPic,backPic];
    
}


- (void)setupViews {
    
    //初始化导航
    [self setupNaviItem];
    //初始化表视图
    [self setupTableView];
    
}

- (void)setupNaviItem {
    self.title = @"技师认证";
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, 0, 56, 30);
    [confirmButton setTitleColor:KNavigationTitleColor forState:UIControlStateNormal];
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
    
    QBImagePickerController *imagePicker = [[QBImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.showsNumberOfSelectedAssets = YES;
    imagePicker.allowsMultipleSelection = YES;
    imagePicker.maximumNumberOfSelection = 1;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
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
        AddPictureModel *picModel = _dataArray1[_picIndex];
        picModel.addImage = image;
        [picker dismissViewControllerAnimated:YES completion:^{
            
            [self.tableView reloadData];
            
            
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
    
    // 从asset中获得图片
    ALAsset *asset = assets[0];
    UIImage *result = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
    AddPictureModel *picModel = _dataArray1[_picIndex];
    picModel.addImage = result;
    
    [imagePickerController dismissViewControllerAnimated:YES completion:^{
        [self.tableView reloadData];
    }];
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _dataArray0.count;
    }else{
        return _dataArray1.count;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
        return 49.f;
    } else{
        return AddAuthPicturesCell_Height;
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
    }else{
        
        AddAuthPicturesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddAuthPicturesCell"];
        if (!cell) {
            cell = [[AddAuthPicturesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddAuthPicturesCell"];
            cell.delegate = self;
        }
        
        AddPictureModel *model = _dataArray1[indexPath.row];
        [cell setPicModel:model index:indexPath.row];
        
        return cell;
        
    }
    
    
}


#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
   
    
    
    
}


#pragma mark - UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self hideKeyBoard];
}


#pragma mark - PLAddPicturesCellDelegate
- (void)addButtonClick:(UIButton *)sender inCell:(AddAuthPicturesCell *)cell {
    _picIndex = sender.tag;
    [self selectPhotoFromSource];
    
}

- (void)delePicClick:(UIButton *)sender inCell:(AddAuthPicturesCell *)cell {
    
    NSLog(@"%ld",(long)sender.tag);
    AddPictureModel *model = _dataArray1[sender.tag-100];
    model.addImage = nil;
    
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

//
//  PublishUnderstandingViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "PublishUnderstandingViewController.h"
#import "CarsSelectedViewController.h" //车型选择
/************V************/
#import "AddPartyTableViewCell.h" //cell视图
#import "AddPicturesCell.h" //添加图片
/************M************/
#import "AddUnderstandingDataModel.h"  //上传数据
#import "AddPartyCellModel.h"  //cell数据
#import "AddPictureModel.h"    //图片数据

@interface PublishUnderstandingViewController ()<AddPicturesCellDelegate, UIImagePickerControllerDelegate, QBImagePickerControllerDelegate, UINavigationControllerDelegate>

//cell数据源
@property (nonatomic, strong) NSArray *dataArray0;
//修改中的model
@property (nonatomic, strong) AddPartyCellModel *model;
//添加数据模型
@property (nonatomic, strong) AddUnderstandingDataModel *dataModel;

@end

@implementation PublishUnderstandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDatas];
    
    [self setupViews];
}

#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
}

#pragma mark - setup method
//初始化数据源
- (void)setupDatas {
    
    _picArray = [NSMutableArray array];
    
    _dataModel = [[AddUnderstandingDataModel alloc] init];
    
    NSNumber *userId = [ZXLoginModel sharedZXLoginModel].userId;
    
    _dataModel.creatorid = [NSString stringWithFormat:@"%@",userId ? userId : @""];
    
    
    [self setupCellModels];
    
}

- (void)setupCellModels {
    
    AddPartyCellModel *typeCell = [[AddPartyCellModel alloc] init];
    typeCell.titleText = @"车型选择";
    typeCell.showDownArrow = YES;
    typeCell.placeHolderText = @"";
    typeCell.fullScreenSeperateLine = YES;
    typeCell.selectType = AddPartyCellTypeStyle;
    
    
    AddPartyCellModel *nameCell = [[AddPartyCellModel alloc] init];
    nameCell.titleText = @"活动主题";
    nameCell.placeHolderText = @"请输入活动主题";
    nameCell.fullScreenSeperateLine = YES;
    nameCell.selectType = AddPartyCellTypeTextField;
    
    _dataArray0 = @[typeCell, nameCell];
    
}


- (void)setupViews {
    
    //初始化导航
    [self setupNaviItem];
    //初始化表视图
    [self setupTableView];
    
}


- (void)setupNaviItem {
    self.title = @"发布心得";
    
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
    return !_dataModel.name.length;
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
    AddPartyCellModel *nameModel = _dataArray0[1];
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
    {
        return 1;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50*WIDTH_NIT;
    } else
        if (indexPath.section == 2) {
            return [AddPicturesCell caculateAddPicturesCellHeightWithPictureArray:_picArray];
        }else{
            return 49.f;
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
        if (indexPath.section == 2) {
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
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPartyTableViewCell2"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddPartyTableViewCell2"];
            }
            
            cell.textLabel.text = @"活动描述";
            return cell;
        }
    
    
    
}


#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    if (indexPath.section == 0) {
        
        AddPartyCellModel *model;
        switch (indexPath.section) {
            case 0:
                model = _dataArray0[indexPath.row];
                break;
            default:
                break;
        }
        
        switch (model.selectType) {
                
                
            case AddPartyCellTypeStyle:
            {
                _model = model;
                
                CarsSelectedViewController *carsVC = [[CarsSelectedViewController alloc]init];
                [self.navigationController pushViewController:carsVC animated:YES];
                
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end

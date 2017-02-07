//
//  EditPersonalInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "EditPersonalInfoViewController.h"
#import "ZXUserInfoModel.h"

@interface EditPersonalInfoViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

// 性别数据源
@property (nonatomic, strong) NSArray *sexArray;
@property (nonatomic, strong) NSArray *nationsArray;

@property (nonatomic, strong) NSArray *allCityList;
@property (nonatomic, strong) NSArray *cityArray;
@property (nonatomic, strong) NSArray *areaArray;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *area;



@end

@implementation EditPersonalInfoViewController{
    
    UITextField *textField;
    UIButton *textFeildBtn; //textFeild按钮
    UIView *pickerShadowView; //选择器出现时点击收回用view
    UIPickerView *commonPicker; //选择器
    UIDatePicker *datePicker; //时间选择器
    UIButton *commitBtn; //确定按钮
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self setupData];
    //初始试图
    [self setupView];
    
    
}


#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setupData{
    
    _sexArray = [NSArray arrayWithObjects:@"男", @"女", nil];
    _nationsArray = [NSArray arrayWithObjects:@"汉族",@"蒙古族",@"回族",@"藏族",@"维吾尔族",@"苗族",@"彝族",@"壮族",@"布依族",@"朝鲜族",@"满族",@"侗族",@"瑶族",@"白族",@"土家族", @"哈尼族",@"哈萨克族",@"傣族",@"黎族",@"傈僳族",@"佤族",@"畲族",@"高山族",@"拉祜族",@"水族",@"东乡族",@"纳西族",@"景颇族",@"柯尔克孜族",@"土族",@"达斡尔族",@"仫佬族",@"羌族",@"布朗族",@"撒拉族",@"毛南族",@"仡佬族",@"锡伯族",@"阿昌族",@"普米族",@"塔吉克族",@"怒族", @"乌孜别克族",@"俄罗斯族",@"鄂温克族",@"德昂族",@"保安族",@"裕固族",@"京族",@"塔塔尔族",@"独龙族",@"鄂伦春族",@"赫哲族",@"门巴族",@"珞巴族",@"基诺族", nil];
    
    //城市数据
    [self setupAllCityList];
    
}

#pragma mark --城市数据
- (void)setupAllCityList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AllCityList" ofType:@"txt"];
    NSFileManager* fm = [NSFileManager defaultManager];
    NSData* data = [[NSData alloc] init];
    data = [fm contentsAtPath:path];
    if (data) {
        _allCityList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _cityArray = _allCityList[0][@"sub"];
        _areaArray = _cityArray[0][@"sub"];
    }
}


#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。

-(void)ZXsuccessData:(id)data byRequestId:(NSInteger)requestId{
    
    if (requestId == ZXInterfaceModifyUserInfo) {
        [self.navigationController popViewControllerAnimated:YES];
        if (![[self.navigationController viewControllers] containsObject:self]) {
            [self.delegate sendBackString:textField.text];
        }
    }
    
}


- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
    
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
    
}


#pragma mark -执行视图
#pragma mark --初始化数据视图
-(void)setupView{
    
    //设置标题
    self.title = _titleString;
    
    //确定按钮
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, 0, 56, 30);
    [confirmButton setTitleColor:KNavigationTitleColor];
    confirmButton.titleLabel.font = Font13;
    [confirmButton setTitle: @"确定" ];
    [confirmButton addTarget:self action:@selector(confirmAction:)];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];
    self.navigationItem.rightBarButtonItem = confirmItem;

    [self setupTextField];
    
    
    
}


#pragma mark --设置输入框
-(void)setupTextField{
    
    textField = [[UITextField alloc] init];
    textField.placeholder = [NSString stringWithFormat:@"请输入%@", _titleString];
    if ([_oldData isKindOfClass:[NSString class]] && _oldData.length > 0) {
        textField.text = _oldData;
    }
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(10,0,20,49)];
    leftView.backgroundColor = [UIColor clearColor];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
    textField.frame = CGRectMake(0, 10, kScreen_Width, 49);
    
    if (_type == VolkEdit ||_type == SexEdit ||_type == BrithCtiyEdit) {
        
        self.navigationItem.rightBarButtonItem = nil;
        textField.userInteractionEnabled = NO;
        [self setupCommonPicker];
        [self setupPickerBlockView];
        [self setuptextFeildBtn];
    }
    if (_type == BrithdayEdit) {
        self.navigationItem.rightBarButtonItem = nil;
        textField.userInteractionEnabled = NO;
        [self setupTimePicker];
        [self setupPickerBlockView];
        [self setuptextFeildBtn];
    }
    
}


-(void)setuptextFeildBtn{
    
    textFeildBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, textField.width, textField.height)];
    [textFeildBtn addTarget:self action:@selector(showCommonListPicker) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textFeildBtn];
    
    
}

-(void)setupCommonPicker{
    
    commonPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216)];
    commonPicker.backgroundColor = [UIColor whiteColor];
    commonPicker.delegate = self;
    commonPicker.dataSource = self;
    [self.view addSubview:commonPicker];
    commonPicker.hidden = YES;
    
}

-(void)setupTimePicker{
    
    NSDate *now = [NSDate date];
    datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216);
    datePicker.datePickerMode = UIDatePickerModeDate;
    NSDate * sss = [[NSDate alloc]initWithTimeInterval:1 sinceDate:now];
    datePicker.maximumDate = sss;
    [self.view addSubview:datePicker];
    datePicker.hidden = YES;
    
    
    
}

- (void)setupPickerBlockView {
    pickerShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - 216)];
    UITapGestureRecognizer *tapForHidePicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideCommonListPicker)];
    [pickerShadowView addGestureRecognizer:tapForHidePicker];
    [self.view addSubview:pickerShadowView];
    pickerShadowView.hidden = YES;
    
    [commitBtn removeFromSuperview];
    commitBtn = [[UIButton alloc]initWithFrame:CGRectMake(pickerShadowView.width-80, pickerShadowView.height - 44, 80, 40)];
    commitBtn.hidden = YES;
    [commitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtn:) forControlEvents:UIControlEventTouchUpInside];
    [pickerShadowView addSubview:commitBtn];
    
}


- (void)showCommonListPicker {
    commonPicker.hidden = NO;
    datePicker.hidden = NO;
    pickerShadowView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        commonPicker.frame = CGRectMake(0, kScreen_Height - 216 - 44, kScreen_Width, 216);
        datePicker.frame = CGRectMake(0, kScreen_Height - 216 - 44, kScreen_Width, 216);
    } completion:^(BOOL finished) {
        commitBtn.hidden = NO;
    }];
}

- (void)hideCommonListPicker {
    commitBtn.hidden = YES;
    pickerShadowView.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        commonPicker.frame = CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216);
        datePicker.frame = CGRectMake(0, kScreen_Height - 44, kScreen_Width, 216);
    } completion:^(BOOL finished) {
        commonPicker.hidden = YES;
        datePicker.hidden = YES;
    }];
}


#pragma mark - UIPickerView data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_type == BrithCtiyEdit){
        return 3;
    }
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (_type == SexEdit) {
        return _sexArray.count;
    }else if (_type == VolkEdit){
        return _nationsArray.count;
    }else if (_type == BrithCtiyEdit){
        if (component == 0) {
            return _allCityList.count;
        }else if (component == 1){
            return _cityArray.count;
        }else {
            return _areaArray.count;
        }
        
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (_type == 1) {
        return _sexArray[row];
    }else if (_type == 2){
        return _nationsArray[row];
    }else if (_type == 4){
        if (component == 0) {
            return _allCityList[row][@"name"];
        }else if (component == 1){
            return _cityArray[row][@"name"];
        }else {
            return _areaArray[row][@"name"];
        }
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (_type == SexEdit) {
        textField.text = [_sexArray objectAtIndex:row];
    }else if (_type == VolkEdit){
        textField.text = [_nationsArray objectAtIndex:row];
    }else if (_type == BrithCtiyEdit){
        if (component == 0) {
            _cityArray = _allCityList[row][@"sub"];
            _areaArray = _cityArray[0][@"sub"];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
        }else if (component == 1) {
            _areaArray = _cityArray[row][@"sub"];
            [pickerView reloadComponent:2];
        }
        NSString *provinceString = _allCityList[[pickerView selectedRowInComponent:0]][@"name"];
        NSString *cityString = _cityArray[[pickerView selectedRowInComponent:1]][@"name"];
        NSString *areaString = _areaArray[[pickerView selectedRowInComponent:2]][@"name"];
        _province = provinceString;
        _city = cityString;
        _area = areaString;
        
        if (!_province || !_city || !_area) {
            textField.text = @"";
        }else {
            textField.text = [NSString stringWithFormat:@"%@-%@-%@", _province, _city, _area];
        }
        
    }
    
}




#pragma mark --执行按钮
#pragma mark --picker确定按钮

-(void)commitBtn:(UIButton *)button{
    [self hideCommonListPicker];
    
    if (_type == BrithCtiyEdit) {
        
        NSString *provinceString = _allCityList[[commonPicker selectedRowInComponent:0]][@"name"];
        NSString *cityString = _cityArray[[commonPicker selectedRowInComponent:1]][@"name"];
        NSString *areaString = _areaArray[[commonPicker selectedRowInComponent:2]][@"name"];
        if (!provinceString || !cityString || !areaString) {
            textField.text = @"";
        }else {
            textField.text = [NSString stringWithFormat:@"%@-%@-%@", provinceString, cityString, areaString];
        }
        
        NSDictionary *dic = [NSDictionary dictionary];
        dic = @{@"id" : _userId ?: @"",
                @"province" : provinceString ?: @"",
                @"city" : cityString ?: @"",
                @"area" : areaString ?: @""};
        
        [self sendRequestId:ZXInterfaceModifyUserInfo rMethod:POSTMethod params:dic];
        
    }else{
        
        NSInteger row=[commonPicker selectedRowInComponent:0];
        if (_type == SexEdit) {
            textField.text = [_sexArray objectAtIndex:row];
        }else if (_type == VolkEdit){
            textField.text = [_nationsArray objectAtIndex:row];
        }else if (_type == BrithdayEdit){
            
            NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
            //实例化一个NSDateFormatter对象
            [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
            textField.text = [dateFormat stringFromDate:datePicker.date];
            
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        if (![[self.navigationController viewControllers] containsObject:self]) {
            [self.delegate sendBackString:textField.text];
        }
        
    }
}






- (void)confirmAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    if (![[self.navigationController viewControllers] containsObject:self]) {
        [self.delegate sendBackString:textField.text];
    }
}

#pragma mark setter
- (void)setOldData:(NSString *)oldData {
    _oldData = oldData;
}


- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
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

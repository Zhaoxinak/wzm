//
//  OneViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneViewController.h"
#import "TestModel.h"


@interface OneViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dataWithDiscover:YES requestId:1];
    
    //在需要使用的界面设置
    IQKeyboardReturnKeyHandler *retuenKeyHandler = [[IQKeyboardReturnKeyHandler alloc]initWithViewController:self];
    retuenKeyHandler.lastTextFieldReturnKeyType =UIReturnKeyDone; // 设置最后一个输入框
    
    
    UITextField *textField = [UITextField new];
    textField.delegate = self;
    textField.frame = CGRectMake(10, 400, kScreen_Width-20, 30);
    textField.backgroundColor = [UIColor whiteColor];
    textField.tag = 1;
    [self.view addSubview:textField];
    
    
    UITextField *textField1 = [UITextField new];
    textField1.delegate = self;
    textField1.frame = CGRectMake(10, 440, kScreen_Width-20, 30);
    textField1.backgroundColor = [UIColor whiteColor];
    textField1.tag = 2;
    [self.view addSubview:textField1];
    
    
}

#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。
- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
    if (requestId == 1) {
        TestModel *model = [[TestModel alloc] initWithData:data error:nil];
        
        if ([model.code isEqualToString:@"1"]) {
            self.dataArray = [model.data.projects copy];
            NSLog(@"%@", self.dataArray);
        }else{
            NSString *msg = model.msg;
            [self showServerMsg:msg];
        }
    }
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
 
    
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

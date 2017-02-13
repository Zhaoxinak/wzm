//
//  PublishQuestionViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PublishQuestionViewController.h"

@interface PublishQuestionViewController ()<UITextViewDelegate,UITextFieldDelegate>
{
    UITextView *contentView;
    UITextField *titleInput;
    UILabel *defaultlab;
}


@end

@implementation PublishQuestionViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = MainWhiteColor;
    
    self.title = @"发起问题";
    
    //标题
    UIView *maskView=[[UIView alloc] initWithFrame:CGRectMake(10*WIDTH_NIT,15*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 120*WIDTH_NIT)];
    maskView.layer.borderWidth = 1;
    maskView.layer.cornerRadius = 5;
    maskView.layer.borderColor = LessNameColor.CGColor;
    maskView.backgroundColor = MainWhiteColor;
    [self.view addSubview:maskView];
    
    contentView=[[UITextView alloc] initWithFrame:CGRectMake(20*WIDTH_NIT,20*WIDTH_NIT, kScreen_Width-40*WIDTH_NIT, 100*WIDTH_NIT)];
    contentView.backgroundColor=MainWhiteColor;
    contentView.textColor = NameColor;
    contentView.returnKeyType=UIReturnKeyDone;
    contentView.delegate=self;
    [self.view addSubview:contentView];
    
    defaultlab=[[UILabel alloc] initWithFrame:CGRectMake(20*WIDTH_NIT,25*WIDTH_NIT, kScreen_Width-40*WIDTH_NIT, 20*WIDTH_NIT)];
    defaultlab.text=@"简单描述下你的问题";
    defaultlab.numberOfLines = 1;
    defaultlab.font=Font12;
    defaultlab.textColor=LittleNameColor;
    [self.view addSubview:defaultlab];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //填写喵币
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(10*WIDTH_NIT,150*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT,45*WIDTH_NIT)];
    titleView.layer.borderWidth = 1;
    titleView.layer.cornerRadius = 5;
    titleView.layer.borderColor = LessNameColor.CGColor;
    titleView.backgroundColor = MainWhiteColor;
    [self.view addSubview:titleView];
    
    titleInput=[[UITextField alloc] initWithFrame:CGRectMake(20*WIDTH_NIT,0,kScreen_Width-40*WIDTH_NIT,45*WIDTH_NIT)];
    titleInput.textColor = NameColor;
    titleInput.delegate=self;
    titleInput.placeholder=@"输入获取答案需要的喵币（选填）";
    titleInput.font=Font12;
    titleInput.returnKeyType=UIReturnKeyDone;
    titleInput.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    [titleView addSubview:titleInput];
    
    
    //发布
    UIButton* publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishBtn.frame = CGRectMake(0, 0, 44, 44);
    [publishBtn setTitle:@"发布"];
    [publishBtn setTitleColor:KNavigationTitleColor];
    publishBtn.titleLabel.font = Font13;
    [publishBtn addTarget:self action:@selector(publishAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:publishBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    defaultlab.hidden=YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)publishAct:(UIButton *)button{
    
    [contentView resignFirstResponder];
    [titleInput resignFirstResponder];
    
    if ([ZXLoginModel sharedZXLoginModel].userId) {
        
        if (![contentView.text isEqualToString:@""]) {
            
            //标题
            NSString *content = contentView.text;
            //喵币
            NSString *contact = titleInput.text;
           
            
            NSString *idString = [NSString stringWithFormat:@"%@", [ZXLoginModel sharedZXLoginModel].userId];
            if ([idString isEqualToString:@"(null)"]) {
                idString = @"";
            }
            
            
            [self sendRequestId:ZXInterfaceAddUserFaceBack rMethod:POSTMethod params:@{@"content" : content, @"equipment" : @"iPhone", @"userid" : idString, @"contact" : contact}];
            
        }else{
            
            ALERTTK(nil, @"问题不能为空");
            return;
            
        }
    }else{
        
        ALERTTK(nil, @"请登录后再反馈");
    }
    
}


#pragma mark - network method
- (void)handleData:(id)data byRequestId:(NSInteger)requestId {
    if (requestId == ZXInterfaceAddUserFaceBack) {
        
        ALERTTK(nil, @"提交成功");
        contentView.text = @"";
        titleInput.text = @"";
        [self.navigationController popViewControllerAnimated:YES];
        return;
        
    }
}
- (void)handleError:(id)error byRequestId:(NSInteger)requestId {
    NSLog(@"requestId = %ld -- %@", (long)requestId, [error description]);
    if (requestId == ZXInterfaceAddUserFaceBack) {
        
        ALERTTK(nil, @"提交失败");
        return;
    }
}



//正在编辑时
- (void)textViewDidChange:(UITextView *)textView
{
    
    NSInteger number = [textView.text length];
    
    if (number > 200) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"最多不能超过200个汉字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        textView.text = [textView.text substringToIndex:200];
        number = 400;
        
    }
    
    
}


@end

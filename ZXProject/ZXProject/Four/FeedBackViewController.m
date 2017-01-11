//
//  FeedBackViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()<UITextViewDelegate,UITextFieldDelegate>
{
    UITextView *contentView;
    UITextField *titleInput;
    UILabel *defaultlab;
}


@end

@implementation FeedBackViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"意见反馈";
 
    
    UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(10,10+10+120, kScreen_Width-20,50)];
    titleView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:titleView];
    
    titleInput=[[UITextField alloc] initWithFrame:CGRectMake(20,0,kScreen_Width-40,50)];
    titleInput.delegate=self;
    titleInput.placeholder=@"邮箱/QQ/电话";
    titleInput.font=[UIFont systemFontOfSize:14.0];
    titleInput.returnKeyType=UIReturnKeyDone;
    [titleView addSubview:titleInput];
    
    
    UIView *maskView=[[UIView alloc] initWithFrame:CGRectMake(10,10, kScreen_Width-20, 120)];
    maskView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:maskView];
    
    contentView=[[UITextView alloc] initWithFrame:CGRectMake(20,20, kScreen_Width-40, 100)];
    contentView.backgroundColor=[UIColor whiteColor];
    contentView.layer.borderColor=[UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0].CGColor;
    contentView.returnKeyType=UIReturnKeyDone;
    contentView.delegate=self;
    [self.view addSubview:contentView];
    
    defaultlab=[[UILabel alloc] initWithFrame:CGRectMake(20,25, kScreen_Width-40, 60)];
    defaultlab.text=@"请在这里填写您的建议或意见";
    defaultlab.numberOfLines = 3;
    defaultlab.font=[UIFont systemFontOfSize:14.0];
    defaultlab.textColor=ThreeTextColor;
    [self.view addSubview:defaultlab];
    
    //提交按钮
    UIButton *submitBut=[[UIButton alloc] initWithFrame:CGRectMake(10,titleView.frame.origin.y+titleView.frame.size.height+20,self.view.frame.size.width-20, 40)];
    submitBut.backgroundColor=OneTextColor;
    [submitBut setTitle:@"提交" forState:UIControlStateNormal];
    submitBut.layer.cornerRadius=5;
    submitBut.layer.masksToBounds=YES;
    [submitBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBut addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBut];
    
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

-(void)submit{
    
    [contentView resignFirstResponder];
    [titleInput resignFirstResponder];
    
    if ([ZXLoginModel sharedZXLoginModel].userId) {
        
        if (![contentView.text isEqualToString:@""] &&![titleInput.text isEqualToString:@""]) {
            
            //【其他】意见反馈
            NSString *content = contentView.text;
            //【其他】联系方式
            NSString *contact = titleInput.text;
            //当前版本
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            // app版本
            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            
            NSString *idString = [NSString stringWithFormat:@"%@", [ZXLoginModel sharedZXLoginModel].userId];
            if ([idString isEqualToString:@"(null)"]) {
                idString = @"";
            }
            
         
            [self sendRequestId:ZXInterfaceAddUserFaceBack rMethod:POSTMethod params:@{@"content" : content, @"equipment" : @"iPhone", @"version" : app_Version, @"userid" : idString, @"contact" : contact}];
            
        }else{
            
            ALERTTK(nil, @"反馈内容和联系方式不能为空");
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

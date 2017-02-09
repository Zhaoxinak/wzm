//
//  CustomNaviController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "CustomNaviController.h"

@interface CustomNaviController ()

@end

@implementation CustomNaviController

//第一次使用这个类的时候调用1次
+ (void)initialize
{
    // 设置UINavigationBarTheme
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}


//设置UINavigationBarTheme主题
+ (void)setupNavigationBarTheme {
    
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = KNavigationTitleColor;
//    textAttrs[NSBackgroundColorAttributeName] = KNavigationBGColor;
    textAttrs[NSFontAttributeName] = KNavigationFont;
    textAttrs[NSShadowAttributeName] = [[NSShadow alloc] init];
    
    [appearance setTitleTextAttributes:textAttrs];
    [appearance setBackgroundImage:[ZXTools createImageWithColor:KNavigationBGColor] forBarMetrics:UIBarMetricsDefault];
    [appearance setTintColor:KNavigationTitleColor];
    
}

//设置UIBarButtonItem的主题
+ (void)setupBarButtonItemTheme
{
    
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    
    
    // 设置可用状态(able)的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,Font16,NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    
    // 设置不可用状态(disable)的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,Font16,NSFontAttributeName,nil] forState:UIControlStateDisabled];
    /**自定义导航控制器返回按钮设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //自定义返回按钮
    
//    UIImage *backButtonImage = [[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
//    [appearance setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
  
    
    //    //将返回按钮的文字position设置不在屏幕上显示
  
    [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [appearance setTintColor:[UIColor whiteColor]];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 判断是否为栈底控制器
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //设置导航子控制器按钮的加载样式
        UINavigationItem *vcBtnItem= [viewController navigationItem];
        
        UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.frame = CGRectMake(0, 0, 60, 40);
        leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //将leftItem设置为自定义按钮
        UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: leftBtn];
        vcBtnItem.leftBarButtonItem = leftItem;
        
    }
    
    [super pushViewController:viewController animated:YES];
    
    viewController.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    viewController.navigationController.interactivePopGestureRecognizer.enabled = YES;
    viewController.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end

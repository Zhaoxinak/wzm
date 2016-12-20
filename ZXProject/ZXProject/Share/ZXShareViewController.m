//
//  ZXShareViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "ZXShareViewController.h"

@interface ZXShareViewController ()<
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout,
    MFMessageComposeViewControllerDelegate
>

//阴影View
@property (nonatomic, strong) UIView *shadowView;

@property (nonatomic, strong) UIView *shareView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ZXShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupVars];
    
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark setup method
- (void)setupVars {
    
    BOOL weixinIsInstall = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]];
    BOOL qqIsInstall = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
    BOOL weiboIsInstall = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibo://"]];
    
    if (weixinIsInstall) {
        [self.dataSource addObject:@{@"img":@"icon_wx_friend", @"title":@"微信好友",@"type":@(ZXShareChannelWeChatFriend)}];
        [self.dataSource addObject:@{@"img":@"icon_wx_circle", @"title":@"微信朋友圈",@"type":@(ZXShareChannelWechatTimeLine)}];
    }
    if (qqIsInstall) {
        [self.dataSource addObject:@{@"img":@"icon_qq_friend", @"title":@"QQ好友",@"type":@(ZXShareChannelQQFriend)}];
        [self.dataSource addObject:@{@"img":@"icon_qzone", @"title":@"QQ空间",@"type":@(ZXShareChannelQQZone)}];
    }
    if (weiboIsInstall) {
        [self.dataSource addObject:@{@"img":@"icon_sina_wb", @"title":@"微博",@"type":@(ZXShareChannelSina)}];
        
    }
    [self.dataSource addObject:@{@"img":@"icon_sms", @"title":@"短信",@"type":@(ZXShareChannelSms)}];
    
    //    _dataSource = [NSMutableArray arrayWithArray:@[@{@"img":@"icon_wx_friend", @"title":@"微信好友",@"type":@(PLShareChannelWeChatFriend)},
    //                                                   @{@"img":@"icon_wx_circle", @"title":@"微信朋友圈",@"type":@(PLShareChannelWechatTimeLine)},
    //                                                   @{@"img":@"icon_qq_friend", @"title":@"QQ好友",@"type":@(PLShareChannelQQFriend)},
    //                                                   @{@"img":@"icon_qzone", @"title":@"QQ空间",@"type":@(PLShareChannelQQZone)},
    //                                                   @{@"img":@"icon_sina_wb", @"title":@"微博",@"type":@(PLShareChannelSina)},
    //                                                   @{@"img":@"icon_sms", @"title":@"短信",@"type":@(PLShareChannelSms)}]];
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setupShadowView];
    
    [self setupShareView];
    
    [UIView animateWithDuration:0.3 animations:^{
        _shadowView.alpha = 0.3;
        _shareView.top = kScreen_Height - 150;
    }];
}

- (void)setupShadowView {
    _shadowView = [[UIView alloc] initWithFrame:self.view.bounds];
    _shadowView.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tapShadow = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSelf)];
    [_shadowView addGestureRecognizer:tapShadow];
    [self.view addSubview:_shadowView];
    _shadowView.alpha = 0;
}

- (void)setupShareView {
    _shareView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, 150)];
    _shareView.backgroundColor = RGBColor(245, 245, 245, 1);
    [self.view addSubview:_shareView];
    
    UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 16)];
    shareLabel.font = [UIFont systemFontOfSize:14];
    shareLabel.text = @"分享";
    [_shareView addSubview:shareLabel];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 50, 10, 40, 16)];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(hideSelf) forControlEvents:UIControlEventTouchUpInside];
    [_shareView addSubview:cancelButton];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, kScreen_Width, 100)
                                         collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_shareView addSubview:_collectionView];
    [_collectionView registerClass:[ZXShareViewCell class] forCellWithReuseIdentifier:@"shareCellId"];
}

#pragma mark - private Methods
- (void)hideSelf
{
    [UIView animateWithDuration:0.3 animations:^{
        _shadowView.alpha = 0;
        _shareView.top = kScreen_Height;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    
}

- (UMShareWebpageObject *)setupShareBody {
    UMShareWebpageObject *shareBody = [[UMShareWebpageObject alloc] init];
    shareBody.webpageUrl = _shareModel.shareUrl;
    shareBody.title = _shareModel.shareTitle;
    shareBody.descr = _shareModel.shareContent;
    shareBody.thumbImage = _shareModel.shareImage;
    return shareBody;
}

- (void)shareToUMWithUMSocialPlatformType:(UMSocialPlatformType)type {
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.shareObject = [self setupShareBody];
    [[UMSocialManager defaultManager] shareToPlatform:type
                                        messageObject:messageObject
                                currentViewController:self
                                           completion:^(id data, NSError *error) {
                                               if (error) {
                                                   NSLog(@"************Share fail with error %@*********",error);
                                               }else{
                                                   NSLog(@"response data is %@",data);
                                               }
                                           }];
}


#pragma mark - UICollection delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSource.count;
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZXShareViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"shareCellId" forIndexPath:indexPath];
    cell.shareImage.image = [UIImage imageNamed:_dataSource[indexPath.row][@"img"]];
    cell.shareLabel.text = _dataSource[indexPath.row][@"title"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *selectDic = _dataSource[indexPath.row];
    NSInteger shareType = [selectDic[@"type"] integerValue];
    switch (shareType) {
        case ZXShareChannelWeChatFriend:
        {
            //微信好友
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
                
                [self shareToUMWithUMSocialPlatformType:UMSocialPlatformType_WechatSession];
                
            }else{
                
                ALERTTK(@"提示", @"检测到您未安装微信！");
                
            }
        }
            break;
        case ZXShareChannelWechatTimeLine:
        {
            //微信朋友圈
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
                
                [self shareToUMWithUMSocialPlatformType:UMSocialPlatformType_WechatTimeLine];
                
            }else{
                
                ALERTTK(@"提示", @"检测到您未安装微信！");
                
            }
        }
            break;
        case ZXShareChannelQQFriend:
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
                
                [self shareToUMWithUMSocialPlatformType:UMSocialPlatformType_QQ];
                
            }else{
                
                ALERTTK(@"提示", @"检测到您未安装QQ！");
                
            }
        }
            break;
        case ZXShareChannelQQZone:
        {
            
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
                
                [self shareToUMWithUMSocialPlatformType:UMSocialPlatformType_Qzone];
                
            }else{
                
                ALERTTK(@"提示", @"检测到您未安装QQ！");
                
            }
        }
            break;
        case ZXShareChannelSina:
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibo://"]]) {
                
                [self shareToUMWithUMSocialPlatformType:UMSocialPlatformType_Sina];
                
            }else{
                
                ALERTTK(@"提示", @"检测到您未安装新浪微博！");
            }
            
        }
            break;
        case ZXShareChannelSms:
        {
            //短信
            MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
            controller.navigationBar.tintColor = [UIColor colorWithRed:0.13 green:0.38 blue:0.64 alpha:1.00];
            controller.body = _shareModel.shareContent;
            controller.messageComposeDelegate = self;
            
            [self presentViewController:controller animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:^{
    }];
}


@end

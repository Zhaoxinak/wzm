//
//  PublishPartyViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseTableViewController.h"

@interface PublishPartyViewController : BaseTableViewController

//上传图片数组
@property (nonatomic, strong) NSMutableArray *picArray;
@property (nonatomic, assign) BOOL isJoinTime;

@end

//
//  EditPersonalInfoViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

@protocol EditPersonalInfoViewControllerDelegate <NSObject>

- (void)sendBackString: (NSString *)string;

@end

@interface EditPersonalInfoViewController : BaseViewController

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSString *titleString;

@property (nonatomic, strong) NSString *oldData;

@property (nonatomic, strong) id<EditPersonalInfoViewControllerDelegate>delegate;

@end

//
//  EditPersonalInfoViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSUInteger, PersonalEditType) {
    NameEdit,       //修改名字
    SexEdit,        //修改性别
    VolkEdit,       //修改民族
    BrithdayEdit,   //修改出生年月
    BrithCtiyEdit,  //修改出生城市
    CarsEdit,       //修改喜爱车型
    InterestEdit,   //修改改装兴趣
    PersonInfoEdit, //修改个人说明
};



@protocol EditPersonalInfoViewControllerDelegate <NSObject>

- (void)sendBackString: (NSString *)string;

@end

@interface EditPersonalInfoViewController : BaseViewController

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, assign) PersonalEditType type;

@property (nonatomic, strong) NSString *titleString;

@property (nonatomic, strong) NSString *oldData;

@property (nonatomic, strong) id<EditPersonalInfoViewControllerDelegate>delegate;

@end

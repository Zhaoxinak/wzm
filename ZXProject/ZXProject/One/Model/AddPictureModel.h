//
//  AddPictureModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , AddPictureType) {
    AddPictureTypePicture,
    AddPictureTypeAddButton
};

@interface AddPictureModel : NSObject

//模型类型
@property (nonatomic, assign) AddPictureType modelType;
//图片
@property (nonatomic, strong) UIImage *addImage;
//描述
@property (nonatomic, strong) NSString *desString;
//餐厅类型
@property (nonatomic, strong) NSString *resType;
//上传后的url
@property (nonatomic, strong) NSString *picUrl;


@end

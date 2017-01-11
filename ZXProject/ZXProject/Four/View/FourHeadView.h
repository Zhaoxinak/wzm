//
//  FourHeadView.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/10.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UserHeadClickBlock)(NSString *userId);


@protocol FourHeadViewDelegate <NSObject>
#pragma mark -- 0 为跳转用户详情 123分别跳转 喵币、余额、喵友
@optional
-(void)fourHeadViewSelect2go:(NSInteger)tag;

@end


@interface FourHeadView : UIView{
    
}
@property(nonatomic, assign) id<FourHeadViewDelegate> delegate;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end

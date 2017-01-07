//
//  ZXCountdDownButton.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCountdDownButton : UIButton

@property (nonatomic, assign) NSInteger count;

- (void)timeFailBeginFrom:(NSInteger)timeCount;

@end

//
//  ZXShareViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "ZXShareViewCell.h"

@implementation ZXShareViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setup method
- (void)setupViews {
    _shareImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 60, 60)];
    [self.contentView addSubview:_shareImage];
    
    _shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, 100, 15)];
    _shareLabel.font = [UIFont systemFontOfSize:13];
    _shareLabel.textColor = [UIColor lightGrayColor];
    _shareLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_shareLabel];
}


@end

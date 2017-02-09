//
//  ZXCountdDownButton.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ZXCountdDownButton.h"
#import "CommonHeader.h"
@interface ZXCountdDownButton ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZXCountdDownButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self setTitle:@" 获取验证码 " forState:UIControlStateNormal];
    self.titleLabel.font = Font12;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
    [self setTitleColor:NameColor];
    self.layer.borderColor = NameColor.CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)timeFailBeginFrom:(NSInteger)timeCount {
    self.timer = nil;
    self.count = timeCount;
    self.enabled = NO;
    // 加1个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired {
    
    
    if (self.count != 0) {
        self.count -= 1;
        
        [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count] forState:UIControlStateDisabled];
        if (_count <= 0) {
            [self setTitle:@"重新获取" forState:UIControlStateDisabled];
        }
    } else {
        
        self.enabled = YES;
        [self setTitle:@"重新获取" forState:UIControlStateNormal];
        self.count = 60;
        [self.timer invalidate];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

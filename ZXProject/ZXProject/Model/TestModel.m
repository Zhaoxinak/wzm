//
//  TestModel.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "TestModel.h"

@implementation ProjectsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DataModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation TestModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

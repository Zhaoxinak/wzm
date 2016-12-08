//
//  TestModel.h
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <JSONModel.h> //模型

@protocol ProjectsModel <NSObject>
@end
@interface ProjectsModel : JSONModel

@property (nonatomic, copy) NSString *headUrl;


@end

@interface DataModel : JSONModel

@property (nonatomic, copy) NSString *becomdGod;
@property (nonatomic, strong) NSMutableArray<ProjectsModel> *projects;

@end

@interface TestModel : JSONModel


@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) DataModel *data;

@end

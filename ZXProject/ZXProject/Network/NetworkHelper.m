//
//  NetworkHelper.m
//  InterfaceHelper
//
//  Created by Wu Hengmin on 16/3/23.
//  Copyright © 2016年 Wu Hengmin. All rights reserved.
//

#import "NetworkHelper.h"

//请求头方法
typedef NS_ENUM(NSUInteger, HTTPHeaderMethod) {
    NormalHTTPHeader, //正常请求头方法
    SpecialHTTPHeader //特殊请求头方法
};

@implementation NSObject (FetchData)

#pragma mark发现界面数据
-(void)dataWithDiscover:(BOOL)progress requestId:(NSInteger)requestId{
    if ([ZXTools getCurrentWindow] == nil) {
        progress = NO;
    }
    //    NSString *params = [NSString stringWithFormat:@"userName=%@", @""];
    NSString *str = [NSString stringWithFormat:@"%@%@", BASEURL, URL_DISCOVER];
    NSLog(@"%@", str);
    [self data:progress requestId:requestId url:str params:@"" type:NormalHTTPHeader Method:GETMethod];
    
}


-(void)sendRequestId:(RequestName)requestId rMethod:(HTTPMethod)rMethod params:(id  _Nonnull)params{
    
    NSString *url = @"";
    url = [self setupUrl:url RequestId:requestId];
    if (url.length >0 && rMethod == GETMethod) {
        
        NSString *str = @"";
        for (NSString *key in [params allKeys]) {
            if ([str length] == 0) {
                str = [NSString stringWithFormat:@"?%@=%@", key, [params objectForKey:key]];
            }
            else
            {
                str = [NSString stringWithFormat:@"%@&%@=%@", str, key, [params objectForKey:key]];
            }
        }
        // 网址不能有空格和汉字
        url = [NSString stringWithFormat:@"%@%@", url, str];
        url = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@", str);
    }
    
    
    if (url.length >0) {
        if (rMethod == GETMethod) {
            [self data:YES requestId:requestId url:url params:@"" type:NormalHTTPHeader Method:GETMethod];
        }else{
            [self data:YES requestId:requestId url:url params:params type:NormalHTTPHeader Method:POSTMethod];
        }
        
        
        
    }
    
    
}

-(NSString *)setupUrl:(NSString *)url RequestId:(RequestName)requestId{
    
    NSString *tempUrl = url;
    switch (requestId) {
        case ZXInterfaceDiscover:{
            tempUrl = [NSString stringWithFormat:@"%@%@", BASEURL, URL_DISCOVER];
        }
            break;
        case ZXInterfaceLogin:{
            
        }
            break;
        case ZXInterfaceWeWeChatAdvance:{
            
        }
            break;
        default:
            break;
    }

    
    return tempUrl;
    
}

#pragma mark图片上传
-(void)dataWithImgupload:(BOOL)progress viewpointId:(NSString *_Nonnull)viewpointId imageDatas:(NSMutableArray *_Nonnull)imageDatas completion:(void (^ _Nonnull)(BOOL finish))completion {
    if ([ZXTools getCurrentWindow] == nil) {
        progress = NO;
    }
    
    NSString *params = [NSString stringWithFormat:@"viewpointId=%@", viewpointId];
    NSString *str = [NSString stringWithFormat:@"%@%@%@", BASEURL, URL_DISCOVER, params];
    
    [self imgData:progress url:str imageDatas:imageDatas imageName:@"files" parameters:nil completion:^(BOOL finish) {
       
        if (finish) {
            completion(YES);
        }else{
            completion(NO);
        }
        
    }];
    
}





#pragma mark - 回调
// 当网络请求开始或结束时，下面两个方法将会被调到。
- (void)fetchingDidStartWithRequestId:(NSInteger)requestId {
}

- (void)fetchingDidEndWithRequestId:(NSInteger)requestId {
}

- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId {
    
    [self ZXsuccessData:data byRequestId:requestId];
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId {
    
}

- (void)ZXsuccessData:(id _Nullable)data byRequestId:(NSInteger)requestId {
    
    
}

#pragma mark工具类
//工具类
/*************************************************************/

#pragma mark二进制转字典
-(NSDictionary *)nsdata2dic:(NSData *)data {
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}

#pragma mark隐藏当前hud
-(void)hideMBProgressHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[ZXTools getCurrentWindow] animated:YES];
    });
}

#pragma mark通用数据请求
-(void)data:(BOOL)progress requestId:(NSInteger)requestId url:(NSString *)url params:(id)params type:(HTTPHeaderMethod)type Method:(HTTPMethod)Method{
    [self fetchingDidStartWithRequestId:requestId];
    
    if (progress) {
        [MBProgressHUD showHUDAddedTo:[ZXTools getCurrentWindow]animated:YES];
        
        //模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:[ZXTools getCurrentWindow] animated:YES];
        });
        
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //特殊请求
    if (type == SpecialHTTPHeader) {
         [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    }

    
    //POST方法
    if (Method == POSTMethod) {
        WEAK_SELF;
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            STRONG_SELF;
            if (progress) {
                [self hideMBProgressHUD];
            }
            NSLog(@"data:%@", [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
            [self handleData:responseObject byRequestId:requestId];
            [self fetchingDidEndWithRequestId:requestId];
           
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            STRONG_SELF;
            if (progress) {
                [self hideMBProgressHUD];
            }
            
            NSLog(@"error:%@", error);
            [ZXTools makeTask:[error localizedDescription]];
            [self handleError:error byRequestId:requestId];
            [self fetchingDidEndWithRequestId:requestId];
            
        }];
        
        
    }else{
        WEAK_SELF;
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            STRONG_SELF;
            if (progress) {
                [self hideMBProgressHUD];
            }
            NSLog(@"data:%@", [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
            [self handleData:responseObject byRequestId:requestId];
            [self fetchingDidEndWithRequestId:requestId];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            STRONG_SELF;
            if (progress) {
                [self hideMBProgressHUD];
            }
            
            NSLog(@"error:%@", error);
            [ZXTools makeTask:[error localizedDescription]];
            [self handleError:error byRequestId:requestId];
            [self fetchingDidEndWithRequestId:requestId];
            
        }];
        
    }
    
}

#pragma mark通用图片请求
-(void)imgData:(BOOL)progress url:(NSString *)url imageDatas:(NSMutableArray *_Nonnull)imageDatas imageName:(NSString *_Nonnull)imageName parameters:(NSDictionary *)parameters completion:(void (^ _Nonnull)(BOOL finish))completion{
    if (progress) {
        [MBProgressHUD showHUDAddedTo:[ZXTools getCurrentWindow]animated:YES];
        
        //模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:[ZXTools getCurrentWindow] animated:YES];
        });
        
    }
    
    NSMutableURLRequest *request=[[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"POST" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
        NSInteger imgCount = 0;
        for (NSData *imageData in imageDatas) {
            
            NSString *fileName = [NSString stringWithFormat:@"files%ld.png",(long)imgCount];
            
            [formData appendPartWithFileData:imageData name:imageName fileName:fileName mimeType:@"image/png"];
            
            imgCount++;
            
        }
        
    } error:nil];
    
    AFURLSessionManager *manager=[[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    AFHTTPResponseSerializer * s = [AFHTTPResponseSerializer serializer];
    
    s.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"multipart/form-data",nil];
    
    [request setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    
    
    NSLog(@"%@",request.allHTTPHeaderFields);
    
    manager.responseSerializer = s;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        NSLog(@"上传完成！！！");
        
        NSLog(@"responseObject====%@", [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        if (responseObject) {
            
            if (progress) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:[ZXTools getCurrentWindow] animated:YES];
                });
            }
            
            NSError *error;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
            NSLog(@"responseDictionary===%@",responseDictionary);
            
            if ([responseDictionary[@"isValid"]integerValue]) {
                
            }else{
                
            }
            
            completion(YES);
            
        }
        if (error) {
            
            completion(NO);
            NSLog(@"%@",error);
            [ZXTools makeTask:[error localizedDescription]];
        }
    }];
    
    
    [uploadTask resume];
    
    
}

#pragma mark通用错误数据处理
-(void)showServerMsg:(NSString *)msg{
    
    [ZXTools makeTask:[NSString stringWithFormat:@"%@", msg]];
    if ([msg isEqualToString:@"未登录或登录超时，请重新登录后再操作"]) {
        
    }

}


@end

//
//  NetworkHelper.m
//  InterfaceHelper
//
//  Created by Wu Hengmin on 16/3/23.
//  Copyright © 2016年 Wu Hengmin. All rights reserved.
//

#import "NetworkHelper.h"
#import "CommonHeader.h"
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


#pragma mark-- 图片上传
- (void)uploadImages:(NSArray *)imageArray {
    // http://139.129.131.20:8080/
    // http://www.halalo2o.cn/
    //@"http://139.129.131.20:8080/util/upload"
    
    
    NSString *baseUrl = @"base_url";
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    __weak typeof(&*self) weakSelf = self;
    NSURLSessionDataTask *task = [manager POST:[NSString stringWithFormat:@"%@util/upload", baseUrl] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        
        for (int i = 0; i < imageArray.count; i++) {
            UIImage *image = imageArray[i];
            NSString *fileName = [NSString stringWithFormat:@"pic%d",i];
            NSData *imageData = [self representationDataWithImage:image];
            [formData appendPartWithFileData:imageData
                                        name:@"files"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        //上传成功
        [weakSelf handleData:responseObject byRequestId:ZXInterfaceUploadPic];
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError * _Nonnull error) {
        //上传失败
        [weakSelf handleError:error byRequestId:ZXInterfaceUploadPic];
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



#pragma mark-- 图片处理
- (NSData *)representationDataWithImage:(UIImage *)image {
    CGFloat multiple = 0.8;
    NSData *imageData = UIImageJPEGRepresentation(image, multiple);
    //    while (imageData.length > 500000) {
    //        multiple = multiple * 0.9;
    //        imageData = UIImageJPEGRepresentation(image, multiple);
    //    }
    return imageData;
}

#pragma mark通用错误数据处理
-(void)showServerMsg:(NSString *)msg{
    
    [ZXTools makeTask:[NSString stringWithFormat:@"%@", msg]];
    if ([msg isEqualToString:@"未登录或登录超时，请重新登录后再操作"]) {
        
    }

}


@end

//
//  NSString+Common.m
//  CardByYou
//
//  Created by qianfeng on 15/12/14.
//  Copyright © 2015年 XuLiangMa. All rights reserved.
//

#import "NSString+Common.h"


#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Common)

+ (NSString *)TimeStamp:(NSString *)strTime {
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //用[NSDate date]可以获取系统当前时间
    
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    //输出格式为：2010-10-27 10:22:13
    
    NSLog(@"%@",currentDateStr);
    
    
    return currentDateStr;
}


+ (NSString *)changeJsonStringToTrueJsonString:(NSString *)json
{
    // 将没有双引号的替换成有双引号的
    NSString *validString = [json stringByReplacingOccurrencesOfString:@"(\\w+)\\s*:([^A-Za-z0-9_])"
                                                            withString:@"\"$1\":$2"
                                                               options:NSRegularExpressionSearch
                                                                 range:NSMakeRange(0, [json length])];
    
    
    //把'单引号改为双引号"
    validString = [validString stringByReplacingOccurrencesOfString:@"([:\\[,\\{])'"
                                                         withString:@"$1\""
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    validString = [validString stringByReplacingOccurrencesOfString:@"'([:\\],\\}])"
                                                         withString:@"\"$1"
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    
    //再重复一次 将没有双引号的替换成有双引号的
    validString = [validString stringByReplacingOccurrencesOfString:@"([:\\[,\\{])(\\w+)\\s*:"
                                                         withString:@"$1\"$2\":"
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    return validString;
}

NSString * URLEncodedString(NSString *str) {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[str UTF8String];
    int sourceLen = (int)strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}
// 统一使用这个方法
+ (NSString *)md5HexDigest:(NSString*)input {
    if (input == nil) {
        NSLog(@"----------MD5加密字符串为空----------");
        return @"";
    }
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
NSString * MD5Hash(NSString *aString) {
    if (aString.length == 0) {
        return nil;
    }
    const char *cStr = [aString UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

- (NSString *)intervalSinceNow: (NSString *) theDate {
    
    
    NSString *copyDate = theDate;
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    
    [date setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1.0;
    
    NSDate* dat = [NSDate date];
    
    NSString *currentDateStr = [date stringFromDate:[NSDate date]];
    
    NSTimeInterval now=[dat timeIntervalSince1970]*1.0;
    
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    /************************判断是否是昨天*************************/
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    currentDateStr = [[currentDateStr componentsSeparatedByString:@" "] objectAtIndex:0];
    theDate = [[theDate componentsSeparatedByString:@" "] objectAtIndex:0];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:currentDateStr];
    dt2 = [df dateFromString:theDate];
    [NSDate  timeIntervalSinceReferenceDate];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //today比otherDay大
        case NSOrderedDescending: {
            NSTimeInterval dayTime = 24*60*60;
            // 将today往前减少一天的时间，判断是否和昨天的时间是否相等，如果相等则表示
            // otherDay为昨天
            NSDate * newDate = [dt1 dateByAddingTimeInterval:-dayTime];
            result = [dt2 compare:newDate];
            if (result == NSOrderedSame) {
                // 表示日期为昨天
                ci = -1;
                timeString = @"昨天";
            } else {
                // 表示日期为昨天以前的时间
                ci = 1;
                timeString = [copyDate substringWithRange:NSMakeRange(5, 5)];
            }
        }
            break;
            //date02=date01,代表日期是今天
        case NSOrderedSame: {
            ci=0;
            timeString = [copyDate substringWithRange:NSMakeRange(11, 5)];
        };
            break;
        default:
            // 默认显示所有的具体的日期时间
            ci = 1;
            timeString = copyDate;
            break;
    }
    
    
    //    if (cha/3600<1) {
    //
    //        if (cha < 0) {
    //            timeString=@"刚刚";
    //        } else {
    //            timeString = [NSString stringWithFormat:@"%f", cha/60];
    //
    //            timeString = [timeString substringToIndex:timeString.length-7];
    //
    //            timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    //        }
    //    }
    //    if (cha/3600>1&&cha/86400<1) {
    //
    //        timeString = [NSString stringWithFormat:@"%f", cha/3600];
    //
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //
    //        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    //
    //    }
    //    if (cha/86400>1) {
    //
    //        timeString = [NSString stringWithFormat:@"%f", cha/86400];
    //
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //
    //        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    //    }
    
    return timeString;
}

//- (NSString *) MD5Hash {
//    const char *cStr = [self UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
//    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]];
//}
- (CGSize)getWidth:(NSString *)str andFont:(UIFont *)font {
    CGSize sz = [str sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 40)];
    return sz;
}
@end

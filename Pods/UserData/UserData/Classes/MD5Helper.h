//
//  YXZS_MD5Helper.h
//  YXZS
//
//  Created by 黄隆 on 14-5-14.
//  Copyright (c) 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DEFAULT_KEY @"你能破解么,我就不信了,哈哈,傻了吧 .就是要让你傻."

@interface MD5Helper : NSObject
+(NSString *)md5:(NSString *)str;
+(NSString *)md5WithKey:(NSString *)str key:(NSString*)key;
@end

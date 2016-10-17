//
//  YXZS_MD5Helper.m
//  YXZS
//
//  Created by 黄隆 on 14-5-14.
//  Copyright (c) 2014年. All rights reserved.
//

#import "MD5Helper.h"
#import <CommonCrypto/CommonDigest.h>


@implementation MD5Helper

+(NSString *)md5:(NSString *)str
{
    return [MD5Helper md5WithKey:str key:DEFAULT_KEY];
    /*
    NSString *temp = [NSString stringWithFormat:@"%@%@", str, DEFAULT_KEY ];
    const char *cStr = [temp UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; */
}

+(NSString *)md5WithKey:(NSString *)str key:(NSString*)key
{
    NSString *temp = [NSString stringWithFormat:@"%@%@", str, key ];
    const char *cStr = [temp UTF8String];
    unsigned char result[16];
    CC_LONG len = (unsigned int)strlen(cStr);
    CC_MD5(cStr, len, result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end

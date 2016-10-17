//
//  NSData+Hex.m
//  PRJ_YDAC
//
//  Created by 黄隆 on 16/3/16.
//  Copyright © 2016年 cn.com.sxit. All rights reserved.
//

#import "NSData+Hex.h"

@implementation NSData (Hex)
+ (NSData *)hexDataFromString:(NSString *)string
{
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:string.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [string length] / 2; i++) {
        byte_chars[0] = [string characterAtIndex:i*2];
        byte_chars[1] = [string characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}
@end

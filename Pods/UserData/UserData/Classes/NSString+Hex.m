//
//  NSString+NSString_Hex.m
//  PRJ_YDAC
//
//  Created by 黄隆 on 16/3/16.
//  Copyright © 2016年 cn.com.sxit. All rights reserved.
//

#import "NSString+Hex.h"

@implementation NSString (Hex)
+ (NSString *)hexStringFromData:(NSData *)data
{
    if (data && data.length > 0) {
        
        Byte *datas = (Byte*)[data bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:data.length * 2];
        for(int i = 0; i < data.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}
@end

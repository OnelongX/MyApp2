//
//  DESHelper.h
//  YXZS
//
//  Created by 黄隆 on 14-8-7.
//  Copyright (c) 2014年 ChinaMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

#import "NSString+Base64.h"
#import "NSData+Base64.h"
#import "NSData+AES256.h"

@interface DESHelper : NSObject
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key;

//+ (NSData *) decryptDES:(NSString*)cipherText key:(NSString*)key;


+ (NSString *) encryptUseAES:(NSString *)plainText key:(NSString *)key;

+ (NSString *) decryptUseAES:(NSString*)cipherText key:(NSString*)key;
@end

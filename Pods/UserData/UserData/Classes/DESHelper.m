//
//  DESHelper.m
//  YXZS
//
//  Created by 黄隆 on 14-8-7.
//  Copyright (c) 2014年 ChinaMobile. All rights reserved.
//

#import "DESHelper.h"

@implementation DESHelper
/*字符串加密
 *参数
 *plainText : 加密明文
 *key        : 密钥 64位
 */
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    if(plainText==nil)
    {
        return nil;
    }
    NSString *ciphertext = nil;
    
    const char *textBytes = [plainText UTF8String];
    NSUInteger dataLength = strlen(textBytes);//[plainText length];
    //unsigned char buffer[1024];
    //memset(buffer, 0, sizeof(char));
    Byte iv[] = { 0xEF,  0xAB,
         0x56,  0x78,  0x90,  0x34, 0xCD,
         0x12 };
    //Byte iv[] = {1,2,3,4,5,6,7,8};
    
    /*
     DES加密 ：用CCCrypt函数加密一下，然后用base64编码下，传过去
     DES解密 ：把收到的数据根据base64，decode一下，然后再用CCCrypt函数解密，得到原本的数据
     */
    //CCCryptorStatus ccStatus;
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    size_t dataOutAvailable = 0; //size_t  是操作符sizeof返回的结果类型
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    
    //size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          dataOut, dataOutAvailable,
                                          &dataOutMoved);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved];
        free(dataOut);
        ciphertext = [NSString base64StringFromData:data length:data.length];
        //ciphertext = [[[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding] autorelease];
    }
    return ciphertext;
}

//解密
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [NSData base64DataFromString:cipherText];
    
    //unsigned char buffer[1024];
    //memset(buffer, 0, sizeof(char));
    
    //size_t numBytesDecrypted = 0;
    Byte iv[] = { 0xEF,  0xAB,
        0x56,  0x78,  0x90,  0x34, 0xCD,
        0x12 };
    //Byte iv[] = {1,2,3,4,5,6,7,8};
    
    
    
    /*
     DES加密 ：用CCCrypt函数加密一下，然后用base64编码下，传过去
     DES解密 ：把收到的数据根据base64，decode一下，然后再用CCCrypt函数解密，得到原本的数据
     */
    //CCCryptorStatus ccStatus;
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    size_t dataOutAvailable = 0; //size_t  是操作符sizeof返回的结果类型
    size_t dataOutMoved = 0;
    
    dataOutAvailable = ([cipherData length] + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0

    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          dataOut,
                                          dataOutAvailable,
                                          &dataOutMoved);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:dataOut length:dataOutMoved];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    free(dataOut);
    return plainText;
}
/*
//解密
+ (NSData *) decryptDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [NSData base64DataFromString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = { 0xEF,  0xAB,
        0x56,  0x78,  0x90,  0x34, 0xCD,
        0x12 };
    //Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSData* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        plainText = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        //plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
*/
+ (NSString *) encryptUseAES:(NSString *)plainText key:(NSString *)key
{
    NSData* cipherData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    //[cipherData aes256_encrypt:key];
    NSData* data = [cipherData aes256_encrypt:key];
    if (data==nil) {
        return nil;
    }
    return [NSString base64StringFromData:data length:data.length];
}

+ (NSString *) decryptUseAES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [NSData base64DataFromString:cipherText];
    NSData* data = [cipherData aes256_decrypt:key];
    if (data==nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}

@end

//
//  YYQKeyChain.h
//  KeyChain-UDID
//
//  Created by YYQ on 14/11/13.
//  Copyright (c) 2014年 YYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface YYQKeyChain : NSObject

+ (NSString *)getUDIDWithUniqueKey:(NSString *)uniqueKey;

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end
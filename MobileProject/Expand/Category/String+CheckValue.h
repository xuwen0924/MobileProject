//
//  String+CheckValue.h
//  HomePlus
//
//  Created by xuwen on 2017/5/10.
//  Copyright © 2017年 worldunion. All rights reserved.
//

#import <Foundation/Foundation.h>


//定义宏（限制输入内容）
#define kAlphaNum   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
#define kAlpha      @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define kNumbers     @"0123456789"
#define kNumbersPeriod  @"0123456789."
#define kNumberX  @"0123456789xX"
#define kNumbersheng  @"0123456789-"

@interface String_CheckValue : NSObject

#pragma mark --限制性输入
/**
 *  @author King, 15-06-17 16:06:20
 *
 *  限制性输入
 *
 *  @param type <#type description#>
 *
 *  @return <#return value description#>
 */
static inline BOOL chenkInputNSCharacterSetWithType(NSString *str, int type){
    NSString *typeString;
    if (type==0) {
        typeString = kAlphaNum;
    }else if (type==1){
        typeString = kAlpha;
    }else if (type==2){
        typeString = kNumbers;
    }else if(type==3){
        typeString = kNumbersPeriod;
    }else if (type==4){
        typeString = kNumbersheng;
    }else if (type==5){
        typeString = kNumberX;
    }
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:typeString] invertedSet];
    NSString *filtered =
    [[str componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [str isEqualToString:filtered];
    return basic;
}

#pragma mark --检查是否为手机
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:04
 *
 *  @brief  检查是否为手机
 *
 *  @param phone <#phone description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsMobilePhone(NSString *phone)
{
    if (!phone || [phone length] == 0)
    {
        return NO;
    }
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1+[0-9]+\\d{9}";//@"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark --检查是否为Email
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:19
 *
 *  @brief  检查是否为Email
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsEmail(NSString *email)
{
    if (!email || [email length] == 0)
    {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark --检查是否为金额
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:00
 *
 *  @brief  检查是否为金额
 *
 *  @param price <#price description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsPrice(NSString *price)
{
    if (!price || [price length] == 0)
    {
        return NO;
    }
    NSString *priceRegex = @"^(([0-9]|([1-9][0-9]{0,9}))((\\.[0-9]{1,2})?))$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", priceRegex];
    return [emailTest evaluateWithObject:price];
}

#pragma mark --检查是否为邮政编码
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:53
 *
 *  @brief  检查是否为邮政编码
 *
 *  @param code <#code description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsZipCode(NSString *code)
{
    if (!code || [code length] == 0)
    {
        return NO;
    }
    NSString *zipCodeRegex = @"[1-9]d{5}(?!d)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipCodeRegex];
    return [emailTest evaluateWithObject:code];
}

#pragma mark --检查是否为身份证号
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:10
 *
 *  @brief  检查是否为身份证号
 *
 *  @param ident <#ident description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsIdentity(NSString *ident)
{
    if (!ident || [ident length] == 0)
    {
        return NO;
    }
    NSString *identityRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",identityRegex];
    return [identityCardPredicate evaluateWithObject:ident];
}

#pragma mark --银行卡格式
/*!
 *  @author xuwen, 15-12-18 13:12:18
 *
 *  @brief 银行卡格式
 *
 *  @param cardNum <#cardNum description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline NSString *kBankCardFormat(long cardNum)
{
    NSNumber *number = [NSNumber numberWithLongLong:cardNum];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setUsesGroupingSeparator:YES];
    [formatter setGroupingSize:4];
    [formatter setGroupingSeparator:@" "];
    NSString *string = [formatter stringFromNumber:number];
    return string;
}

#pragma mark --检查是否为姓名
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:04
 *
 *  @brief  检查是否为姓名
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsSingleName(NSString *name)
{
    if (!name || [name length] == 0)
    {
        return NO;
    }
    NSString *singleRegex = @"^([\u4e00-\u9fa5]+|([a-zA-Z]+\\s?)+)$";
    NSPredicate *singleCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",singleRegex];
    return [singleCardPredicate evaluateWithObject:name];
}

#pragma mark --检查是否密码正确
/*!
 *  @author worldunion.com.cn, 15-10-20 17:10:16
 *
 *  @brief  检查是否密码正确
 *
 *  @param pwd <#pwd description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
static inline BOOL kIsPassword(NSString *pwd)
{
    if (!pwd || [pwd length] == 0)
    {
        return NO;
    }
    NSString *singleRegex = @"^[\\@A-Za-z0-9\\!\\#\\$\\%\\^\\&\\*\\.\\~]{6,22}$";
    NSPredicate *singleCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",singleRegex];
    return [singleCardPredicate evaluateWithObject:pwd];
}
@end

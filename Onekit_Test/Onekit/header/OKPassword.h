//
//  OKPassword.h
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 * 密码
 */
@interface OKPassword : NSObject
/*!
 *  MD5加密
 *  @param string 字符串
 *  @return 返回加密字符串
 */
+ (NSString *)MD5:(NSString*)string;
/*!
 *  Hash1加密
 *  @param string 字符串
 *  @return 返回加密字符串
 */
+ (NSString *)Hash1:(NSString*)string;
@end

//
//  OKXml.h
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
/*!
 *  XML操作
 */
@interface OKXml : NSObject


/*!
 *  XML反序列化
 *
 *  @param string 字符串
 *  @return XML对象
 */
+(GDataXMLDocument*)parse:(NSString *)string;


/*!
 *  XML序列化
 *
 *  @param xml XML对象
 *
 *  @return 字符串
 */
+(NSString *)stringfy:(GDataXMLDocument*)xml;
@end

//
//  OKXml.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKXml.h"

@implementation OKXml

+(GDataXMLDocument*)parse:(NSString *)string{
    GDataXMLDocument* xml = [[GDataXMLDocument alloc]initWithXMLString:string options:0 error:nil];
    return xml;
}

//
+(NSString *)stringfy:(GDataXMLDocument*)xml{
    NSData* data = [xml XMLData];
    NSString* string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}
@end

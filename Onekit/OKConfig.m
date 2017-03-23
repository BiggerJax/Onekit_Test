//
//  OKConfig.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKConfig.h"
#import "OKXml.h"
#import "OKData.h"
#import "OKJson.h"
@implementation OKConfig

+(void)init{

}

+(void)set:(NSString *)key value:(id)value{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//
+(id)get:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void)setString:(NSString *)key value:(NSString *)value{
     [OKConfig set:key value:value];
}
//
+(NSString *)getString:(NSString *)key{
    NSString *string = [OKConfig get:key];
    NSString *getString = [NSString stringWithFormat:@"%@",string];
    return getString;
}

+(void)setImage:(NSString *)key value:(UIImage *)value{
    NSData *data = UIImagePNGRepresentation(value);
    [OKConfig set:key value:data];
    
}
//
+(UIImage *)getImage:(NSString *)key{
    NSData *data = [OKConfig get:key];
    UIImage *image = [UIImage imageWithData:data];
    return image;

}

+(void)setJSON:(NSString *)key value:(id)value{
    NSString *jsonString = [OKJson stringify:value];
    [OKConfig set:key value:jsonString];
}
//
+(id)getJSON:(NSString *)key{
    NSString *string = [OKConfig get:key];
    return [OKJson parse:string];
}

//
+(void)setXML:(NSString *)key value:(GDataXMLDocument *)value{
    NSString* xmlString = [OKXml stringfy:value];
    [OKConfig set:key value:xmlString];
}
+(GDataXMLDocument *)getXML:(NSString *)key{
    NSString *string = [OKConfig getString:key];
    return [OKXml parse:string];
}

+(void)setData:(NSString *)key value:(NSData*)value{
    [OKConfig set:key value:value];
}
//
+(NSData *)getData:(NSString *)key{
    return [OKConfig get:key];
}

+(void)setBytes:(NSString *)key value:(OKBytes *)value{
   NSData *data = [[NSData alloc] initWithBytes:value.bytes length:value.length];
    [OKConfig set:key value:data];
}

+(OKBytes *)getBytes:(NSString *)key{
    NSData* data = [OKConfig getData:key];
    OKBytes* bytes = [OKBytes new];
    bytes.length = data.length;
    bytes.bytes = (Byte*)[data bytes];
    return bytes;
}
@end

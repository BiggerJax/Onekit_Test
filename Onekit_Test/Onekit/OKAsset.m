//
//  OKAsset.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKAsset.h"
#import "OKXml.h"
#import <UIKit/UIKit.h>
#import "Onekit.h"
@implementation OKAsset
+(NSString *)loadString:(NSString *)path{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"_.bundle"];
    NSString *string_path = [bundlePath stringByAppendingPathComponent:path];
    NSError* error;
    NSString *string = [NSString stringWithContentsOfFile:string_path
                                                 encoding:NSUTF8StringEncoding
                                                    error:&error];

    return string;
}

+(NSData *)loadData:(NSString *)path{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"_.bundle"];
    NSString *string_path = [bundlePath stringByAppendingPathComponent:path];
    NSData* data = [NSData dataWithContentsOfFile:string_path];
    return data;
}

+(GDataXMLDocument *)loadXML:(NSString *)path{
    NSString* string = [self loadString:path];
    return [OKXml parse:string];
}

+(UIImage *)loadImage:(NSString *)path{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"_.bundle"];
    NSString *img_path = [bundlePath stringByAppendingPathComponent:path];
    return [UIImage imageWithContentsOfFile:img_path];
}
+(id)loadJSON:(NSString *)path{
    NSString* string = [self loadString:path];
    return [OKJson parse:string];
}
@end

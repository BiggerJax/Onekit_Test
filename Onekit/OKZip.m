//
//  OKZip.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKZip.h"
#import "Onekit.h"
@implementation OKZip

+(void)zip:(NSDictionary *)files
    successCallBack:(void (^)(NSFileManager *))SuccessCallBack failureCallBack:(void (^)(NSError *))FailureCallBack{
    
}

+(void)unzip:(NSData *)data
    succsessCallBack:(void (^)(NSDictionary *))SuccessCallBack failureCallBack:(void (^)(NSError *))FailureCallBack{
    
}
+ (void)zip:(NSString*)zip folder:(NSString*)folder
{
    [SSZipArchive createZipFileAtPath:zip withContentsOfDirectory:folder];
}
+ (void)unzip:(NSString*)zip folder:(NSString*)folder
{
    [SSZipArchive unzipFileAtPath:zip toDestination:folder];
}
@end

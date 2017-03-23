//
//  OKPath.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKPath.h"
#import "OKConfig.h"
@implementation OKPath


+(NSString *)name:(NSString *)path{
    return [path lastPathComponent];
}

+(NSString *)folder:(NSString *)path{
    NSString *file = [path stringByDeletingLastPathComponent];
    NSString *fullPath = [file stringByAppendingString:@"/"];
    return fullPath;
}

+(NSString *)ext:(NSString *)path{
    return [path pathExtension];
    
}
@end

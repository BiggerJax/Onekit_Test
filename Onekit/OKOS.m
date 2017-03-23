//
//  OKOS.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKOS.h"
#import <UIKit/UIKit.h>
@implementation OKOS
+(NSString *)platform{
    NSString *platform = [[UIDevice currentDevice] model];
    return platform;
}

+(NSString *)version{
    NSString *version = [[UIDevice currentDevice] systemVersion];
    return version;
}

+(NSString *)Kernel{
    NSString *kernel = [[NSProcessInfo processInfo] operatingSystemVersionString];
    return kernel;
}
@end

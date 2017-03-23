//
//  OKRes.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKRes.h"
#import "OKJson.h"
#import "Onekit.h"
@implementation OKRes

+(NSString *)loadLocalize:(NSString *)key{
    NSString *local = NSLocalizedString(key, nil);
    return local;
}

+(UIImage *)loadImage:(NSString *)key{
    return [UIImage imageNamed:key];
}
@end

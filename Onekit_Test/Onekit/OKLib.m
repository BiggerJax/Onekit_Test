//
//  OKLib.m
//  Onekit_Designer
//
//  Created by 袁杰 on 17/3/22.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKLib.h"
#import "OKRes.h"
#import "OKJson.h"
#import "Onekit.h"
#import "Macro.h"

@interface OKLib()
@property NSBundle *bundle;
@end
@implementation OKLib
+(OKLib *)loadBundle:(NSString *)name{
    OKLib* bundle = [OKLib new];
    NSString* bundlePath = [[NSBundle mainBundle] pathForResource:name ofType:@"bundle"];
    bundle.bundle = [NSBundle bundleWithPath:bundlePath];
    return bundle;
}
- (NSString*)pathForRes:(NSString*)path
{
    NSInteger pName = [path lastIndexOf:@"/"];
    NSInteger pExt = [path lastIndexOf:@"."];
    NSString* folder = (pName>=0?[path subString:0 to:pName]:nil);
    NSString* name = [path subString:pName+1 to:(pExt>=0?pExt:path.length)];
    NSString* ext = (pExt>=0?[path subString:pExt+1]:nil);
    path =  [self.bundle pathForResource:name ofType:ext inDirectory:folder];
    return path;
}
- (NSData*)loadData:(NSString*)path
{
    path = [self pathForRes:path];
    return [NSData dataWithContentsOfFile:path];
}
- (UIImage*)loadImage:(NSString*)path
{
    path = [self pathForRes:path];
    return [UIImage imageWithContentsOfFile:path];
}
- (NSString*)loadString:(NSString*)path
{
    path = [self pathForRes:path];
    return [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
}
- (id)loadJSON:(NSString*)path
{
    path = [self pathForRes:path];
    NSString* string = [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
    return [OKJson parse:string];
}


@end

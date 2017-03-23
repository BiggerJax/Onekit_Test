//
//  OKMessage.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/21.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKMessage.h"

@implementation OKMessage
+ (void)init
{
    //[OneKit init];
}
+ (void)send:(NSString*)message params:(NSDictionary*)params target:(id)target
{
    [self init];
    [[NSNotificationCenter defaultCenter] postNotificationName:message object:target userInfo:params];
}
+ (void)send:(NSString*)message params:(NSDictionary*)params
{
    [OKMessage send:message params:params target:nil];
}

+(void)receive:(NSString *)message callback:(void (^)(NSDictionary *))callback target:(id)target{
    [self init];
    [[NSNotificationCenter defaultCenter] addObserverForName:message object:target queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        callback(note.userInfo);
    }];
}
+ (void)receive:(NSString*)message callback:(void (^)(NSDictionary* params))callback
{
    [OKMessage receive:message callback:callback target:nil];
}
@end

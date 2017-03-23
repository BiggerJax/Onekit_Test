//
//  OKJson.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKJson.h"
#import "Onekit.h"
@implementation OKJson
+(void)init{
    //
}

//
+(id)parse:(NSString *)string{
    if (isNull(string)) {
        NSLog(@"[OneKit-JSON-parse]:json string is null.");
        return nil;
    }
    
    NSData *stringData;
    NSError *error;
    stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    id result = [NSJSONSerialization JSONObjectWithData:stringData options:kNilOptions error:&error];
    if (notNull(error)) {
        NSLog(@"[OneKit-JSON-parse]:parse error");
        return nil;
    }
    return result;
}

//
+(NSString *)stringify:(id)json{
    if (isNull(json)) {
        NSLog(@"[OneKit-JSON-stringify]:json object is null.");
        return nil;
    }
    if (![NSJSONSerialization isValidJSONObject:json]) {
        NSLog(@"[OneKit-JSON-stringify]:json object is invalid");
        return nil;
    }
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:&error];
    if (notNull(error)) {
        NSLog(@"[OneKit-JSON-stringify]:stringify error:%@",error);
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+(NSObject *)find:(NSArray *)jsons value:(id)value key:(NSString *)key{
    return [OKArray find:jsons value:value key:key];
}

+(NSObject *)find:(NSArray *)jsons value:(id)value{
    return [OKArray find:jsons value:value key:nil];
}
+(BOOL)contain:(NSArray *)jsons value:(id)value key:(NSString *)key{
    return [OKArray indexOf:jsons value:value key:key];
}
+(BOOL)contain:(NSArray *)jsons value:(id)value{
    return [OKArray contain:jsons value:value key:nil];
}
+(NSInteger)indexOf:(NSArray *)jsons value:(id)value key:(NSString *)key{
    return [OKArray indexOf:jsons value:value key:key];
}
+(NSInteger)indexOf:(NSArray *)jsons value:(id)value{
    return [OKArray indexOf:jsons value:value key:nil];
}
@end

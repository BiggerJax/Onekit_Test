//
//  OKArray.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKArray.h"

@implementation OKArray


+(NSInteger)indexOf:(NSArray*)array value:(id)value key:(NSString *)key{
    for (int i = 0; i < [array count]; i ++) {
        NSDictionary *item = array[i];
        if(key){
            if ([item[key] isEqual:value]) {
                return i;
            }
        }else{
            if ([item isEqual:value]) {
                return i;
            }
        }
    }
    return -1;
}

+(NSInteger)indexOf:(NSArray*)array value:(id)value{
    return [OKArray indexOf:array value:value key:nil];
}
+(BOOL)contain:(NSArray *)array value:(id)value key:(NSString *)key{
    return [OKArray indexOf:array value:value key:key]>=0;
    
}

+(BOOL)contain:(NSArray *)array value:(id)value {
    return [OKArray indexOf:array value:value key:nil]>=0;
    
}

+(NSDictionary *)find:(NSArray *)array value:(id)value key:(NSString *)key{
    NSInteger index = [OKArray indexOf:array value:value key:key];
    return array[index];
}

+(NSDictionary *)find:(NSArray *)array value:(id)value{
    NSInteger index = [OKArray indexOf:array value:value key:nil];
    return array[index];
}




@end

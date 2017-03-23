//
//  OKData.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//
#import "OKData.h"

@implementation OKData

+(void)bytes2base64:(OKBytes *)bytes callback:(void (^)(NSString *))callback{
    [self bytes2data:bytes callback:^(NSData *data) {
        [self data2base64:data callback:callback];
    }];
}
+(void)bytes2Image:(OKBytes *)bytes callback:(void (^)(UIImage *))callback{
    [self bytes2data:bytes callback:^(NSData *data) {
        [self data2Image:data callback:callback];
    }];
}
+(void)bytes2data:(OKBytes *)bytes callback:(void (^)(NSData *))callback{
    NSData *data = [[NSData alloc] initWithBytes:bytes.bytes length:bytes.length];
    callback(data);
}
+(void)data2base64:(NSData *)data callback:(void (^)(NSString *))callback{
    NSString *string = [data base64EncodedStringWithOptions:0];
    callback(string);
}
+(void)base642bytes:(NSString *)base64 callback:(void (^)(OKBytes *))callback{
    [self base642data:base64 callback:^(NSData *data) {
        [self data2bytes:data callback:callback];
    }];
}
+(void)base642data:(NSString *)base64 callback:(void (^)(NSData *))callback{
    NSData* data = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
    //NSData *data = [base64 dataUsingEncoding:NSUTF8StringEncoding];
    callback(data);
}
+(void)base642Image:(NSString *)base64 callback:(void (^)(UIImage *))callback{
    [self base642data:base64 callback:^(NSData *data) {
        [OKData data2Image:data callback:callback];
    }];
}

+(void)image2base64:(UIImage *)image callback:(void (^)(NSString *))callback{
    [OKData image2data:image callback:^(NSData *data) {
        [OKData data2base64:data callback:callback];
    }];
}
+(void)image2data:(UIImage *)image callback:(void (^)(NSData *))callback{
    NSData *data = UIImagePNGRepresentation(image);
    callback(data);
}

+(void)image2bytes:(UIImage *)image callback:(void (^)(OKBytes *))callback{
    [self image2data:image callback:^(NSData *data) {
        OKBytes *bytes = (OKBytes *)[data bytes];
        callback(bytes);
    }];
}
+(void)data2Image:(NSData *)data callback:(void(^)(UIImage *image))callback {
    UIImage *image = [UIImage imageWithData:data];
    callback(image);
}
+(void)data2bytes:(NSData *)data callback:(void (^)(OKBytes *))callback{
    OKBytes* bytes = [OKBytes new];
    bytes.length = data.length;
    bytes.bytes = (Byte*)[data bytes];
    callback(bytes);
}
@end

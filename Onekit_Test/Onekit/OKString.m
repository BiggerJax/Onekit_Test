//
//  OKString.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "OKString.h"
#import "NSString+OneKit.h"
@implementation OKString



//
+(BOOL)isEmpty:(NSString *)str{

    return [NSString isEmpty:str];
}

//
+(NSInteger)indexOf:(NSString *)string str:(NSString *)str{
    NSRange range;
    range = [string rangeOfString:str];
    return range.location;
}

//
+(NSInteger)lastIndexOf:(NSString *)string str:(NSString *)str{
    NSString *instring = [[NSString alloc] initWithString:[OKString inverted:string]];
    NSString *instr = [[NSString alloc] initWithString:[OKString inverted:str]];
    NSRange range;
    range = [instring rangeOfString:instr];
    return  instring.length - range.location - instr.length;
}

//
+(BOOL)startWith:(NSString *)string str:(NSString *)str{
    return ([OKString indexOf:string str:str] == 0);
    
}

//
+(BOOL)endWith:(NSString *)string str:(NSString *)str{
    return  ([OKString indexOf:string str:str] == string.length - str.length);
}

//
+(NSString *)firstUpper:(NSString *)string{
    NSString *first = [string substringToIndex:1];
    NSString *upper = [first capitalizedString];
    return [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:upper];
}
//
+(CGSize)size:(NSString *)string fontSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}


+ (NSArray*)parse:(NSString*)str seperator:(NSString*)seperator
{
    if ([NSString isEmpty:str]) {
        return nil;
    }else{
        return [str componentsSeparatedByString:seperator];
    }
}

+(NSString *)inverted:(NSString *)string{
    NSMutableString *nsString = [NSMutableString string];
    for (unsigned long i = string.length-1; i>0; i--) {
        unsigned short st = [string characterAtIndex:i];
        [nsString insertString:[NSString stringWithFormat:@"%c",st] atIndex:nsString.length];
    }
    return nsString;
}
@end

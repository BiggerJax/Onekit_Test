//
//  NSString+OneKit.m
//  OnekitTool
//
//  Created by 袁杰 on 16/12/27.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "NSString+OneKit.h"
#import "Macro.h"

@implementation NSString (OneKit)
+ (void)init
{
    //[OneKit init];
}
+(BOOL)isEmpty:(NSString *)str{
    if (isNull(str)) {
        return TRUE;
    }
    if([str isEqualToString:@""]){
        return TRUE;
    }
    return FALSE;
}

//
-(NSInteger)indexOf:(NSString *)string{
    NSRange range = [self rangeOfString:string];
    if(range.length>0){
        return range.location;
    }else{
        return -1;
    }
}

//
-(NSInteger)lastIndexOf:(NSString *)string{
    NSString* STRING = self;
    NSInteger p = [STRING indexOf:string];
    if(p<0){
        return p;
    }
    NSInteger index = p;
    while(TRUE){
        STRING = [STRING substringFromIndex:p+1];
        p = [STRING indexOf:string];
        if(p<0){
            return index;
        }
        index += p+1;
    }
}

//
-(BOOL)startWith:(NSString *)string{
    return ([self indexOf:string] == 0);
}

//
-(BOOL)endWith:(NSString *)string{
    return ([self indexOf:string] == self.length - string.length);
}

//
-(CGSize)sizeWithSize:(CGSize)size font:(UIFont *)font{
    return [self boundingRectWithSize:size
                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
}
- (NSString *)URLEncode
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,    (CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    return result;
}

- (NSString*)replace:(NSString *)target to:(NSString*)to
{
    return [self stringByReplacingOccurrencesOfString:target withString:to];
}

- (BOOL)contains:(NSString *)string
{
    return !([self indexOf:string]==NSNotFound);
}
- (NSString*)subString:(NSInteger)from to:(NSInteger)to
{
    return [self substringWithRange:NSMakeRange(from, to-from)];
}
- (NSString*)subString:(NSInteger)from
{
    return [self substringFromIndex:from];
}
- (NSString*)firstUpper
{
    return [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
}
- (NSString*)unescape
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end

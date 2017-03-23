//
//  OKUI.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKUI.h"
#import "UIViewController+OneKit.h"
@implementation OKUI
+ (id)load:(NSString *)path
{
    return [OKUI loadNibNamed:path placeHolder:nil];
}

+ (id)loadNibNamed:(NSString *)name placeHolder:(UIView *)placeHolder
{
    UIView* uc = [[NSBundle mainBundle] loadNibNamed:name owner:[UIViewController current] options:nil][0];
    if(placeHolder){
        CGRect frame = placeHolder.bounds;
        uc.frame = frame;
        [placeHolder addSubview:uc];
    }
    return uc;
}
@end

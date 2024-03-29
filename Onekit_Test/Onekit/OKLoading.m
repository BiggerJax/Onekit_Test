//
//  OKLoading.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKLoading.h"

@interface OKLoading()

@end
static UIActivityIndicatorView *activityView;
static UIView *viewss;
static UIWindow *keyv;
static NSInteger count;
@implementation OKLoading
+(void)show
{
    UIView *view;
    if (viewss==Nil) {
        count = 0;
        viewss=[[UIView alloc] initWithFrame:CGRectMake(0, 0, keyv.frame.size.width, keyv.frame.size.height)];
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        view.alpha = 0.8;
        view.backgroundColor = [UIColor blackColor];
        view.layer.cornerRadius = 10;
        view.layer.masksToBounds = YES;
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activityView setCenter:CGPointMake(50, 50)];
        [view addSubview:activityView];
        [viewss addSubview:view];
        [activityView startAnimating];
        [viewss setBackgroundColor:[UIColor clearColor]];
        viewss.hidden=TRUE;
    }
    keyv = [[UIApplication sharedApplication]keyWindow];
    [view setCenter:CGPointMake(keyv.frame.size.width/2, keyv.frame.size.height/2)];
    [keyv addSubview:viewss];
    count++;
    viewss.hidden=FALSE;
    
}
+(void)hide
{
    count--;
    if (count<=1) {
        viewss.hidden=TRUE;
        [viewss removeFromSuperview];
        viewss = nil;
    }else{
        return ;
    }
}

@end

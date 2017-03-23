//
//  OKWeb.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKWeb.h"
#import "OKConfig.h"
#import "OKJson.h"

@interface OKWeb()

@end
@implementation OKWeb
+ (void)loadUrl:(NSString*)url params:(NSDictionary*)params webView:(UIWebView *)webView
{
    NSURL* uri = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:uri];
//    [request setValue:[OKConfig get:OKConfig_TOKEN] forHTTPHeaderField:@"COOKIE"];
    [request setValue:@"text/html" forHTTPHeaderField:@"content-type"];
    if(params){
        NSMutableData *data = [[NSMutableData alloc] init];
        [data appendData:[[OKJson stringify:params] dataUsingEncoding:NSUTF8StringEncoding]];
        request.HTTPBody = data;
    }
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    webView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    [webView loadRequest:request];
    [view addSubview:webView];

}

@end

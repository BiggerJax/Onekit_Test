//
//  OKRes.h
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 *  本地化加载
 */
@interface OKRes : NSObject
/*!
 *  加载本地化
 *  @param  key   键
 *  @return  返回字符串
 */
+(NSString*)loadLocalize:(NSString*)key;
/*!
 *  加载图像
 *  @param  key   键
 *  @return  返回图像
 */
@end

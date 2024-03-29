//
//  OKUI.h
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
 * 加载UI
 */
@interface OKUI : NSObject
/*!
 *  加载布局
 *  @param  path    路径
 *  @return 视图
 */
+ (id)load:(NSString*)path;
+ (id)loadNibNamed:(NSString*)name placeHolder:(UIView*)placeHolder;
@end

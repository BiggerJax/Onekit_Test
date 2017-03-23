//
//  UIViewController+OneKit.h
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (OneKit)
+ (UIViewController*)current;
- (void)callback:(dispatch_block_t)callback;
@end

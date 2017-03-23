//
//  OKLib.h
//  Onekit_Designer
//
//  Created by 袁杰 on 17/3/22.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKLib : NSObject
+ (OKLib *)loadBundle:(NSString*)name;
- (NSString*)pathForRes:(NSString*)path;
- (NSData*)loadData:(NSString*)path;
- (UIImage*)loadImage:(NSString*)path;
- (NSString*)loadString:(NSString*)path;
- (id)loadJSON:(NSString*)path;
@end

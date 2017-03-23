//
//  OKActions.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKActions.h"
#import "OKDialog.h"
#import "Macro.h"
#import "UIViewController+OneKit.h"
static OKActions *m_Instance = nil;

typedef void (^ActionSheetCallback)(int);

@interface OKActions ()<UIActionSheetDelegate,UIAlertViewDelegate>
@property (nonatomic, copy) ActionSheetCallback actionSheetCallback;
@end
@implementation OKActions
+ (id)shareInstance{
    if (isNull(m_Instance)) {
        m_Instance = [[OKActions alloc] init];
    }
    return m_Instance;
}
+(void)sheet:(NSString *)title actions:(NSArray *)actions index:(void (^)(int index))okCallback cancelCallback:(void (^)())cancelCallback{
    UIViewController* viewController = [UIViewController current];
    OKActions* ACTION = [self shareInstance];
    ACTION.actionSheetCallback = okCallback;
    UIActionSheet* actionSheet = [[UIActionSheet alloc]initWithTitle:title
                                                            delegate:ACTION
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:nil];
    
    for (NSString* titleString in actions) {
        [actionSheet addButtonWithTitle:titleString];
    }
    [actionSheet showInView:viewController.navigationController.navigationBar];
    cancelCallback();
}
@end

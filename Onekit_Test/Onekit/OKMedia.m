//
//  OKMedia.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/1.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKMedia.h"
#import "Macro.h"
#import "OKDialog.h"
#import "UIViewController+OneKit.h"
@interface OKMedia ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property  (nonatomic,strong)okCallback okCallback;
@property(nonatomic,strong)cancelCallback cancelCallback;
@property  (nonatomic,strong)VideoCallback videoCallback;
@property UIImage *m_image;
@end
static OKMedia *m_Instance = nil;
@implementation OKMedia
+ (id)shareInstance{
    if (isNull(m_Instance)) {
        m_Instance = [[OKMedia alloc] init];
    }
    return m_Instance;
}

+(void)openCamera:(UIViewController *)viewController okCallback:(okCallback)okCallback cancelCallback:(cancelCallback)cancelCallback{
    if(m_Instance==nil){
        [OKMedia shareInstance];
    m_Instance.okCallback = okCallback;
    //UIViewController* viewController = [UIViewController current];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        [OKDialog alert:@"当前相机不可用" callback:^{
            
        }];
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController*picker = [[UIImagePickerController alloc]init];
    picker.delegate = m_Instance;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [viewController presentViewController:picker animated:YES completion:Nil];//进入照相界面
    }

}

+(void)openLibrary:(UIViewController *)viewController okCallback:(okCallback)okCallback cancelCallback:(cancelCallback)cancelCallback{
    if(m_Instance==nil){
        [OKMedia shareInstance];
    }
    m_Instance.okCallback = okCallback;
    //UIViewController* ViewController = [UIViewController current];
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        // pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
    }
    pickerImage.delegate = m_Instance;
    pickerImage.allowsEditing = YES;
    [viewController presentViewController:pickerImage animated:YES completion:Nil];
}

+(void)openRecord:(VideoCallback)okCallback cancelCallback:(cancelCallback)cancelCallback{
    if(m_Instance==nil){
        [OKMedia shareInstance];
    }
    m_Instance.videoCallback = okCallback;
    UIViewController* viewController = [UIViewController current];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = m_Instance;
    picker.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        picker.videoQuality = UIImagePickerControllerQualityTypeMedium; //录像质量
        //picker.videoMaximumDuration = 600.0f; //录像最长时间
        picker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"当前设备不支持录像功能" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    //跳转到拍摄页面
    [viewController presentViewController:picker animated:YES completion:nil];

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.movie"]) {
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        _videoCallback(videoURL);
    }
    else{
        UIImage *image;
        if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){//如果打开相册
            image = [info objectForKey:UIImagePickerControllerEditedImage];
        }
        else{//照相机
            // [picker dismissModalViewControllerAnimated:YES];//关掉照相机
            image = [info objectForKey:UIImagePickerControllerEditedImage];
        }
        _okCallback(image);
    }
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}
@end

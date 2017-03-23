//
//  OKLbs.m
//  OnekitTool
//
//  Created by 袁杰 on 17/1/2.
//  Copyright © 2017年 onekit.cn. All rights reserved.
//

#import "OKLbs.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
@interface OKLbs (){
    CLLocationManager *_manager;
}
@property (nonatomic, strong) LocationBlock locationBlock;
@property (nonatomic) CLLocationCoordinate2D lastCoordinate;
@end
@implementation OKLbs
+(void)getLocation:(void (^)(CLLocationCoordinate2D))successCallback failureCallback:(void (^)())failureCallback{
    static OKLbs *lbs = nil;
    lbs = [self shareLocation];
    lbs.locationBlock = [successCallback copy];
    [lbs startLocation];
    failureCallback();
    
}
+ (OKLbs *)shareLocation{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

-(void)startLocation{
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        _manager=[[CLLocationManager alloc]init];
        _manager.delegate=self;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        [_manager requestAlwaysAuthorization];
        _manager.distanceFilter=100;
        [_manager startUpdatingLocation];
    }
    else
    {
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
        
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    CLLocation * location = [[CLLocation alloc]initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    _lastCoordinate = CLLocationCoordinate2DMake(location.coordinate.latitude ,location.coordinate.longitude);
    if (_locationBlock) {
        _locationBlock(_lastCoordinate);
        _locationBlock = nil;
    }
    [standard setObject:@(location.coordinate.latitude) forKey:CCLastLatitude];
    [standard setObject:@(location.coordinate.longitude) forKey:CCLastLongitude];
    
    [manager stopUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    [self stopLocation];
    
}
-(void)stopLocation
{
    _manager = nil;
}
@end

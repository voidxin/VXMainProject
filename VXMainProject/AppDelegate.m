//
//  AppDelegate.m
//  VXMainProject
//
//  Created by voidxin on 17/4/11.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "AppDelegate.h"
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXLoginServiceProtocol/VXLoginServiceProtocol.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //主项目中引入登录模块
    id <VXLoginServiceProtocol> loginPrivate = [VXProtocolManager serviceProvideForProtocol:@protocol(VXLoginServiceProtocol)];
    
    UIViewController *loginVC = [loginPrivate loginPageWithObject:@"object"];
    
    self.window = ({
        UIWindow *templeW = [[UIWindow alloc] init];
        templeW.rootViewController = loginVC;
        templeW.bounds = [UIScreen mainScreen].bounds;
        [templeW setBackgroundColor:[UIColor whiteColor]];
        templeW;
    });
    
    [self.window makeKeyWindow];
    
    return YES;
}

@end

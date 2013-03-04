//
//  AppDelegate.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import "BMapKit.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet MainTabViewController *mainTabViewCon;
//把这个放在KHHBMapViewController里的时候，查看完地图返回上个viewcontroller的时候程序会闪退
//故跟baidu提供的例子一样放在appdelegate类里
@property (strong, nonatomic) BMKMapManager *mapManager;
@end

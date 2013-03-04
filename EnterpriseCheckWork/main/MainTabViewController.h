//
//  MainTabViewController.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviViewControllerToUse.h"

@interface MainTabViewController : UITabBarController
@property (weak, nonatomic) IBOutlet NaviViewControllerToUse *naviCustomerManage;
@property (weak, nonatomic) IBOutlet NaviViewControllerToUse *StatisticalAnalysis;
@property (weak, nonatomic) IBOutlet NaviViewControllerToUse *DataReporting;
@property (weak, nonatomic) IBOutlet NaviViewControllerToUse *organizationalStructure;
@property (weak, nonatomic) IBOutlet NaviViewControllerToUse *more;
@end

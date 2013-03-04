//
//  KHHViewManagerUtils.h
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//  主要是把界面重要的一些方法集中

#import <Foundation/Foundation.h>

@interface KHHViewManagerUtils : NSObject
//界面的navigationBar添加rightBarItem 项目默认的格式（）
+(UIButton *) addDefaultRightBarItemByName:(NSString *) barName target:(UIViewController *) viewController isLeft:(BOOL) isLeft;


//界面的navigationBar添加rightBarItem 只添加一个空button,样式要在外面自己设置
+(UIButton *) addSingleRightBarItemByName:(NSString *) barName frame:(CGRect) frame target:(UIViewController *) viewController;

@end

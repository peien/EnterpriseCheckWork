//
//  KHHViewManagerUtils.m
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "KHHViewManagerUtils.h"

@implementation KHHViewManagerUtils
//界面的navigationBar添加rightBarItem 项目默认的格式（）
+(UIButton *) addDefaultRightBarItemByName:(NSString *) barName target:(UIViewController *) viewController isLeft:(BOOL) isLeft
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //背景图
    [btn setBackgroundImage:[[UIImage imageNamed:@"titlebtn_normal"] stretchableImageWithLeftCapWidth:8 topCapHeight:2] forState:UIControlStateNormal];
    
    //设置默认frame
    if (isLeft) {
        btn.frame = CGRectMake(0, 0, 70, 30);
    }else {
        btn.frame = CGRectMake(240, 0, 70, 30);
    }
    //设置标题
    [btn setTitle:NSLocalizedString(barName, @"") forState:UIControlStateNormal];
    //设置字体
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    //设置navigate bar
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if (isLeft) {
        viewController.navigationItem.leftBarButtonItem = bar;
    }else {
        viewController.navigationItem.rightBarButtonItem = bar;
    }
    return btn;
}


//界面的navigationBar添加rightBarItem 添加一个右边下拉背景图的按钮
+(UIButton *) addSingleRightBarItemByName:(NSString *) barName frame:(CGRect) frame target:(UIViewController *) viewController
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置默认frame
    btn.frame = frame;
    //设置标题
    [btn setTitle:NSLocalizedString(barName, @"") forState:UIControlStateNormal];
    //设置字体
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    //设置navigate bar
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    viewController.navigationItem.rightBarButtonItem = bar;
    
    return btn;
}
@end

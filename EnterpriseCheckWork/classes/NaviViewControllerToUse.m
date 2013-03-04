//
//  NaviViewControllerToUse.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "NaviViewControllerToUse.h"
#import "KHHViewManagerUtils.h"

@interface NaviViewControllerToUse ()

@end

@implementation NaviViewControllerToUse

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"title_bg"] forBarMetrics:UIBarMetricsDefault]; 
    
	// Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    UIButton *leftBtn = [KHHViewManagerUtils addDefaultRightBarItemByName:@"返回" target:viewController isLeft:true];
    [leftBtn addTarget:self action:@selector(leftBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)leftBarButtonClick:(id)sender
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

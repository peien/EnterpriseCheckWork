//
//  DetailViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "DetailViewController.h"
#import "SubCardView.h"
#import "WEPopoverContainerView.h"
#import "KHHFloatBarController.h"
#import "SubPlanView.h"

@interface DetailViewController ()
{
    DetailHeadView * _headView;
    SubCardView *_subCardView;
    SubPlanView *_subPlanView;
    
    WEPopoverController *_popover;
    KHHFloatBarController *_floatBarViewCon;
}

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _headView  = [[DetailHeadView alloc]init];
        _headView.titleArr = [[NSArray alloc]initWithObjects:@"基本信息",@"拜访记录",@"数据记录",@"客户评估",nil];
        _headView.delegate = self;
    }
    return self;
}

- (void)setInterCustomer:(InterCustomer *)interCustomer
{
    _interCustomer = interCustomer;
    _headView.interCustomer = interCustomer;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];     
    [self.view addSubview:_headView];
    _subCardView = [[SubCardView alloc]initWithFrame:CGRectMake(0, 100, 320, self.view.frame.size.height-44-100)];
    
    _subPlanView = [[SubPlanView alloc]initWithFrame:CGRectMake(0, 100, 320, self.view.frame.size.height-44-100)];
    
    [self.view addSubview:_subCardView];
    [self.view addSubview:_subPlanView];
    
    
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action head delegate

- (void)showPopVp:(InterCustomer *)interCustomer
{
    if(!_floatBarViewCon){
        _floatBarViewCon = [[KHHFloatBarController alloc] initWithNibName:nil bundle:nil];
        _floatBarViewCon.viewController = self;
    }
    if (!_popover) {
        _popover = [[WEPopoverController alloc] initWithContentViewController:_floatBarViewCon];
    }
    if (!_floatBarViewCon.popover) {
        _floatBarViewCon.popover = _popover;
    }
    CGRect cellRect = CGRectMake(3, 7, 50, 47);
    // cellRect.origin.x = 0;
    CGRect rect = [_headView convertRect:cellRect toView:self.view];
//    rect.origin.x = 20;
   
    [_popover presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (void)headClick:(int)tag
{
    switch (tag) {
        case 0:
            [self.view bringSubviewToFront:_subCardView];
            break;           
        case 1:
            [self.view bringSubviewToFront:_subPlanView];
            break;
        case 2:
            [self.view bringSubviewToFront:_subCardView];
            break;
        case 3:
            [self.view bringSubviewToFront:_subPlanView];
            break;
        default:
            break;
    }
}
@end

//
//  CustomerListViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "CustomerListViewController.h"
#import "CustomerSearchBar.h"
#import "WEPopoverController.h"
#import "KHHFloatBarController.h"

#import "DetailViewController.h"

@interface CustomerListViewController ()
{
    GroupTable *_groupTable;
    CustomerTable *_customerTable;
    UISearchDisplayController *_searchDisplayController;
    CustomerSearchBar *_searchBar;
    
    WEPopoverController *_popover;
    KHHFloatBarController *_floatBarViewCon;
}

@end

@implementation CustomerListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _groupTable = [[GroupTable alloc]init];
        _groupTable.groupActionDelegate = self;
        _customerTable = [[CustomerTable alloc]init];
        _customerTable.isCoWorker = NO;
        _customerTable.customerCellDelegate = self;
        _customerTable.addCustomerCellDelegate = self;
        
        _searchBar = [[CustomerSearchBar alloc]init];       
        _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
        
        for (int i=0; i<10; i++) {
            InterGroup *interGroup = [[InterGroup alloc]init];
            interGroup.id = [NSString stringWithFormat:@"%d",i];
            interGroup.name = @"所有";
            [_groupTable.arrGroupList addObject:interGroup];
            
            InterCustomer *interCustomer = [[InterCustomer alloc]init];
            interCustomer.id = [NSString stringWithFormat:@"%d",i];
            interCustomer.name = @"jone";
            interCustomer.roleType = @"毒品调剂师";
            interCustomer.mobileList = @"13645457885|13556894578";
            interCustomer.companyName = @"金山角毒品交易集团";
            [_customerTable.arrCustomerList addObject:interCustomer];
        }
        
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _groupTable.frame = CGRectMake(0, 44, 75, self.view.frame.size.height-44);
    _customerTable.frame = CGRectMake(76,44,245,self.view.frame.size.height-44);
    
    [self.view addSubview:_searchBar];
	[self.view addSubview:_groupTable];
    [self.view addSubview:_customerTable];
    
}


#pragma mark - GroupCellDelegate
- (void)oneTouchGroup:(InterGroup *)interGroup
{
    NSLog(@"oneTouchGroup%@",interGroup.id);
}

- (void)towTouchGroup:(InterGroup *)interGroup
{
    NSLog(@"towTouchGroup%@",interGroup.id);
}

#pragma mark - actionCustomer delegate

- (void)showPopVp:(CustomerCell *)customerCell
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
    CGRect cellRect = customerCell.frame;
   // cellRect.origin.x = 0;
    CGRect rect = [_customerTable convertRect:cellRect toView:self.view];
    rect.origin.x = 20;
    UIPopoverArrowDirection arrowDirection = rect.origin.y < self.view.bounds.size.height/2?UIPopoverArrowDirectionUp:UIPopoverArrowDirectionDown;
    [_popover presentPopoverFromRect:rect inView:self.view permittedArrowDirections:arrowDirection animated:YES];
    // NSLog(@"showPopVp%@",interCustomer.id);
    
}

- (void)showDetail:(CustomerCell *)customerCell
{
    DetailViewController *detailViewCon = [[DetailViewController alloc]init];
    detailViewCon.interCustomer = customerCell.interCustomer;
    [self.navigationController pushViewController:detailViewCon animated:YES];
   //  NSLog(@"showDetail%@",interCustomer.id);
}

- (void)addNew
{
    NSLog(@"addNew");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

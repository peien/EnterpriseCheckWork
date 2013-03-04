//
//  CompetitorsViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "CompetitorsViewController.h"
#import "CustomerSearchBar.h"
#import "WEPopoverController.h"
#import "KHHFloatBarController.h"

#import "DetailViewController.h"

@interface CompetitorsViewController ()
{
    CustomerTable *_customerTable;
    UISearchDisplayController *_searchDisplayController;
    CustomerSearchBar *_searchBar;
}

@end

@implementation CompetitorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _customerTable = [[CustomerTable alloc]init];
        _customerTable.isCoWorker = NO;
        _customerTable.customerCellDelegate = self;
        _customerTable.addCustomerCellDelegate = self;
        
        _searchBar = [[CustomerSearchBar alloc]init];
        _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
        for (int i=0; i<10; i++) {
           
            
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
    _customerTable.frame = CGRectMake(0,44,320,self.view.frame.size.height-44);
    
    [self.view addSubview:_searchBar];
    [self.view addSubview:_customerTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

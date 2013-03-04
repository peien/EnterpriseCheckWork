//
//  CustomerListViewController.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupTable.h"
#import "CustomerTable.h"

@interface CustomerListViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate,GroupCellDelegate,CustomerCellDelegate,AddCustomerCellDelegate>

@end

//
//  SubPlanView.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterCustomer.h"

@interface SubPlanView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)InterCustomer *interCustomer;
@end

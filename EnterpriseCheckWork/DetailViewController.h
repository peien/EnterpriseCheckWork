//
//  DetailViewController.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterCustomer.h"
#import "DetailHeadView.h"

@interface DetailViewController : UIViewController<DetailHeadViewDelegate>
@property(nonatomic,strong)InterCustomer *interCustomer;
@end

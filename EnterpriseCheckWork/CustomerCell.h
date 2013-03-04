//
//  CustomerCell.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterCustomer.h"
@class CustomerCell;
@protocol CustomerCellDelegate <NSObject>
@optional
- (void)showPopVp:(CustomerCell *)customerCell;
- (void)showDetail:(CustomerCell *)customerCell;
@end


@interface CustomerCell : UITableViewCell

@property(nonatomic,strong)InterCustomer *interCustomer;
@property(nonatomic,assign)Boolean isCoWorker;
@property(nonatomic,strong)id<CustomerCellDelegate> delegate;

@end

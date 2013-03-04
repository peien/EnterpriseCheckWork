//
//  GroupCell.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterGroup.h"
@protocol GroupCellDelegate <NSObject>
@optional
- (void)oneTouchGroup:(InterGroup *)interGroup;
- (void)towTouchGroup:(InterGroup *)interGroup;
@end

@interface GroupCell : UITableViewCell

@property(nonatomic,strong)InterGroup *interGroup;
@property(nonatomic,strong)id<GroupCellDelegate> delegate;
@end

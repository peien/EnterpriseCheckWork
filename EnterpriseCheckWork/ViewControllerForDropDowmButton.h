//
//  ViewControllerForDropDowmButton.h
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-1.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"
@interface ViewControllerForDropDowmButton : UIViewController
//当前显示的分组名称
@property (assign, nonatomic) int       groupIndex;
//当前显示的分组
@property (strong, nonatomic) Group     *currentGroup;
-(void) updateButtonTitle:(NSString *) newTitle;
@end

//
//  DetailHeadView.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterCustomer.h"

@protocol DetailHeadViewDelegate <NSObject>
@optional
- (void)headClick:(int)tag;
- (void)showPopVp:(InterCustomer *)interCustomer;
@end

@interface DetailHeadView : UIView

@property(nonatomic,strong)InterCustomer *interCustomer;

@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *viewArr;
@property(nonatomic,strong)id<DetailHeadViewDelegate> delegate;

@end

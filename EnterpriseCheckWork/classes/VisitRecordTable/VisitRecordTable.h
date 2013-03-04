//
//  VisitRecordTable.h
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//  所有数据在这里查询，
//

#import <UIKit/UIKit.h>
#import "VisitRecordCell.h"
//拜访计划类型
typedef enum {
    KHHVisitRecordAll          = 1,
    KHHVisitRecordExecuting,
    KHHVisitRecordOverdue,
    KHHVisitRecordFinished,
} KHHVisitRecordType;

#pragma mark -- visitRecordTable的委托类，主要是用于table内嵌在不同界面时，点击某行后的操作
@protocol VisitRecordTableDelegate <NSObject>
@optional
-(void) selectRowAtIndexPath:(NSIndexPath *) indexPath schedule:(Schedule *) schedule;
@end


@interface VisitRecordTable : UITableView <UITableViewDataSource, UITableViewDelegate>
//table点击某行的委托
@property (nonatomic, strong) id<VisitRecordTableDelegate> rowClickDelegate;
//cell里btn点击事件
@property (nonatomic, strong) id<VisitRecordCellDelegate>  cellBtnClickDelegate;

#pragma mark -- 通过日期来更新拜访计划(查询日期当天的拜访计划)
-(BOOL) updateTableByDate:(NSDate *) date;
#pragma mark -- 通过日期来更新拜访计划(查询日期以后的拜访计划)
-(BOOL) updateTableAfterDate:(NSDate *) date;
#pragma mark -- 通过日期来更新拜访计划(查询当天的拜访计划)
-(BOOL) updateTableByVisitRecordType:(KHHVisitRecordType) type;
@end

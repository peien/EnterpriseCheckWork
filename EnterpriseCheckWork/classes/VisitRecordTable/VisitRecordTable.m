//
//  VisitRecordTable.m
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "VisitRecordTable.h"
#import "Schedule.h"
#import "Address.h"
@interface VisitRecordTable()
{
    NSMutableArray * visitRecordList;
}
@end


@implementation VisitRecordTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}



#pragma mark - tableview dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [visitRecordList count];
    //test return 10
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"VisitRecordCell";
    VisitRecordCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
//        cell = [[VisitRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"VisitRecordCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = _cellBtnClickDelegate;
    }
    
    //获取相当行的计划信息
    if (visitRecordList.count > 0) {
        Schedule *schedule = [visitRecordList objectAtIndex:indexPath.row];
        cell.schedule = schedule;
    }else {
        //测试
        cell.schedule = nil;
    }
    return cell;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 102;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中行操作
//    if (visitRecordList.count > 0 && _rowClickDelegate && [_rowClickDelegate respondsToSelector:@selector(selectRowAtIndexPath:schedule:)]) {
        Schedule *schedule = [visitRecordList objectAtIndex:indexPath.row];
        [_rowClickDelegate selectRowAtIndexPath:indexPath schedule:schedule];
//    }
    
    NSLog(@"%@%d%@",@"点击第",indexPath.row,@"行");
}

#pragma mark -- 通过日期来更新拜访计划(查询日期当天的拜访计划)
-(BOOL) updateTableByDate:(NSDate *) date
{
    return YES;
}
#pragma mark -- 通过日期来更新拜访计划(查询日期以后的拜访计划)
-(BOOL) updateTableAfterDate:(NSDate *) date
{
    return YES;
}
#pragma mark -- 通过日期来更新拜访计划(查询当天的拜访计划)
-(BOOL) updateTableByVisitRecordType:(KHHVisitRecordType) type
{
     return YES;   
}
@end

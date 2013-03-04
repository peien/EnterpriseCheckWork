//
//  KHHVisitCalendarCell.h
//  CardBook
//
//  Created by 王国辉 on 12-8-23.
//  Copyright (c) 2012年 KingHanHong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
@protocol VisitRecordCellDelegate<NSObject>
- (void)KHHVisitRecordCellBtnClick:(id)sender schedule:(Schedule *) schedule;
@end
@interface VisitRecordCell : UITableViewCell
@property (strong, nonatomic) Schedule *schedule;
@property (assign, nonatomic) id<VisitRecordCellDelegate> delegate;

//闹铃
@property (strong, nonatomic) IBOutlet UIButton    *noticeBtn;
//小图标
@property (strong, nonatomic) IBOutlet UIButton    *photoBtn;
//签到按钮
@property (strong, nonatomic) IBOutlet UIButton    *finishBtn;
//拜访对象内容
@property (strong, nonatomic) IBOutlet UILabel     *visitCustomerLab;
//拜访地址内容
@property (strong, nonatomic) IBOutlet UILabel     *addressLab;
//备注内容
@property (strong, nonatomic) IBOutlet UILabel     *visitNoteLab;
//定位按钮
@property (strong, nonatomic) IBOutlet UIButton    *showLocationBtn;
//拜访时间
@property (strong, nonatomic) IBOutlet UILabel     *visitDateLab;

//cell里按钮点击事件
- (IBAction)cellBtnClick:(id)sender;
@end

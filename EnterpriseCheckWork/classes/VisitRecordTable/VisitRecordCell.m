//
//  KHHVisitCalendarCell.m
//  CardBook
//
//  Created by 王国辉 on 12-8-23.
//  Copyright (c) 2012年 KingHanHong. All rights reserved.
//

#import "VisitRecordCell.h"
#import "Address.h"
#import "Card.h"
#import "NSString+SM.h"
#import "Company.h"
#import "KHHKeys.h"

@implementation VisitRecordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//更新数据源时把界面也要更新一下
-(void) setSchedule:(Schedule *)schedule
{
    _schedule = schedule;
    
    UIImage *imgBtn = [[UIImage imageNamed:@"tongbu_normal.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 8, 0, 8)];
    [self.finishBtn setBackgroundImage:imgBtn forState:UIControlStateNormal];
    //是否有图片
    if ([schedule.images allObjects].count > 0) {
        //显示有图的图标
        self.photoBtn.hidden = NO;
    }
    //拜访日期
    if (schedule.plannedDate != nil) {
        NSDateFormatter *form = [[NSDateFormatter alloc] init];
        [form setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *date = [form stringFromDate:schedule.plannedDate];
        self.visitDateLab.text = date;
    }
    //拜访对象 (customer里的存放的是用户手动输入的客户，可能不是联系人)
    if (schedule.targets != nil || schedule.customer) {
        NSMutableString *names = [[NSMutableString alloc] init];
        //先添加到用户手动输入的
        if (schedule.customer) {
            [names appendString:schedule.customer];
        }
    //
        //循环添加联系人
            if (schedule.targets) {
                NSArray *objects = [schedule.targets allObjects];
                for (int i = 0; i < objects.count; i++) {
                    Card *cardObj = [objects objectAtIndex:i];
                    //用分号与前一个分开
                    if (names.length > 0) {
                        [names appendString:KHH_SEMICOLON];
                    }
        //
                    //姓名
                    NSString *name = [NSString stringByFilterNilFromString:cardObj.name];
                    if (name.length) {
                        [names appendString:[NSString stringWithFormat:@"%@",name]];
                    }else {
                        //名称为空时添加一个空格作为标识
                        [names appendString:@" "];
                    }
        //
                    //公司
                    if (cardObj.company && cardObj.company.name && cardObj.company.name.length > 0) {
                        NSString *company = [NSString stringByFilterNilFromString:cardObj.company.name];
                        if (company.length) {
                            [names appendString:[NSString stringWithFormat:@"(%@)",company]];
                        }
                    }
                }
            }

        self.visitCustomerLab.text = names;
    }
    //地址
    if (schedule.address.other.length > 0) {
        NSString *p = [NSString stringByFilterNilFromString:schedule.address.province];
        NSString *c = [NSString stringByFilterNilFromString:schedule.address.city];
        NSString *o = [NSString stringByFilterNilFromString:schedule.address.other];
        //直辖市只取一个
        if (p && c && [p isEqualToString:c]) {
            self.addressLab.text = [NSString stringWithFormat:@"%@%@",p,o];
        }else {
            self.addressLab.text = [NSString stringWithFormat:@"%@%@%@",p,c,o];
        }
    }
    //备注
    if (schedule.content.length > 0) {
        self.visitNoteLab.text = schedule.content;
    }
    //是否完成
    BOOL isFinished = [schedule.isFinished isEqualToNumber:[NSNumber numberWithBool:YES]];
    if (isFinished) {
        self.finishBtn.hidden = YES;
    }else{
        self.finishBtn.hidden = NO;
    }
    //
    //铃铛显示与隐藏
    //显示条件(未完成的拜访计划、有提醒并且没有提醒过的)
    int remindVaule = schedule.minutesToRemindValue;
    NSLog(@"visit plant remindValue = %d",remindVaule);
    NSDate * remindTime = [schedule.plannedDate dateByAddingTimeInterval:-remindVaule * 60];
    //这两个时间都没有考虑时区的，因为求差，只要两个时间都用同一时区就可以
    NSLog(@"visit plant remindDate = %@",remindTime);
    NSTimeInterval interval = [remindTime timeIntervalSinceNow];
    NSLog(@"visit plant now = %@, interval = %f",[NSDate new],interval);
    if (remindVaule > 0 && !isFinished && interval > 0.0f) {
        self.noticeBtn.hidden = NO;
    }
    
    //数据库为空，所以数据都用假数据
    self.visitCustomerLab.text = @"张三丰";
    self.addressLab.text = [NSString stringWithFormat:@"%@%@%@", @"浙江省", @"杭州市", @"滨江区南环路4280号501室"];
    self.visitNoteLab.text = @"这是一些测试数据,看到数据后别太高兴了";
    self.noticeBtn.hidden = NO;
}

- (IBAction)cellBtnClick:(id)sender
{
    //具体执行交给具体界面
    if (_delegate && [_delegate respondsToSelector:@selector(KHHVisitRecordCellBtnClick:schedule:)]) {
        [_delegate KHHVisitRecordCellBtnClick:sender schedule:_schedule];
    }
}
@end

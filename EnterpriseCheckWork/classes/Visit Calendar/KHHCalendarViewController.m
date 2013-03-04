//
//  KHHCalendarViewController.m
//  CardBook
//
//  Created by 王国辉 on 12-8-22.
//  Copyright (c) 2012年 KingHanHong. All rights reserved.
//

#import "KHHCalendarViewController.h"
#import "CKCalendarView.h"
#import "VisitRecordCell.h"
#import "VisitRecordTable.h"
#import "KHHViewAdapterUtil.h"


@interface KHHCalendarViewController ()<CKCalendarDelegate, VisitRecordTableDelegate, VisitRecordCellDelegate>
@property (strong, nonatomic) NSDate *dateSelect;
@property (strong, nonatomic) CKCalendarView       *calView;
@property (strong, nonatomic) NSArray              *schedus;
@property (strong, nonatomic) VisitRecordTable *visitView;
@end

@implementation KHHCalendarViewController
@synthesize theTable = _theTable;
@synthesize dateSelect;
@synthesize calView;
@synthesize card;
@synthesize schedus;
@synthesize visitView;
@synthesize isneedReloadeVisitTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"拜访日历", nil);
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startSunday card:self.card];
    self.calView = calendar;
    calendar.delegate = self;
    calendar.frame = CGRectMake(35, 28, 245, 160);
    //calendar.frame = CGRectMake(60, 28, 200, 208);
    [self.view addSubview:calendar];
    //默认显示今天的
    NSDateFormatter *formt = [[NSDateFormatter alloc] init];
    [formt setDateFormat:@"yyyy-MM-dd"];
    NSString *dateS = [formt stringFromDate:[NSDate date]];
    
    //初始化拜访计划table
    visitView = [[VisitRecordTable alloc] init];
    visitView.rowClickDelegate = self;
    visitView.cellBtnClickDelegate = self;
    visitView.backgroundColor = [UIColor clearColor];
    CGRect rect = self.calView.frame;
    visitView.frame = CGRectMake(0, rect.origin.y + rect.size.height + 44 + 10, self.view.frame.size.width, self.view.frame.size.height - rect.size.height - rect.origin.y - 10);
    [self.view addSubview:self.visitView];
    NSLog(@"init CKCalendarView.frame=========(%d,%d,%d,%d)",(int)self.calView.frame.origin.x,(int)self.calView.frame.origin.y,(int)self.calView.frame.size.width,(int)self.calView.frame.size.height);
    NSLog(@"init visitView.frame=========(%d,%d,%d,%d)",(int)visitView.frame.origin.x,(int)visitView.frame.origin.y,(int)visitView.frame.size.width,(int)visitView.frame.size.height);
    //日历默认选择当天
    [self.calView setSelectedDate:[formt dateFromString:dateS]];
    
    //iphone5 适配
    [KHHViewAdapterUtil checkIsNeedAddHeightForIphone5:visitView];
    [KHHViewAdapterUtil checkIsNeedMoveDownForIphone5:_addBtn];
    [KHHViewAdapterUtil checkIsNeedMoveDownForIphone5:_allBtn];
}
- (void)viewWillAppear:(BOOL)animated{
    if (self.isneedReloadeVisitTable) {
//        if ([self.card isKindOfClass:[ReceivedCard class]]) {
//            self.card = [[KHHDataNew sharedData]receivedCardByID:self.card.id];
//        }else if ([self.card isKindOfClass:[PrivateCard class]]){
//            self.card = [[KHHDataNew sharedData] privateCardByID:self.card.id];
//        }
//        self.visitView.card = self.card;
//        //如果某条拜访计划的日期发生变化后，要定位到相应的日期
//        if (self.changedDate) {
//            [self.calView setSelectedDate:self.changedDate];
//            NSDateFormatter *formt = [[NSDateFormatter alloc] init];
//            [formt setDateFormat:@"yyyy-MM-dd"];
//            NSString *dateS = [formt stringFromDate:self.changedDate];
//            visitView.selectedDate = [formt dateFromString:dateS];
//            self.changedDate = nil;
//        }
        
//        [self.visitView reloadTheTable];
    }
}
- (void)viewDidAppear:(BOOL)animated{
  //  [self.calView layoutSubviews];

}
- (void)viewWillDisappear:(BOOL)animated{
   
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    _theTable = nil;
    self.addBtn = nil;
    self.dateSelect = nil;
    self.calView = nil;
    self.card = nil;
    self.schedus = nil;
    self.visitView = nil;
}

//日期选择后，要判断是要显示何种类型的数据
- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    NSDate *selectedNewDate = [date dateByAddingTimeInterval:8*60*60];//用与判断添加按钮是否隐藏
    self.dateSelect = selectedNewDate;//用于拜访界面的日期显示
    NSLog(@"date click ====== selectedNewDate is %@!",selectedNewDate);
    NSDate *now = [NSDate date];
    NSLog(@"NOW IS %@",now);
//    double timerIntervNow = [now timeIntervalSince1970];
//     NSDate *selectedDateBtn = [date dateByAddingTimeInterval:24*60*60];
//    double timerIntervSelected = [selectedDateBtn timeIntervalSince1970];
//    
//    if (timerIntervSelected - timerIntervNow > 0) {
//        NSLog(@"将来");
//        self.addBtn.hidden = NO;
//    }else if (timerIntervSelected - timerIntervNow < 0){
//        NSLog(@"过去");
//        self.addBtn.hidden = YES;
//    }else if (timerIntervSelected - timerIntervNow == 0){
//        NSLog(@"");
//    }
    
//    self.visitView.card = self.card;
    [visitView updateTableByDate:self.dateSelect];
}
- (void)calendarChangeFrame:(CKCalendarView *)calendar
{
    CGRect rect = calendar.frame;
    //44是nagativebar的高度，10是table与calendar的间隔
    visitView.frame = CGRectMake(0, rect.origin.y + rect.size.height + 10, self.view.frame.size.width, self.view.frame.size.height - rect.size.height - rect.origin.y - 10);
}

#pragma mark -- VisitRecordTableDelegate 主要是来操作table某行点中后的逻辑
-(void) selectRowAtIndexPath:(NSIndexPath *) indexPath schedule:(Schedule *) schedule
{
    NSLog(@"KHHCalendarViewController ========== 点击了%d行！！！！",indexPath.row);
}

#pragma mark -- VisitRecordCellDelegate 主要执行cel里那些按钮点击后的逻辑
- (void)KHHVisitRecordCellBtnClick:(id)sender schedule:(Schedule *) schedule
{
    UIButton *btn = (UIButton *) sender;
    switch (btn.tag) {
        case 222:
        {
            //铃铛
            NSLog(@"KHHCalendarViewController ========== 点击了铃铛！！！！");
        }
            break;
        case 223:
        {
            //签到
            NSLog(@"KHHCalendarViewController ========== 点击了签到！！！！");
        }
            break;
        case 224:
        {
            //定位
            NSLog(@"KHHCalendarViewController ========== 点击了定位！！！！");
        }
            break;
        default:
            break;
    }
}


- (IBAction)plusBtnClick:(id)sender{

}

- (IBAction)allBtnClick:(id)sender {

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

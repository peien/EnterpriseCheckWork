//
//  KHHFunnelViewController.m
//  CardBook
//
//  Created by 王国辉 on 12-8-22.
//  Copyright (c) 2012年 KingHanHong. All rights reserved.
//

#import "KHHFunnelViewController.h"
//#import "KHHData+UI.h"
#import "KHHDataNew+Card.h"
#import "Group.h"
#import "EmptyNoticeView.h"

#define KHH_Empty_Value_Notice_Text @"        当您在客户详情-评估分析中对其进行相应评级后，系统会根据您的评级自动统计出客户的价值排序统计报表"


@interface KHHFunnelViewController (){
    BOOL isNeedReloadTable;
    EmptyNoticeView *noticeView;
}
@property (strong, nonatomic) KHHDataNew *dataCtrl;
@property (strong, nonatomic) NSMutableDictionary *allDic;

@end

@implementation KHHFunnelViewController
@synthesize dataCtrl;
@synthesize allDic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"价值漏斗";
        self.dataCtrl = [KHHDataNew sharedData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:241 green:238 blue:232 alpha:1.0]];
    self.allDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [self refresh];
}

-(void) viewWillAppear:(BOOL)animated {
    if (isNeedReloadTable) {
        isNeedReloadTable = NO;
        //刷新当前组
        [self refresh];
    }
}

- (void)refresh{
    if (!self.currentGroup) {
        [self updateButtonTitle:nil];
    }else{
        [self updateButtonTitle:self.currentGroup.name];
    }
    
    NSNumber *groupId = nil;
    if (self.currentGroup) {
        groupId = self.currentGroup.id;
    }
    
    NSArray *oneStarsArr = [[KHHDataNew sharedData] cardsofStarts:1.0 groupId:groupId];
    NSArray *twoStarsArr = [[KHHDataNew sharedData] cardsofStarts:2.0 groupId:groupId];
    NSArray *threeStarsArr = [[KHHDataNew sharedData] cardsofStarts:3.0 groupId:groupId];
    NSArray *fourStarsArr = [[KHHDataNew sharedData] cardsofStarts:4.0 groupId:groupId];
    NSArray *fiveStarsArr = [[KHHDataNew sharedData] cardsofStarts:5.0 groupId:groupId];
    NSInteger totalCount = oneStarsArr.count + twoStarsArr.count + threeStarsArr.count + fourStarsArr.count + fiveStarsArr.count;
    [self.allDic setObject:oneStarsArr forKey:@"oneStar"];
    [self.allDic setObject:twoStarsArr forKey:@"twoStar"];
    [self.allDic setObject:threeStarsArr forKey:@"threeStar"];
    [self.allDic setObject:fourStarsArr forKey:@"fourStar"];
    [self.allDic setObject:fiveStarsArr forKey:@"fiveStar"];
    self.lab1.text = [NSString stringWithFormat:@"%d",oneStarsArr.count];
    self.lab2.text = [NSString stringWithFormat:@"%d",twoStarsArr.count];
    self.lab3.text = [NSString stringWithFormat:@"%d",threeStarsArr.count];
    self.lab4.text = [NSString stringWithFormat:@"%d",fourStarsArr.count];
    self.lab5.text = [NSString stringWithFormat:@"%d",fiveStarsArr.count];
    
    //判断个数是否为空
    if (totalCount <= 0) {
        if (!noticeView) {
            noticeView = [[EmptyNoticeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) imageName:@"crm_leida@2x" text:KHH_Empty_Value_Notice_Text];
            [self.view addSubview:noticeView];
        }
        noticeView.hidden = NO;
        _contentView.hidden = YES;
        return;
    }else {
        if (noticeView) {
            noticeView.hidden = YES;
        }
        
        _contentView.hidden = NO;
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.dataCtrl = nil;
    self.lab1 = nil;
    self.lab2 = nil;
    self.lab3 = nil;
    self.lab4 = nil;
    self.lab5 = nil;
    self.allDic = nil;
}

- (IBAction)btnClick:(UIButton *)sender{
    DLog(@"btnClick!");
    isNeedReloadTable = YES;
//    KHHValueViewController *valueVC = [[KHHValueViewController alloc] initWithNibName:nil bundle:nil];
//    switch (sender.tag) {
//        case 100:
//            valueVC.generArr = [self.allDic objectForKey:@"oneStar"];
//            valueVC.value = 1;
//            break;
//        case 101:
//            valueVC.generArr = [self.allDic objectForKey:@"twoStar"];
//            valueVC.value = 2;
//            break;
//        case 102:
//            valueVC.generArr = [self.allDic objectForKey:@"threeStar"];
//            valueVC.value = 3;
//            break;
//        case 103:
//            valueVC.generArr = [self.allDic objectForKey:@"fourStar"];
//            valueVC.value = 4;
//            break;
//        case 104:
//            valueVC.generArr = [self.allDic objectForKey:@"fiveStar"];
//            valueVC.value = 5;
//            break;
//        default:
//            break;
//    }
    
//    //把当前分组的id传过去
//    if (self.currentGroup) {
//        valueVC.groupID = self.currentGroup.id.longValue;
//    }else{
//        valueVC.groupID = -1;
//    }
    
    //指明界面的类型
//    valueVC.valueType = KHHCustomerVauleFunnel;
//    [self.navigationController pushViewController:valueVC animated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark KHHFilterPopup delegate
- (void)selectInAlert:(id)obj{
    
    if (!obj) {        
        self.groupIndex = 0;
        if (!self.currentGroup) {
            return;
        }
        self.currentGroup = nil;
        [self refresh];
        return;
    }
    
    NSDictionary *dic = (NSDictionary *)obj;
    self.groupIndex = [[dic objectForKey:@"groupIndex"] intValue];
    Group *grp = (Group *)[dic objectForKey:@"obj"];
    if (!self.currentGroup || self.currentGroup.id != grp.id) {
        self.currentGroup = grp;
        [self refresh];
        
    } 
   
}

@end

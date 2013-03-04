//
//  CustomerManagementViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "CustomerManagementViewController.h"
#import "CustomerListViewController.h"
#import "ImportCustomerViewController.h"
#import "KHHCalendarViewController.h"
#import "CompetitorsViewController.h"
#import "KHHPlanViewController.h"

@interface CustomerManagementViewController ()

@end

@implementation CustomerManagementViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"客户管理";
}

- (void)initArrParam
{
    NSArray *arrImgPro = [[NSArray alloc]initWithObjects:@"crm_leida",@"crm_leida",@"crm_leida",@"crm_leida",@"crm_leida",@"crm_leida",@"crm_leida",@"crm_leida", nil];
    NSArray *arrImgSelectPro = [[NSArray alloc]initWithObjects:@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected",@"crm_leida_selected", nil];
    NSArray *arrLabelPro = [[NSArray alloc]initWithObjects:@"客户列表",@"导入客户",@"竞争对手",@"拜访登记",@"新建拜访计划",@"拜访日历",@"拜访记录",@"同步", nil];
    for (int i=0; i<8; i++) {
        UnitForStyleBox *box = [[UnitForStyleBox alloc]initWithImgStr:arrImgPro[i] imgSelectStr:arrImgSelectPro[i] labelStr:arrLabelPro[i]];
        box.tag = i;
        [self.arrParam addObject:box];
    }    
}

#pragma mark - button action
- (void)buttonClick:(id)sender
{
    UIButton *butPro = (UIButton *)sender;
    switch (butPro.tag) {
        case 0:
        {
            CustomerListViewController *cusListViewCon = [[CustomerListViewController alloc]init];
            [self.navigationController pushViewController:cusListViewCon animated:YES];
        }
            break;
        case 1:
        {
            ImportCustomerViewController *importCusVC = [[ImportCustomerViewController alloc] init];
            [self.navigationController pushViewController:importCusVC animated:YES];
        }
            break;
        case 2:
        {            
            [self.navigationController pushViewController:[[CompetitorsViewController alloc]init] animated:YES];
        }
            break;
        case 3:
        {
            KHHPlanViewController *_planViewCon = [[KHHPlanViewController alloc]init];
            _planViewCon.paramDic = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"collection" ofType:@"plist"]];
           // [planPro set_dicTempTarget:self.card];
            _planViewCon.title = @"拜访登记";
            _planViewCon.uperSuccess = ^(){
            };
            [self.navigationController pushViewController:_planViewCon animated:YES];
        }
            break;
        case 4:
        {
            KHHPlanViewController *planPro = [[KHHPlanViewController alloc]init];
            planPro.paramDic = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"plan" ofType:@"plist"]];
//            [planPro set_dicTempTarget:self.card];
            planPro.title = @"新建计划";
            planPro.uperSuccess = ^(){
//                if ([self.card isKindOfClass:[ReceivedCard class]]) {
//                    self.card = [[KHHDataNew sharedData] receivedCardByID:self.card.id];
//                }else if ([self.card isKindOfClass:[PrivateCard class]]){
//                    self.card = [[KHHDataNew sharedData] privateCardByID:self.card.id];
//                }
//                _visitCalView.card = self.card;
//                [_visitCalView reloadTheTable:KHHCalendarViewDataTypeCheckIn];
            };
            
            [self.navigationController pushViewController:planPro animated:YES];
        }
            break;
        case 5:
        {
            KHHCalendarViewController *calendarVC = [[KHHCalendarViewController alloc] init];
            [self.navigationController pushViewController:calendarVC animated:YES];
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end

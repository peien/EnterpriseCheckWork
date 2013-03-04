//
//  ATTendanceViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "ATTendanceViewController.h"
#import "KHHPlanViewController.h"

@interface ATTendanceViewController ()

@end

@implementation ATTendanceViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initArrParam
{
    NSArray *arrImgPro = [[NSArray alloc]initWithObjects:@"crm_leida",@"crm_leida", nil];
    NSArray *arrImgSelectPro = [[NSArray alloc]initWithObjects:@"crm_leida_selected",@"crm_leida_selected", nil];
    NSArray *arrLabelPro = [[NSArray alloc]initWithObjects:@"考勤",@"考勤异常记录", nil];
    for (int i=0; i<2; i++) {
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
            KHHPlanViewController *_planViewCon = [[KHHPlanViewController alloc]init];
            _planViewCon.paramDic = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"attendance" ofType:@"plist"]];
            // [planPro set_dicTempTarget:self.card];
            _planViewCon.title = @"拜访登记";
            _planViewCon.uperSuccess = ^(){
            };
            [self.navigationController pushViewController:_planViewCon animated:YES];
            
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"考勤";
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

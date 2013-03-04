//
//  DataReportingViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "DataReportingViewController.h"
#import "PhoneUpViewController.h"
#import "ATTendanceViewController.h"

@interface DataReportingViewController ()

@end

@implementation DataReportingViewController

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
    NSArray *arrLabelPro = [[NSArray alloc]initWithObjects:@"拍照上传",@"考勤", nil];
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
            [self.navigationController pushViewController:[[PhoneUpViewController alloc]init] animated:YES];
            
        }
            break;
        case 1:
        {
            
            [self.navigationController pushViewController:[[ATTendanceViewController alloc]init] animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"数据上报";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

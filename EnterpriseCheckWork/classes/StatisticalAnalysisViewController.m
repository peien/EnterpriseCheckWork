//
//  StatisticalAnalysisViewController.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "StatisticalAnalysisViewController.h"
#import "KHHRadarViewController.h"
#import "KHHFunnelViewController.h"

@interface StatisticalAnalysisViewController ()

@end

@implementation StatisticalAnalysisViewController

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
    NSArray *arrLabelPro = [[NSArray alloc]initWithObjects:@"关系拓展",@"价值漏斗", nil];
    for (int i=0; i<2; i++) {
        UnitForStyleBox *box = [[UnitForStyleBox alloc]initWithImgStr:arrImgPro[i] imgSelectStr:arrImgSelectPro[i] labelStr:arrLabelPro[i]];
        box.tag = i;
        [self.arrParam addObject:box];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"统计分析";
}


#pragma mark - button action
- (void)buttonClick:(id)sender
{
    UIButton *butPro = (UIButton *)sender;
    switch (butPro.tag) {
        case 0:
        {
            KHHRadarViewController *radarVC = [[KHHRadarViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:radarVC animated:YES];
            
        }
            break;
        case 1:
        {
            KHHFunnelViewController *funnelVC = [[KHHFunnelViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:funnelVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

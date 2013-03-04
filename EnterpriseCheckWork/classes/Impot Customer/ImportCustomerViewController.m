//
//  ImportCustomerViewController.m
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#define KHH_View_Width 300
#define KHH_ImageView_Height 200
#define KHH_View_Margin 10
#define KHH_View_Title (25 + 40)
#import "ImportCustomerViewController.h"

@interface ImportCustomerViewController ()
@end

@implementation ImportCustomerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //initial params
        [self initParam];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 初始化导入客户界面
-(void) initParam
{
    //添加提示image
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(KHH_View_Margin, 0, KHH_View_Width, KHH_ImageView_Height)];
    CGPoint center = self.view.center;
    imageView.center = CGPointMake(center.x, center.y - 2 * KHH_View_Margin - KHH_View_Title);
    imageView.image = [[UIImage imageNamed:@"two_Frame@2x.jpg"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    
    //添加导入按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(KHH_View_Margin, 0, KHH_View_Width, 4 * KHH_View_Margin);
    button.center = CGPointMake(center.x, imageView.center.y + KHH_ImageView_Height / 2 + 2 * KHH_View_Margin + button.center.y / 2);
    [button setTitle:@"开始导入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateHighlighted];
    [button setBackgroundImage:[[UIImage imageNamed:@"left_bg@2x"] stretchableImageWithLeftCapWidth:8 topCapHeight:1] forState:UIControlStateNormal];
    [button setBackgroundImage:[[UIImage imageNamed:@"left_btn_bg_selected@2x"] stretchableImageWithLeftCapWidth:8 topCapHeight:1] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDragInside];
    
    [self.view addSubview:imageView];
    [self.view addSubview:button];
}

#pragma mark -- 导入按钮按下事件
-(void) buttonClick: (id) sender
{
    
}
@end

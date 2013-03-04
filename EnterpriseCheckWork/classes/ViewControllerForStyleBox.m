//
//  ViewControllerForStyleBox.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "ViewControllerForStyleBox.h"

@interface ViewControllerForStyleBox ()

@end

@implementation ViewControllerForStyleBox



- (void)viewDidLoad
{
    [super viewDidLoad];
    _arrParam = [[NSMutableArray alloc]init];
    
    [self initArrParam];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg@2x.jpg"]];
    backgroundImage.frame = CGRectMake(0, 0, 320, self.view.frame.size.height-44);
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    
    
	for (int i=0; i<[_arrParam count]; i++) {
        UnitForStyleBox *paramPro = _arrParam[i];
        
        UIButton *butPro = [[UIButton alloc]init];
        [butPro setImage:[UIImage imageNamed:paramPro.imgStr] forState:UIControlStateNormal];
        [butPro setImage:[UIImage imageNamed:paramPro.imgSelectStr] forState:UIControlStateHighlighted];
        // butPro.backgroundColor = [UIColor redColor];
        butPro.frame = CGRectMake((widthBlack)*((int)(i%3)*2+1)+widthImg*((int)(i%3)), (widthImg+heightLabel+10)*(int)(i/3)+20, widthImg, widthImg);
        butPro.tag = paramPro.tag;
#pragma mark buttonClick:界面中的按钮点击执行的事件，要在子类中实现
        [butPro addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:butPro];
        
        
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:10.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.text = paramPro.labelStr;
        label.frame = CGRectMake((widthBlack)*((int)(i%3)*2+1)+widthImg*((int)(i%3)), (widthImg+heightLabel+10)*(int)(i/3)+20+widthImg, widthImg, heightLabel);
        [self.view addSubview:label];
    }
    
}

#pragma mark 每个继承ViewControllerForStyleBox的子类要想界面有数据时都得重写此函数
- (void)initArrParam
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
}

@end





//
//  ViewControllerForDropDowmButton.m
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-1.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "ViewControllerForDropDowmButton.h"
#import "KHHFilterPopup.h"
#import "KHHViewManagerUtils.h"

@interface ViewControllerForDropDowmButton ()<KHHFilterPopupDelegate>
{
    //rightNavigationBar的实际按钮
    UIButton *rightButton;
}
@end

@implementation ViewControllerForDropDowmButton

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //添加一个rightButton
        rightButton = [KHHViewManagerUtils addSingleRightBarItemByName:@"所有" frame:CGRectMake(240, 0, 85, 30) target:self];
        [rightButton addTarget:self action:@selector(showGroupPopup)
              forControlEvents:UIControlEventTouchUpInside];
        //设置左对齐
        rightButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        //只设置上面一句没有用
        rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置上面一句后文字紧贴左边，下面一句是让左边空出点距离
        rightButton.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        UIEdgeInsets inset = UIEdgeInsetsMake(0, 10, 0, 25);
        [rightButton setBackgroundImage:[[UIImage imageNamed:@"title_btn_with_drop"] resizableImageWithCapInsets:inset] forState:UIControlStateNormal];
    }
    return self;
}

-(void) showGroupPopup
{
    [[KHHFilterPopup shareUtil]  showPopUpGroup:_groupIndex delegate:self];
}

//更新选中分组名称
-(void) updateButtonTitle:(NSString *) newTitle
{
    if (newTitle) {
        [rightButton setTitle:newTitle forState:UIControlStateNormal];
    }else {
        [rightButton setTitle:@"所有" forState:UIControlStateNormal];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

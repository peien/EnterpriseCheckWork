//
//  MoreViewController.m
//  LoveCard
//
//  Created by gh w on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import "ModifyViewController.h"
#import "RecomFridendsViewController.h"
#import "AboutController.h"
//#import "KHHDefaults.h"
//#import "KHHNotifications.h"
#import "KHHStringRes.h"
#import "KHHWebView.h"
#import "KHHUser.h"
#import <AddressBook/AddressBook.h>

@interface MoreViewController ()<UIActionSheetDelegate,UIAlertViewDelegate>
@end

@implementation MoreViewController
@synthesize theTable = _theTable;
@synthesize groupMobilePhoneSwi = _groupMobilePhoneSwi;
@synthesize autoReturn = _autoReturn;
@synthesize updateStyle = _updateStyle;
@synthesize titleStr = _titleStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"更多", nil);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_theTable.backgroundColor = [UIColor clearColor];
    [self.view setBackgroundColor:[UIColor colorWithRed:241 green:238 blue:232 alpha:1.0]];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [KHHShowHideTabBar hideTabbar];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    _theTable = nil;
    _groupMobilePhoneSwi = nil;
    _autoReturn = nil;
    _updateStyle = nil;
    _titleStr = nil;
}
#pragma mark TableDelegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 1) {
        return 60;
    }
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
//        //检测更新
//        case 1:
//            return 1;
//            break;
        case 1:
            return 4;
            break;
        case 2:
            return 0;
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid = nil;
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:{
                    static NSString *identifier = @"ModifyPassword";
                    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"修改密码", nil);
                    
                }
                    break;
                case 1:{
                    cellid = NSLocalizedString(@"LOGOUT", @"LOGOUT");
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"登出", nil);
                }
                    break;
                case 2:{
                    cellid = NSLocalizedString(@"autoLogout",@"autoLogout");
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        
                        _groupMobilePhoneSwi.on = [KHHUser shareInstance].isAddMobPhoneGroup;
                        
                        cell.accessoryView = _groupMobilePhoneSwi;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"添加手机通讯录分组", nil);
                }
                    break;
                default:
                    break;
            }
            break;
            
//       case 1:
//        switch (indexPath.row) {
//        case 0:{
//            cellid = @"genxin";
//            cell = [tableView dequeueReusableCellWithIdentifier:cellid];
//            if (cell == nil) {
//                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
//                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//                cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            }
//            cell.textLabel.text = NSLocalizedString(@"检查更新", nil);
//        }
//
//            break
//
//        case 1:{
//            cellid = @"genxin style";
//            cell = [tableView dequeueReusableCellWithIdentifier:cellid];
//            if (cell == nil) {
//                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
//                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//                cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            }
//            cell.textLabel.text = @"软件更新方式设置";
//            _updateStyle.frame = CGRectMake(25, 36, 260, 20);
//            [cell addSubview:_updateStyle];
//        }
//        default:
//            break;
//    }
//    break;
            
        case 1:
            switch (indexPath.row) {
                case 0:{
                    cellid = @"use guide";
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"使用指南", nil);
                }
                    
                    break;
                case 1:{
                    cellid = @"recommend";
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"推荐给好友", nil);
                }
                    break;
                case 2:{
                    cellid = @"contact us";
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"客户反馈", nil);
                    
                }
                    break;
                case 3:{
                    cellid = @"about";
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"关于蜂巢", nil);
                }
                    break;
                    
                default:
                    break;
            }
            
            break;
            
        case 2:
            switch (indexPath.row) {
                    
                case 0:{
                    cellid = @"auto";
                    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
                        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                        cell.accessoryView = _autoReturn;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    }
                    cell.textLabel.text = NSLocalizedString(@"自动回赠名片", nil);
                    
                }
                    break;
                default:
                    break;
            }
            
        default:
            break;
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ModifyViewController *modVC = [[ModifyViewController alloc] initWithNibName:@"ModifyViewController" bundle:nil];
            [self.navigationController pushViewController:modVC animated:YES];
        }else if (indexPath.row == 1) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"登出", nil)
                                                            message:@"确定要登出吗"
                                                           delegate:self
                                                  cancelButtonTitle:KHHMessageCancle
                                                  otherButtonTitles:KHHMessageSure, nil];
            [alert show];
            
        }
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            KHHWebView *webView = [[KHHWebView alloc] initWithNibName:nil bundle:nil];
            [webView initUrl:KHHURLUserGuide title:@"使用指南" rightBarName:nil rightBarBlock:nil];
            [self.navigationController pushViewController:webView animated:YES];
        }else if (indexPath.row == 1) {
            RecomFridendsViewController *recomVC = [[RecomFridendsViewController alloc] initWithNibName:@"RecomFridendsViewController" bundle:nil];
            [self.navigationController pushViewController:recomVC animated:YES];
        }else if (indexPath.row == 2) {
            //客户反馈
            KHHWebView *webView = [[KHHWebView alloc] initWithNibName:nil bundle:nil];
            [webView initUrl:KHHURLContactUs title:@"客户反馈" rightBarName:nil rightBarBlock:nil];
            [self.navigationController pushViewController:webView animated:YES];
        }else if (indexPath.row == 3){
            AboutController *aboutVC = [[AboutController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
        
    }/*else if (indexPath.section == 1){
      if (indexPath.row == 1) {
      _titleStr = @"软件更新方式";
      [self showActionSheet];
      }
      }else if (indexPath.section == 3){
      if (indexPath.row == 0) {
      _titleStr = @"默认页面设置";
      [self showActionSheet];
      }
      }*/
}

- (void)showActionSheet
{
    UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:_titleStr delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    if ([_titleStr isEqualToString:@"软件更新方式"]) {
        [actSheet addButtonWithTitle:@"仅在wifi网络下自动下载更新"];
        [actSheet addButtonWithTitle:@"自动下载更新"];
        [actSheet addButtonWithTitle:@"手动更新"];
    }
    [actSheet showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }
    NSString *s = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSString *change = [NSString stringWithFormat:@"(%@)",s];
    if ([actionSheet.title isEqualToString:@"软件更新方式"]) {
        _updateStyle.text = change;
    }
}
//是否添加手机分组
- (IBAction)addMobileGroupSwitchValueChange:(UISwitch *)sender{
    
    

    if (sender.on) {
        ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
        if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
            ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
                // First time access has been granted, add the contact
                if (!granted) {
                   sender.on = NO;
                }
                
            });
            
        }
        else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
            // The user has previously given access, add the contact           
            [KHHUser shareInstance].isAddMobPhoneGroup = YES;
        }
        else {
            // The user has previously denied access
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"该功能需设置通讯录访问权限" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            sender.on = NO;
            return;
        }
        
    }else{
        [KHHUser shareInstance].isAddMobPhoneGroup = NO;
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@",alertView.title); 
    if ([alertView.title isEqualToString:NSLocalizedString(@"登出", nil)]
        && buttonIndex == 1) {
        //登出，返回登录界面（或退出程序）
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

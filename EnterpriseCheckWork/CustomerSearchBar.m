//
//  CustomerSearchBar.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "CustomerSearchBar.h"

@implementation CustomerSearchBar

- (id)init{
    if (self = [super init]){
        self.frame = CGRectMake(0, 0, 320, 44);
        self.backgroundImage = [UIImage imageNamed:@"searchbar_bg_normal"];
        self.placeholder = @"请输入姓名、电话或者公司";
    }
    return self;
}

@end

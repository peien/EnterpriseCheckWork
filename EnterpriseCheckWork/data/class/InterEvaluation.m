//
//  InterEvaluation.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "InterEvaluation.h"
#import "CustomerEvaluation.h"
#import "NSManagedObject+KHH.h"
#import "ReceivedCard.h"
#import "PrivateCard.h"

@implementation InterEvaluation

- (void)toDBCustomer
{
    CustomerEvaluation *CustomerDB = [CustomerEvaluation objectByID:[NSNumber numberWithInt:_id.intValue] createIfNone:YES];
    CustomerDB.remarks = [_remarks isEqual:[NSNull null]]?@"":_remarks;
    CustomerDB.value = [NSNumber numberWithInt:_depth.intValue];
    CustomerDB.degree = [NSNumber numberWithInt:_cost.intValue];
    
    
    Card *aCard;
    if ([_customType isEqualToString:@"linkman"]) {
        aCard = [ReceivedCard objectByID:[NSNumber numberWithInt:_customerCard.intValue] createIfNone:NO];
    }
    if ([_customType isEqualToString:@"me"]) {
        aCard = [PrivateCard objectByID:[NSNumber numberWithInt:_customerCard.intValue] createIfNone:NO];
    }
    if (aCard) {
        CustomerDB.customerCard     = aCard;
    }
}

@end
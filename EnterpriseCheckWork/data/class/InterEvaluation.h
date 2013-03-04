//
//  InterEvaluation.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "SMObject.h"

@interface InterEvaluation : SMObject
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *customerCard;
@property (nonatomic,strong) NSString *depth;
@property (nonatomic,strong) NSString *cost;
@property (nonatomic,strong) NSString *remarks;
@property (nonatomic,strong) NSString *customType;


@property (nonatomic,strong) NSString *knownTime;
@property (nonatomic,strong) NSString *knownAddress;
@property (nonatomic,strong) NSString *location;

- (void)toDBCustomer;
@end

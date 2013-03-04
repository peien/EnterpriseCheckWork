//
//  UnitForStyleBox.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "UnitForStyleBox.h"

@implementation UnitForStyleBox
- (id)initWithImgStr:(NSString *)imgStr imgSelectStr:(NSString *)imgSelectStr labelStr:(NSString *)labelStr
{
    self = [super init];
    if (self) {
        
        _imgStr = imgStr;
        _imgSelectStr = imgSelectStr;
        _labelStr = labelStr;
        
    }
    return self;
}
@end

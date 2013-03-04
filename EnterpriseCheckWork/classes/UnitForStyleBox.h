//
//  UnitForStyleBox.h
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <Foundation/Foundation.h>
#define widthImg 63.0
#define widthBlack 22.0
#define heightLabel 20.0

@interface UnitForStyleBox : NSObject

@property (nonatomic,strong)NSString *imgStr;
@property (nonatomic,strong)NSString *imgSelectStr;
@property (nonatomic,strong)NSString *labelStr;
@property (nonatomic,assign)int tag;

- (id)initWithImgStr:(NSString *)imgStr imgSelectStr:(NSString *)imgSelectStr labelStr:(NSString *)labelStr;

@end

//
//  EmptyNoticeView.h
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-1.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyNoticeView : UIView
//提示图片
@property (nonatomic, strong) NSString      *noticeImageName;
//提示文字
@property (nonatomic, strong) NSString      *noticeText;

-(id) initWithFrame:(CGRect) frame imageName:(NSString *) imageName text:(NSString *) text;
@end

//
//  HeadImageView.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "HeadImageView.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation HeadImageView

- (id)initWithUrl:(NSString *)urlStr
{
    self = [super initWithFrame:CGRectMake(3, 7, 50, 47)];
    if (self) {
        CALayer *l = [self layer];
        
        [self setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"logopic.png"] options:SDWebImageProgressiveDownload completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
            [l setMasksToBounds:YES];
            [l setCornerRadius:6.0];
        }];
    }
    return self;
}



@end

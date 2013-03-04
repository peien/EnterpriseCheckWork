//
//  EmptyNoticeView.m
//  EnterpriseCheckWork
//
//  Created by 王定方 on 13-3-1.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "EmptyNoticeView.h"
#import "KHHViewAdapterUtil.h"
@interface EmptyNoticeView()
{
    UIImageView *noticeImageView;
    UILabel *noticeLabel;
}
@end

@implementation EmptyNoticeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        noticeImageView = [[UIImageView alloc] init];
        noticeLabel = [[UILabel alloc] init];
        [self setBackgroundColor:[UIColor grayColor]];
        [self addSubview:noticeImageView];
        [self addSubview:noticeLabel];
        
        //适配iphone5
        [KHHViewAdapterUtil checkIsNeedAddHeightForIphone5:self];
    }
    return self;
}

-(id) initWithFrame:(CGRect) frame imageName:(NSString *) imageName text:(NSString *) text
{
    if ([self initWithFrame:frame]) {
        noticeImageView.image = [UIImage imageNamed:imageName];
        noticeLabel.text = text;
        noticeLabel.textAlignment = NSTextAlignmentLeft;
        noticeLabel.font = [UIFont systemFontOfSize:12];
        noticeLabel.backgroundColor = [UIColor clearColor];
        noticeLabel.lineBreakMode = UILineBreakModeWordWrap;
        noticeLabel.numberOfLines = 0;
    };
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) layoutSubviews
{
    //布局noticeImage的位置
    noticeImageView.frame = CGRectMake(0, 0, 80, 80);
    //image位置在中心往上50个单位
    noticeImageView.center = CGPointMake(self.center.x, self.center.y - 50);
    //让uilable的高度自适应
    noticeLabel.frame = CGRectMake(10, noticeImageView.frame.origin.y + noticeImageView.frame.size.height + 60, 300, 0);
    CGSize maximumSize = CGSizeMake(300, CGFLOAT_MAX); // 第一个参数是label的宽度，第二个参数是固定的宏定义，CGFLOAT_MAX
    CGSize size = [noticeLabel.text sizeWithFont:noticeLabel.font
                                constrainedToSize:maximumSize
                                    lineBreakMode:UILineBreakModeWordWrap];
    
    CGRect newFrame = noticeLabel.frame;
    newFrame.size.height = size.height;
    noticeLabel.frame = newFrame;
    [noticeLabel sizeToFit];
}
@end

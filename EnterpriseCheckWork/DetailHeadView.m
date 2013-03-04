//
//  DetailHeadView.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "DetailHeadView.h"
#import "HeadImageView.h"

@implementation DetailHeadView
{
    HeadImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_phoneOrCompanyLabel;
    UILabel *_jobLabel;
    
    NSMutableArray *arrBut;
}

- (id)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, 320, 100);
        UIImage *bgimg = [[UIImage imageNamed:@"xiangqing_top_bg.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
        UIImageView *bgimgView = [[UIImageView alloc] initWithImage:bgimg];
        bgimgView.frame = self.frame;
        [self addSubview:bgimgView];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:14.0];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.frame = CGRectMake(63, 7, 78, 24);
        
        _jobLabel = [[UILabel alloc]init];
        _jobLabel.backgroundColor = [UIColor clearColor];
        _jobLabel.font = [UIFont systemFontOfSize:8.0];
        _jobLabel.textAlignment = NSTextAlignmentLeft;
        _jobLabel.frame = CGRectMake(175, 11, 125, 16);
        
        _phoneOrCompanyLabel = [[UILabel alloc]init];
        _phoneOrCompanyLabel.backgroundColor = [UIColor clearColor];
        _phoneOrCompanyLabel.font = [UIFont systemFontOfSize:7.0];
        _phoneOrCompanyLabel.textAlignment = NSTextAlignmentLeft;
        _phoneOrCompanyLabel.frame = CGRectMake(63, 34, 249, 20);
        
        
        [self addSubview:_nameLabel];
        [self addSubview:_jobLabel];
        [self addSubview:_phoneOrCompanyLabel];
        
        arrBut = [[NSMutableArray alloc]initWithCapacity:5];
    }
    return self;
}

- (void)setTitleArr:(NSArray *)titleArr
{
    _titleArr = titleArr;
    for (int i=0; i<[_titleArr count]; i++) {
        UIButton *butPro = [UIButton buttonWithType:UIButtonTypeCustom];
        butPro.frame = CGRectMake((320.0/[_titleArr count])*i, 100-30, (320.0/[_titleArr count]), 30);
        [self doInButBgSet:i button:butPro];
        [butPro setTitle:titleArr[i] forState:UIControlStateNormal];
        [butPro setTitle:titleArr[i] forState:UIControlStateHighlighted];
        butPro.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [butPro setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [butPro setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self addSubview:butPro];
        if ([_titleArr count] == 1) {
            continue;
        }
        butPro.tag = i;
        [arrBut addObject:butPro];
        [butPro addTarget:self action:@selector(headClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
}

- (void)doInButBgSet:(int)tag button:(UIButton *)butPro
{
    [butPro setBackgroundImage:[[UIImage imageNamed:(tag == [_titleArr count]-1)?@"xiangqing_btn13_normal":@"xiangqing_btn2_normal"] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateNormal];
    [butPro setBackgroundImage:[[UIImage imageNamed:(tag == [_titleArr count]-1)?@"xiangqing_btn13_normal":@"xiangqing_btn2_normal"] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateHighlighted];
}

- (void)headClick:(id)sender
{
    UIButton *butPro = (UIButton *)sender;
    for (int i=0; i<[_titleArr count]; i++) {
        UIButton *butPro2 = (UIButton *)arrBut[i];
        if (butPro2.tag != butPro.tag) {
            [self doInButBgSet:i button:butPro2];
        }
    }
    
    [butPro setBackgroundImage:[[UIImage imageNamed:(butPro.tag == [_titleArr count]-1)?@"xq_btn13_selected":@"xq_btn2_selected"] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateNormal];
    
    if (_delegate&&[_delegate respondsToSelector:@selector(headClick:)]) {
        [_delegate headClick:butPro.tag];
    }
}

- (void)setInterCustomer:(InterCustomer *)interCustomer
{
    _interCustomer = interCustomer;
    
    _imageView = [[HeadImageView alloc]initWithUrl:interCustomer.imageUrl];
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPopVp)]];
    [_imageView setUserInteractionEnabled:YES];
    
    _nameLabel.text = interCustomer.name;
    _jobLabel.text = [NSString stringWithFormat:@"(%@)",interCustomer.roleType];
    //if (_isCoWorker) {
    _phoneOrCompanyLabel.text = interCustomer.mobileList;//[interCustomer.mobileList componentsSeparatedByString:@"|"][0];
    return;
    // }
    _phoneOrCompanyLabel.text = interCustomer.companyName;    
   
    
}

- (void)showPopVp
{
    if (_delegate&&[_delegate respondsToSelector:@selector(showPopVp:)]) {
        [_delegate showPopVp:_interCustomer];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self addSubview:_imageView];  
    
}

@end

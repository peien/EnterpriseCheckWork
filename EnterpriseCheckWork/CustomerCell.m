//
//  CustomerCell.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "CustomerCell.h"
#import "HeadImageView.h"
@implementation CustomerCell
{
    HeadImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_phoneOrCompanyLabel;
    UILabel *_jobLabel;
    
    NSTimeInterval begin;
    NSTimeInterval end;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    begin = touch.timestamp;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [[touches allObjects] objectAtIndex:0];   
    CGPoint location = [touch locationInView:touch.view];
    if (location.x<53.0) {
        if(_delegate&&[_delegate respondsToSelector:@selector(showPopVp:)]) {
            [_delegate showPopVp:self];
        }
        return;
    }
    
    if (end!=0&&touch.timestamp-end<=0.5) {
        return;
    }
    end = touch.timestamp;
    if(end - begin>=0.5){
        if(_delegate&&[_delegate respondsToSelector:@selector(showPopVp:)]) {
            [_delegate showPopVp:self];
        }        
    }else{
        if (_delegate&&[_delegate respondsToSelector:@selector(showDetail:)]) {
            [_delegate showDetail:self];
        }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{

    [super setSelected:selected animated:animated];
}

- (void)setInterCustomer:(InterCustomer *)interCustomer
{
    _interCustomer = interCustomer;
    
    _imageView = [[HeadImageView alloc]initWithUrl:interCustomer.imageUrl];
    _nameLabel.text = interCustomer.name;
    _jobLabel.text = [NSString stringWithFormat:@"(%@)",interCustomer.roleType];
    if (_isCoWorker) {
        _phoneOrCompanyLabel.text = [interCustomer.mobileList componentsSeparatedByString:@"|"][0];
        return;
    }
    _phoneOrCompanyLabel.text = interCustomer.companyName;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_jobLabel];
    [self.contentView addSubview:_phoneOrCompanyLabel];
    
}

@end

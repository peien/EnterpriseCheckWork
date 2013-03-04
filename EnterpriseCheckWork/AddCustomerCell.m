//
//  AddCustomerCell.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-27.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "AddCustomerCell.h"

@implementation AddCustomerCell
{
    UIImageView *_addImg;
    UILabel *_addLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _addImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
        _addImg.image = [UIImage imageNamed:@"tianjia_Btn_Red"];
        
        _addLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 15, 100, 30)];
        _addLabel.backgroundColor = [UIColor clearColor];
        _addLabel.text = @"新建";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        if(_delegate&&[_delegate respondsToSelector:@selector(addNew)]) {
            [_delegate addNew];
        }
    }
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addSubview:_addImg];
    [self.contentView addSubview:_addLabel];
}

@end

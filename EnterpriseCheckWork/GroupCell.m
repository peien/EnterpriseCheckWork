//
//  GroupCell.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-26.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "GroupCell.h"

@implementation GroupCell
{
    UILabel *_label;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont systemFontOfSize:10.0];
        _label.textAlignment = NSTextAlignmentCenter;
//        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [_button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//        [_button setBackgroundImage:[UIImage imageNamed:@"left_btn_bg"] forState:UIControlStateNormal];
//        [_button setBackgroundImage:[UIImage imageNamed:@"left_btn_bg_selected"] forState:UIControlStateNormal];
        _label.frame = CGRectMake(0, 0, 75, 40);
        
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (selected) {
        if (self.selected) {
            if (_delegate&&[_delegate respondsToSelector:@selector(towTouchGroup:)]) {
                [_delegate towTouchGroup:_interGroup];
            }
        }else{
            if(_delegate&&[_delegate respondsToSelector:@selector(oneTouchGroup:)]) {
                [_delegate oneTouchGroup:_interGroup];
            }           
        }
    }
    
    [super setSelected:selected animated:animated];
    
    if (selected) {
        _label.textColor = [UIColor redColor];
        return;
    }
    _label.textColor = [UIColor blackColor];
    // Configure the view for the selected state
}

- (void)setInterGroup:(InterGroup *)interGroup
{
    
//    [_button setTitle:interGroup.name forState:UIControlStateNormal];
//    [_button setTitle:interGroup.name forState:UIControlStateHighlighted];
    _label.text = interGroup.name;
    _interGroup = interGroup;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView addSubview:_label];
    
}

@end

//
//  SubCardView.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-2-28.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "SubCardView.h"

@implementation SubCardView
{
    UITableView *_table;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, frame.size.height) style:UITableViewStyleGrouped];
        _table.dataSource = self;
       // _table.backgroundColor = [UIColor clearColor];
        _table.backgroundView = nil;
       // _table.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
         return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SubCardCell";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;        
    }
    cell.textLabel.text = @"分组";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self addSubview:_table];
}

@end

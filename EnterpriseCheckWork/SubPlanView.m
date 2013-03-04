//
//  SubPlanView.m
//  EnterpriseCheckWork
//
//  Created by CJK on 13-3-4.
//  Copyright (c) 2013年 cjk. All rights reserved.
//

#import "SubPlanView.h"

@implementation SubPlanView
{
     UITableView *_table;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, frame.size.height) style:UITableViewStylePlain];
        _table.dataSource = self;
        _table.delegate = self;
       // _table.backgroundColor = [UIColor clearColor];
               
        [self addSubview:_table];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        return 4;    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SubPlanCell";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = @"分组";
    return cell;
}


@end

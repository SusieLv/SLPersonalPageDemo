//
//  SLSecondTableView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLSecondTableView.h"

@interface SLSecondTableView ()<UITableViewDataSource>

@end

@implementation SLSecondTableView

static NSString * cellID = @"SecondCell";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = SLRandomColor;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"second-----%ld",indexPath.row];
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  SLThirdTableView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLThirdTableView.h"

@interface SLThirdTableView ()<UITableViewDataSource>

@end

@implementation SLThirdTableView

static NSString * cellID = @"ThirdCell";

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
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"Third-----%ld",indexPath.row];
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

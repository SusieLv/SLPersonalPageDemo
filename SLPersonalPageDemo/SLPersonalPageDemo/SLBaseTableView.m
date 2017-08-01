//
//  SLBaseTableView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLBaseTableView.h"

@implementation SLBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        //设置占位的tableHeaderView
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, ImageHeight+SegmentHeight)];
        self.tableHeaderView = headerView;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
}



- (void)setContentOffset:(CGPoint)contentOffset
{
    
    if (self.window)
    {
        [super setContentOffset:contentOffset];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

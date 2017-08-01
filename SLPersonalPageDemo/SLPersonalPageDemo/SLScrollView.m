//
//  SLScrollView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/8/1.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLScrollView.h"

@implementation SLScrollView

- (void)setOffset:(CGPoint)offset
{
    _offset = offset;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView * view = [super hitTest:point withEvent:event];
    BOOL hitHead = point.y < (200 - self.offset.y);
    
    if (hitHead||!view)
    {
        self.scrollEnabled = NO;
        if (!view)
        {
            for (UIView * subView in self.subviews)
            {
                if (subView.frame.origin.x == self.contentOffset.x)
                {
                    view = subView;
                }
            }
        }
        return view;
    }else
    {
        self.scrollEnabled = YES;
        return view;
    }
}

@end

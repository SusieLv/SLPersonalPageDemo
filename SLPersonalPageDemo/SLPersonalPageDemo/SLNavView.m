//
//  SLNavView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLNavView.h"

@implementation SLNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _backView = [[UIView alloc]initWithFrame:self.bounds];
        _backView.alpha = 0;
        _backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 300, 44)];
        _nameLabel.centerX = kScreenWidth * 0.5;
        _nameLabel.backgroundColor = [ UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:17];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"Susie's HomePage";
        [_backView addSubview:_nameLabel];
        
        [self addSubview:self.backBtn];
    }
    return self;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 20, 60, 44);
        [_backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 35)];
    }
    return _backBtn;
}

- (void)backClick{
    if (self.backBlock) {
        self.backBlock();
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

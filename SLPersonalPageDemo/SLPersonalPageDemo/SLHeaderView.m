//
//  SLHeaderView.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLHeaderView.h"

@interface SLHeaderView ()
@property (nonatomic,strong) UIImageView * bgImage;
/**  */
@property (nonatomic,strong) UIButton * iconBtn;
@end
@implementation SLHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, -82, kScreenWidth, 282)];
        _bgImage.image = [UIImage imageNamed:@"bg_image"];
        [self addSubview:_bgImage];
        
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconBtn.backgroundColor = SLRandomColor;
        _iconBtn.frame = CGRectMake(0, 64, 60, 60);
        [_iconBtn setImage:[UIImage imageNamed:@"icon_image"] forState:UIControlStateNormal];
        _iconBtn.centerX = kScreenWidth * 0.5;
        _iconBtn.layer.cornerRadius = _iconBtn.width * 0.5;
        _iconBtn.layer.masksToBounds = YES;
        _iconBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconBtn.layer.borderWidth = 1.0;
        [self addSubview:_iconBtn];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    UIView* view = [super hitTest:point withEvent:event];
    
    if ([view isKindOfClass:[UIButton class]])
    {
        return view;
    }
    
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

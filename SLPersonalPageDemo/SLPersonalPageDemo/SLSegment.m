//
//  SLSegment.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLSegment.h"

@interface SLSegment ()
/** 标题 */
@property (nonatomic,strong) NSArray * titles;
/** 指示器 */
@property (nonatomic,strong) UILabel * indicatorLabel;
/** 按钮数据 */
@property (nonatomic,strong) NSMutableArray * btnList;
@end

@implementation SLSegment

- (NSMutableArray *)btnList
{
    if (!_btnList) {
        _btnList = [NSMutableArray array];
    }
    return _btnList;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = @[@"第一",@"第二",@"第三"];
        self.backgroundColor = [UIColor blueColor];
        CGFloat itemW = kScreenWidth/self.titles.count;
        [self.titles enumerateObjectsUsingBlock:^(NSString * title, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = 101 + idx;
            button.frame = CGRectMake(idx * itemW, 0, itemW, self.height);
            [button setTitle:self.titles[idx] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:1.0 green:72/255.0 blue:84/255.0 alpha:1.0] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [button addTarget:self action:@selector(selectTitle:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [self.btnList addObject:button];
        }];
        
        _indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height-2.5, 25, 2)];
        _indicatorLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_indicatorLabel];
    }
    return self;
}

- (void)selectTitle:(UIButton *)sender
{
    NSInteger index = sender.tag - 101;
    if (index == _currentIndex) {
        return;
    }
    [self setCurrentIndex:index];
    if (self.segementSelectBlock) {
        self.segementSelectBlock(index);
        NSLog(@"选中了%@",self.titles[index]);
    }
}


- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    
    for (UIButton *btn in self.btnList) {
        btn.selected = NO;
    }
    UIButton * currentBtn = self.btnList[_currentIndex];
    currentBtn.selected = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.indicatorLabel.centerX = currentBtn.centerX;
    }];
}


@end

//
//  SLNavView.h
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NavBackAction)();

@interface SLNavView : UIView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, copy) NavBackAction backBlock;


@end

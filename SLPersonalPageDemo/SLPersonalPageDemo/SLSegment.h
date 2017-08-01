//
//  SLSegment.h
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/28.
//  Copyright © 2017年 pan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SLSegementSelectBlock)(NSInteger currentIndex);
@interface SLSegment : UIView
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic,copy) SLSegementSelectBlock segementSelectBlock;

@end

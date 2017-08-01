//
//  SLViewController.m
//  SLPersonalPageDemo
//
//  Created by 盼 on 2017/7/27.
//  Copyright © 2017年 pan. All rights reserved.
//

#import "SLViewController.h"
#import "SLTestViewController.h"
#import "SLBaseTableView.h"
#import "SLFirstTableView.h"
#import "SLSecondTableView.h"
#import "SLThirdTableView.h"
#import "SLHeaderView.h"
#import "SLSegment.h"
#import "SLNavView.h"
#import "SLScrollView.h"

@interface SLViewController ()<UIScrollViewDelegate,UITableViewDelegate>
@property (nonatomic,strong) SLScrollView * scrollView;

@property (nonatomic,strong) SLFirstTableView * firstTable;
/**  */
@property (nonatomic,strong) SLSecondTableView * secondTable;
/**  */
@property (nonatomic,strong) SLThirdTableView * thirdTable;
/**  */
@property (nonatomic,strong) SLHeaderView * headerView;
/**  */
@property (nonatomic,strong) SLSegment * segment;
/**  */
@property (nonatomic,strong) SLNavView * navView;

@end

@implementation SLViewController

#pragma mark - Get Set Method

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[SLScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.clipsToBounds = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(kScreenWidth*3, kScreenHeight);
    }
    return _scrollView;
}

- (SLFirstTableView *)firstTable
{
    if (!_firstTable) {
        _firstTable = [[SLFirstTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _firstTable.rootVC = self;
        _firstTable.delegate = self;
    }
    return _firstTable;
}

- (SLSecondTableView *)secondTable
{
    if (!_secondTable) {
        _secondTable = [[SLSecondTableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _secondTable.rootVC = self;
        _secondTable.delegate = self;
    }
    return _secondTable;
}

- (SLThirdTableView *)thirdTable
{
    if (!_thirdTable) {
        _thirdTable = [[SLThirdTableView alloc] initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _thirdTable.rootVC = self;
        _thirdTable.delegate = self;
    }
    return _thirdTable;
}

- (SLHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[SLHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, ImageHeight+SegmentHeight)];
    }
    return _headerView;
}

- (SLSegment *)segment
{
    if (!_segment) {
        _segment = [[SLSegment alloc] initWithFrame:CGRectMake(0, ImageHeight, kScreenWidth, 40)];
        _segment.currentIndex = 0;
        
        __weak typeof(self)weakSelf  = self;
        _segment.segementSelectBlock = ^(NSInteger currentIndex){
            
            typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.scrollView setContentOffset:CGPointMake(currentIndex * kScreenWidth, 0) animated:YES];
        };
    }
    return _segment;
}

- (SLNavView *)navView
{
    if (!_navView) {
        _navView = [[SLNavView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        
        __weak typeof(self)weakSelf  = self;
        _navView.backBlock = ^(){
            typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)setUpUI
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.firstTable];
    [self.scrollView addSubview:self.secondTable];
    [self.scrollView addSubview:self.thirdTable];
    
    [self.headerView addSubview:self.segment];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.navView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView)
    {
        CGFloat contentOffsetX = scrollView.contentOffset.x;
        
        NSInteger pageNum = contentOffsetX / kScreenWidth + 0.5;
        
        self.segment.currentIndex = pageNum;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView || !scrollView.window) {
        return;
    }
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //记录头部视图的y坐标
    CGFloat originY = 0;
    CGFloat otherOffsetY = 0;
    CGFloat alpha = 0;
    
    if (offsetY <= ImageHeight-64) {
        originY = -offsetY;
        if (offsetY < 0) {
            otherOffsetY = 0;
            alpha = 0;
        }else
        {
            otherOffsetY = offsetY;
            alpha = offsetY/(ImageHeight-64);
        }
    }else
    {
        originY = -ImageHeight+64;
        otherOffsetY = ImageHeight-64;
        alpha = 1.0;
    }
    
    //设置导航条透明度
    self.navView.backView.alpha = alpha;
    //tableView移动时顶部视图frame跟随变化
    self.headerView.frame = CGRectMake(0, originY, kScreenWidth, ImageHeight + SegmentHeight);
    
    for ( int i = 0; i<self.scrollView.subviews.count; i++ )
    {
        if (i != self.segment.currentIndex)
        {
            UITableView* contentView = self.scrollView.subviews[i];
            CGPoint offset = CGPointMake(0, otherOffsetY);
            if ([contentView isKindOfClass:[UITableView class]])
            {
                if (contentView.contentOffset.y < ImageHeight || offset.y < ImageHeight)
                {
                    [contentView setContentOffset:offset animated:NO];
                }
            }
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.firstTable) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        SLTestViewController * testVC = [[SLTestViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
    }else if (tableView == self.secondTable)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        SLTestViewController * testVC = [[SLTestViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
    }else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        SLTestViewController * testVC = [[SLTestViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

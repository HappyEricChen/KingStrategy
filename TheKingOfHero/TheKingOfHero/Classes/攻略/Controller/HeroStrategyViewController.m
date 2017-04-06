//
//  HeroStrategyViewController.m
//  TheKingOfHero
//
//  Created by jamesczy on 2017/4/5.
//  Copyright © 2017年 jamesczy. All rights reserved.
//  攻略控制器

#import "HeroStrategyViewController.h"

@interface HeroStrategyViewController ()<UIScrollViewDelegate>
/** 标签栏底部的红色指示器 */
@property (nonatomic,weak) UIView * indicatorView;
/** 顶部标签栏整体 */
@property (nonatomic,weak) UIView * titelView;
/** 选中的标签按钮 */
@property (nonatomic,weak) UIButton * selectedBtn;
/** 底部所有的内容 */
@property (nonatomic,weak) UIScrollView * contentView;
@end

@implementation HeroStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNav];
    
    [self setUpChildVc];
    
    [self setUpContentView];
    
    [self setUpTitelView];
}
- (void)setUpNav
{
//    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"home-icon-grass" highImage:@"home-icon-grass" target:self action:@selector(tagClick)];
}
- (void)setUpChildVc
{
    UIViewController *all = [[UIViewController alloc]init];
    all.title = @"最新资讯";
    [self addChildViewController:all];
    
    UIViewController *video = [[UIViewController alloc]init];
    video.title = @"攻略秘籍";
    [self addChildViewController:video];
    
    UIViewController *voice = [[UIViewController alloc]init];

    voice.title = @"英雄出装";
    [self addChildViewController:voice];
    
    UIViewController *pictuer = [[UIViewController alloc]init];
    pictuer.title = @"荣耀抢先服";
    [self addChildViewController:pictuer];
    
    
}
- (void)setUpContentView
{
    UIScrollView *contentView = [[UIScrollView alloc]init];
    //    contentView.backgroundColor = [UIColor redColor];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    
    contentView.backgroundColor = JCBackColor;
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    contentView.contentInset = UIEdgeInsetsMake(35, 0, 44, 0);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}
- (void)setUpTitelView
{
    //设置标签栏
    UIView *titelView = [[UIView alloc]init];
    titelView.height = 35;
    titelView.width = self.view.width;
    titelView.x = 0;
    titelView.y = 64;
    titelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titelView];
    self.titelView = titelView;
    //设置指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = self.titelView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    CGFloat btnHeight = titelView.height;
    CGFloat btnWidth = titelView.width / self.childViewControllers.count;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.y = 0;
        btn.x = i * btnWidth;
        btn.width = btnWidth;
        btn.height = btnHeight;
        btn.tag = i ;
        [titelView addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            btn.enabled = NO;
            self.selectedBtn = btn;
            
            //让按钮内部的label根据文字内容来计算尺寸
            [btn.titleLabel sizeToFit];
            self.indicatorView.width = btn.titleLabel.width;
            self.indicatorView.centerX = btn.centerX;
        }
    }
    
    [titelView addSubview:indicatorView];
}
- (void)btnClick:(UIButton *)button
{
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    //滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}
- (void)tagClick
{
    
}
#pragma mark - scrollerViewDelegete

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    vc.view.height = scrollView.height - JCTitleViewY - JCTitleViewH;
    [scrollView addSubview:vc.view];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    //点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self btnClick:self.titelView.subviews[index]];
    
}


@end

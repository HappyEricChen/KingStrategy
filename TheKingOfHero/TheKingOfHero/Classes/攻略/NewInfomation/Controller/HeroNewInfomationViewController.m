//
//  HeroNewInfomationViewController.m
//  TheKingOfHero
//
//  Created by jamesczy on 2017/4/7.
//  Copyright © 2017年 jamesczy. All rights reserved.
//  最新资讯

#import "HeroNewInfomationViewController.h"
#import "HeroStrategyView.h"
#import "HeroInfoTableViewCell.h"

@interface HeroNewInfomationViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 头部滚动视图 */
@property (nonatomic, strong) HeroStrategyView *heroStragyView;
/** uitabelView */
@property (nonatomic, strong) UITableView *tabelView;

@end

static NSString *const infoCellID = @"infoCellID";

@implementation HeroNewInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpHeroStragyView];
    
    [self setUpTabelView];
}

- (void)setUpHeroStragyView
{
    CGRect viewFrame = CGRectMake(0, 0, JCScreenW, JCScreenH * 0.275);
    HeroStrategyView *heroStragyView = [[HeroStrategyView alloc]initWithFrame:viewFrame];
    
    [self.view addSubview:heroStragyView];
    self.heroStragyView = heroStragyView;
}

- (void)setUpTabelView
{
    CGRect tabViewFrame = CGRectMake(0, CGRectGetMaxY(self.heroStragyView.frame), JCScreenW, JCScreenH - CGRectGetMaxY(self.heroStragyView.frame) - 44 - 64 - 35);
    UITableView *tabelView = [[UITableView alloc]initWithFrame:tabViewFrame];
    tabelView.dataSource = self;
    tabelView.delegate = self;
    tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tabelView registerNib:[UINib nibWithNibName:NSStringFromClass([HeroInfoTableViewCell class]) bundle:nil] forCellReuseIdentifier:infoCellID];
    [self.view addSubview:tabelView];
    self.tabelView = tabelView;
}

#pragma mark - tableView数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (200 * JCScreenW) / 750;
}
@end

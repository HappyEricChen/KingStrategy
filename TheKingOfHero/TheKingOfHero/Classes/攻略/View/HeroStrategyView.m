//
//  HeroStrategyView.m
//  TheKingOfHero
//
//  Created by jamesczy on 2017/4/7.
//  Copyright © 2017年 jamesczy. All rights reserved.
//

#import "HeroStrategyView.h"

@interface HeroStrategyView()<SDCycleScrollViewDelegate>
/** 轮播图片 */
@property (nonatomic, strong) SDCycleScrollView *bannerScrollView;
/** title数组 */
@property (nonatomic, strong) NSMutableArray *titleMutArray;

@end


@implementation HeroStrategyView

- (NSMutableArray *)titleMutArray
{
    if (_titleMutArray == nil) {
        _titleMutArray = [NSMutableArray array];
        
    }
    return _titleMutArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SDCycleScrollView *bannerScrollView = [[SDCycleScrollView alloc]init];
        bannerScrollView.delegate = self;
        bannerScrollView.frame = CGRectMake(0, 0, self.width, self.height * 0.847);
        [self addSubview:bannerScrollView];
        NSArray *imageArray = @[[UIImage imageWithColor:[UIColor darkGrayColor]],[UIImage imageWithColor:[UIColor orangeColor]],[UIImage imageWithColor:[UIColor redColor]]];
        [bannerScrollView setLocalizationImageNamesGroup:imageArray];
        bannerScrollView.showPageControl = NO;
        self.bannerScrollView = bannerScrollView;
        UIView *bannerTitleView = [[UIView alloc]init];
        bannerTitleView.frame   = CGRectMake(0, CGRectGetMaxY(bannerScrollView.frame), self.width, self.height - bannerScrollView.height);
        bannerTitleView.backgroundColor = [UIColor whiteColor];
        [self.titleMutArray removeAllObjects];
        for (int i = 0;i < 3; i++) {
            NSString *str = [NSString stringWithFormat:@"国服最强%d",i];
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            titleBtn.tag = i + 100;
            titleBtn.userInteractionEnabled = NO;
            [titleBtn setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x288ed9)] forState:UIControlStateSelected];
            [titleBtn setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x0e1927)] forState:UIControlStateNormal];
            [titleBtn setTitle:str forState:UIControlStateNormal];
            [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.titleMutArray addObject:titleBtn];
            titleBtn.frame = CGRectMake(i * (JCScreenW / 3), 0, JCScreenW / 3, bannerTitleView.height);
            [bannerTitleView addSubview:titleBtn];
        }
        [self addSubview:bannerTitleView];
    }
    return self;
}

- (void)titleBtnClick:(UIButton *)btn
{
    NSLog(@"%ld",btn.tag);
    for (UIButton *button in self.titleMutArray) {
        if (button.tag == btn.tag) {
            button.selected = YES;
            
        }else{
            button.selected = NO;
        }
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    for (UIButton *button in self.titleMutArray) {
        if (button.tag == index + 100) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

@end

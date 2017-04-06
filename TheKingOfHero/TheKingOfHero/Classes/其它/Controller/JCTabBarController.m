//
//  JCTabBarController.m
//
//
//  Created by yingyi on 16/3/31.
//  Copyright © 2016年 yingyi. All rights reserved.
//  自定义tabBar

#import "JCTabBarController.h"
#import "ViewController.h"
#import "JCNavigationController.h"
#import "HeroStrategyViewController.h"

//#import "JCTabBar.h"

@interface JCTabBarController ()

@end

@implementation JCTabBarController
+(void)initialize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selecetedAttrs = [NSMutableDictionary dictionary];
    selecetedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selecetedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    //通过appearance统一设置tabbarItem 的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selecetedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加自控制器
    [self setUpChildVc:[[HeroStrategyViewController alloc]init] title:@"攻略" image:@"home-tabbar-news" selectedImage:@"home-tabbar-news-visited"];
    [self setUpChildVc:[[ViewController alloc]init] title:@"装备" image:@"home-tabbar-yxzb" selectedImage:@"home-tabbar-yxzb-visited"];
    [self setUpChildVc:[[ViewController alloc]init] title:@"工具" image:@"home-tabbar-news" selectedImage:@"home-tabbar-news-visited"];
    [self setUpChildVc:[[ViewController alloc]init] title:@"更多" image:@"home-tabbar-discover" selectedImage:@"home-tabbar-discover-visited"];
    
    //替换系统的tabbar
//    [self setValue:[[JCTabBar alloc]init] forKey:@"tabBar"];
}
-(void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0];
    JCNavigationController *nav = [[JCNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end

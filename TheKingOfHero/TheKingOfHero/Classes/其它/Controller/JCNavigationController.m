//
//  JCNavigationController.m
//  百思不得哥
//
//  Created by yingyi on 16/3/31.
//  Copyright © 2016年 yingyi. All rights reserved.
//

#import "JCNavigationController.h"

@interface JCNavigationController ()

@end

@implementation JCNavigationController
+(void)initialize
{
    //appearance 统一设置
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemAttries =  [NSMutableDictionary dictionary];
    itemAttries[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    itemAttries[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *itemDisabledAttries = [NSMutableDictionary dictionary];
    itemDisabledAttries[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [item setTitleTextAttributes:itemAttries forState:UIControlStateNormal];
    [item setTitleTextAttributes:itemDisabledAttries forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果右滑不能移除控制器, 清空代理
    self.interactivePopGestureRecognizer.delegate = nil;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //设置导航栏的右边按钮的文字和颜色
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        button.size = CGSizeMake(70, 30);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        

        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end

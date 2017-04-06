//
//  UIImage+JCExtension.m
//  百思不得哥
//
//  Created by jamesczy on 16/4/29.
//  Copyright © 2016年 yingyi. All rights reserved.
//  设置圆角图片等分类方法

#import "UIImage+JCExtension.h"

@implementation UIImage (JCExtension)
-(UIImage *)circleImage
{
    //NO表示透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    //裁剪
    CGContextClip(ctx);
    //将图开始画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

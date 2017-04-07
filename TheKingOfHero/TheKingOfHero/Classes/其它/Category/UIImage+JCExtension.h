//
//  UIImage+JCExtension.h
//  百思不得哥
//
//  Created by jamesczy on 16/4/29.
//  Copyright © 2016年 yingyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JCExtension)
- (UIImage *)circleImage;

+ (UIImage *)imageWithColor:(UIColor *)color;

//改变图片的透明度
+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

@end

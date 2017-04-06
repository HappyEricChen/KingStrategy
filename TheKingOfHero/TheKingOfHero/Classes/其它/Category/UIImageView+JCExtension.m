//
//  UIImageView+JCExtension.m
//  百思不得哥
//
//  Created by jamesczy on 16/4/29.
//  Copyright © 2016年 yingyi. All rights reserved.
//  设置头像图片为圆角图片

#import "UIImageView+JCExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (JCExtension)
-(void)setHeader:(NSString *)url
{
    UIImage *placeholderImage = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholderImage;
    }];
}
@end

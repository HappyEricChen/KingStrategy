//
//  NSDate+JCDateExtension.h
//   王者荣耀
//
//  Created by jamesczy on 16/4/13.
//  Copyright © 2016年 yingyi. All rights reserved.
//  处理两个nsdate之间的差值

#import <Foundation/Foundation.h>

@interface NSDate (JCDateExtension)
/**
 * 比较from和self的时间差值
 */
-(NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否是今年
 */
-(BOOL)isThisYear;

/**
 * 是否是今天
 */
-(BOOL)isToday;

/**
 * 是否是昨天
 */
-(BOOL)isYestoday;
@end

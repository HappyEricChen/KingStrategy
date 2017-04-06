//
//  NSDate+JCDateExtension.m
//  百思不得哥
//
//  Created by jamesczy on 16/4/13.
//  Copyright © 2016年 yingyi. All rights reserved.
//  判断日期方法

#import "NSDate+JCDateExtension.h"

@implementation NSDate (JCDateExtension)

-(NSDateComponents *)deltaFrom:(NSDate *)from
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    return [calendar components:unit fromDate:from];
}

/** 是否是今年 */
-(BOOL)isThisYear
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:now];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}
/** 是否是今天 */
-(BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    NSDateComponents *nowDay = [calendar components:unit fromDate:now];
    NSDateComponents *selfDay = [calendar components:unit fromDate:self];
    
    return nowDay.year == selfDay.year
        && nowDay.month == selfDay.month
        && nowDay.day == selfDay.day;
}
/** 是否是昨天 */
-(BOOL)isYestoday
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
   
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:now]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendarUnit unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}
@end

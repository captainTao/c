//
//  main.m
//  04-NSDate
//
//  Created by captain on 2018/1/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    // 09/10/2011
    NSString *time = @"2011/09/10 18:56";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm";
    
    NSDate *date = [formatter dateFromString:time];
    NSLog(@"%@", date);
    return 0;
}


void date2string()
{
    NSDate *date = [NSDate date];
    
    
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // y 年  M 月  d 日
    // m 分 s 秒  H （24）时  h（12）时
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@", str);
}

void use()
{
    // 创建一个时间对象
    NSDate *date = [NSDate date];
    // 打印出的时候是0时区的时间（北京-东8区）
    NSLog(@"%@", date);
    
    NSDate *date2 = [NSDate dateWithTimeInterval:5 sinceDate:date];
    
    
    // 从1970开始走过的秒数
    NSTimeInterval seconds = [date2 timeIntervalSince1970];
    
    // [date2 timeIntervalSinceNow];
}

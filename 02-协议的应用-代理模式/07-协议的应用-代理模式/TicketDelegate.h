//
//  TicketDelegate.h
//  07-协议的应用-代理模式
//
//  Created by apple on 13-6-30.
//  Copyright (c) 2013年 apple. All rights reserved.
//
#import <Foundation/Foundation.h>

// 声明一些跑腿方法
@protocol TicketDelegate <NSObject>

// 返回票价
- (double) ticketPrice;

// 还剩多少张票
- (int) leftTicketsNumber;

@end

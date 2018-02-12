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

/*
 1> @required (默认)
 要求实现，如果没有实现，会发出警告
 2> @optional
 不要求实现，不会有警告
 */

// 返回票价
- (double) ticketPrice;

// 还剩多少张票
@optional
- (int) leftTicketsNumber;

@end

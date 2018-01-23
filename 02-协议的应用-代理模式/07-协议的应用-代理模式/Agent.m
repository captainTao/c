//
//  Agent.m
//  07-协议的应用-代理模式
//
//  Created by apple on 13-6-30.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "Agent.h"

@implementation Agent

// 剩余的票数
- (int)leftTicketsNumber
{
    // ... 亲自跑电影院\或者打电话
    
    return 1;
}

// 每一张票多少钱
- (double)ticketPrice
{
    // ... 亲自跑电影院\或者打电话
    return 1000;
}
@end

//
//  Person.h
//  07-协议的应用-代理模式
//
//  Created by apple on 13-6-30.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicketDelegate.h"

@interface Person : NSObject

// 拥有一个代理属性
// id代表代理的类名随便
// 但必须遵守TicketDelegate协议
@property (nonatomic, retain) id<TicketDelegate> delegate; // 定义代理需要遵守的协议

- (void) buyTicket;

@end

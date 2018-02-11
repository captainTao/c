//
//  Person.m
//  08-广播多个发送一个接受
//
//  Created by captain on 2018/2/9.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)testNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction) name:@"testNotification content!" object:nil];
}

-(void)testAction
{
    NSLog(@"我已经接收到信息！");
}

-(void)dealloc
{
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"testNotification content!" object:nil];
}
@end

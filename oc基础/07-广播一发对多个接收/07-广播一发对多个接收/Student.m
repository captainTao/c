//
//  Student.m
//  07-广播一发对多个接收
//
//  Created by captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

// 注册：
-(id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction) name:@"testNotification" object:nil];
    }
    return self;
}

// 响应：
-(void)testAction
{
    NSLog(@"Student接受到广播");
}

//销毁：
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"testNotification" object:nil
     ];
    NSLog(@"Student收到的广播被销毁");
}

@end

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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction:) name:@"testNotification content!" object:nil];
    s1 = [[Student alloc]init];
    t1 = [[Teacher alloc]init];
}

-(void)testAction:(NSNotification *)notific
{
    NSObject *obj = notific.object;
    NSDictionary *dic = notific.userInfo;
    NSLog(@"我接收到%@信息为%@！！", obj, dic);
}

-(void)dealloc
{
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"testNotification content!" object:nil];
    NSLog(@"通知被销毁！！");
}
@end

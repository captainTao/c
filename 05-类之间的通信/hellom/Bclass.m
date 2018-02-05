//
//  Bclass.m
//  hellom
//
//  Created by captain on 2018/1/31.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Bclass.h"

@implementation Bclass

-(void)testBlcok:(MyBlock)block str1:(NSString *)str1
{
    NSLog(@"我是被谁调用的：%@", str1);
    NSLog(@"我来自于B类");
    block(@"我是在B类中执行的block");
}

// A -> B, A向B发广告
-(void)testNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction) name:@"testnotific.." object:nil];
}
-(void)testAction
{
    NSLog(@"我已经收到广播");
}
@end

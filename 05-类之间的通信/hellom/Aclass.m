//
//  Aclass.m
//  hellom
//
//  Created by captain on 2018/1/31.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Aclass.h"

@implementation Aclass

-(void)testBlock
{
    // 类之间的通信：A找B办事
    // 代码块实现通信
    /*
    MyBlock b1 = ^(NSString *str1){
        NSLog(@"Aclass :%@", str1);
    };
    Bclass *classb = [[Bclass alloc]init];
    [classb testBlcok:b1 str1:@"Aclass"];
     */
    // 快速实现方法：
    Bclass *classb = [[Bclass alloc]init];
    [classb testBlcok:^(NSString *str1){
        NSLog(@"Aclass:%@", str1);
    } str1:@"Aclass"];
  
}

// A发送广播
-(id)init
{
    if (self = [super init]) {
        //不带参数的广播
        //[[NSNotificationCenter defaultCenter]postNotificationName:@"testnotific.." object:nil];
        //带参数的广播
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setValue:@"123" forKey:@"key"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"testnotific.." object:[NSNumber numberWithInt:5] userInfo:dic];
    }
    return self;
}
@end

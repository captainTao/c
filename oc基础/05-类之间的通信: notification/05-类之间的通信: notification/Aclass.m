//
//  Aclass.m
//  05-类之间的通信: notification
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Aclass.h"

@implementation Aclass

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

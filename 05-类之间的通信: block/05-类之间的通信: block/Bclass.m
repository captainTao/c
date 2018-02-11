//
//  Bclass.m
//  05-类之间的通信: block
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Bclass.h"

@implementation Bclass

// Block调用
-(void)testBlcok:(MyBlock)block str1:(NSString *)str1
{
    NSLog(@"我是被谁调用的：%@", str1);
    NSLog(@"我来自于B类");
    block(@"我是在B类中执行的block");
}

@end

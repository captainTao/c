//
//  main.m
//  08-广播多个发送一个接受
//
//  Created by captain on 2018/2/9.
//  Copyright © 2018年 captain. All rights reserved.
//
/*
 广播：多个发送，1个接收；
 techer和student发送，person接收：
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc]init];
        [p1 testNotification];
    }
    return 0;
}

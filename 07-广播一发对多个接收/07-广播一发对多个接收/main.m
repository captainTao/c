//
//  main.m
//  07-广播一发对多个接收
//
//  Created by captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 类通信：
 广播：一人发送，多人接受
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

//
//  main.m
//  05-类之间的通信: notification
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aclass.h"
#import "Bclass.h"
/*
 广播：
 注册-->响应-->销毁
 A向B发送广播:
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 广播：一对一
        Bclass *b1 = [[Bclass alloc]init];
        [b1 testNotification];
        
    }
    return 0;
}

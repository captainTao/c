//
//  main.m
//  09-定时器的使用
//
//  Created by captain on 2018/2/12.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Timer *t1 = [[Timer alloc]init];
        [t1 testTimer];
    }
    return 0;
}

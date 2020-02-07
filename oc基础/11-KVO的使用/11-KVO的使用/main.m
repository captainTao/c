//
//  main.m
//  11-KVO的使用
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//
/*KVO基本步骤：
 1.注册
 2.观察
 3.移除观察者
 */
#import <Foundation/Foundation.h>
#import "KVO.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        KVO *k = [[KVO alloc]init];
        [k testKVO];
    }
    return 0;
}

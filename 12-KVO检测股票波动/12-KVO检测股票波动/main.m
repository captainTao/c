//
//  main.m
//  12-KVO检测股票波动
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVO.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        KVO *k = [[KVO alloc]init];
        [k detectStockPrice];
        
        /*
         NSString *str = @"ijjavahehe";
         
         // 查找某个字符串在str中的范围，返回的是一个结构体
         // 如果找不到，length=0，location=NSNotFound==-1
         
         NSRange range = [str rangeOfString:@"java"]; // 查找java在str中的位置：
         NSLog(@"loc = %ld, length=%ld", range.location, range.length);
         // loc = 2, length=4
         */

    }
    return 0;
}


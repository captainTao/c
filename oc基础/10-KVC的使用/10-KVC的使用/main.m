//
//  main.m
//  10-KVC的使用
//
//  Created by captain on 2018/2/13.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 KVC模式是动态添加;
 可以用如下两种方式添加，效果一样；
 setValue:@"herry" forKeyPath:@"name"®
 setValue:@"jack" forKey:@"name"
 */

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc]init];
        [p1 setValue:@"herry" forKeyPath:@"name"];
        [p1 setValue:@"18" forKeyPath:@"age"];
        
        Person *p2 = [[Person alloc]init];
        [p2 setValue:@"jack" forKey:@"name"];
        [p2 setValue:@"22" forKey:@"age"];
        
        NSLog(@"p1=%d, p2.age=%@",p1.age, p2.name);
    }
    return 0;
}

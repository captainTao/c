//
//  main.m
//  07-循环引用
//
//  Created by apple on 13-8-9.
//  Copyright (c) 2013年 itcast. All rights reserved.
//


/*
 1.@class的作用：仅仅告诉编译器，某个名称是一个类
 @class Person; // 仅仅告诉编译器，Person是一个类
 
 2.开发中引用一个类的规范
 1> 在.h文件中用@class来声明类
 2> 在.m文件中用#import来包含类的所有东西
 
 3.两端循环引用解决方案
 1> 一端用retain
 2> 一端用assign
 
 */

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Person.h"

int main()
{
    // p - 1
    Person *p = [[Person alloc] init];
    // c - 1
    Card *c = [[Card alloc] init];
    
    // c - 2
    p.card = c;
    
    // p - 2
    c.person = p;
    
    // c - 1
    [c release];
    
    // p - 0  c - 0
    [p release];
    return 0;
}


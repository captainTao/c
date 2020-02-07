//
//  Person.m
//  07-广播一发对多个接收
//
//  Created by captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Person.h"
#import "Teacher.h"
#import "Student.h"

@implementation Person

-(void)testNotification
{
//    这种对象创建完，马上就销毁了；
//    [[Teacher alloc]init];
//    [[Student alloc]init];
    
    s1 = [[Student alloc]init];
    t1 = [[Teacher alloc]init];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"testNotification" object:nil];
}
@end

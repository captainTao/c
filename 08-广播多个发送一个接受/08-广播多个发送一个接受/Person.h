//
//  Person.h
//  08-广播多个发送一个接受
//
//  Created by captain on 2018/2/9.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"

@interface Person : NSObject
{
    Student *s1;
    Teacher *t1;
}
-(void)testNotification;
@end

//
//  Person.h
//  07-广播一发对多个接收
//
//  Created by captain on 2018/2/6.
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
//声明变量类型，如上或者如下：
//@property (nonatomic, strong) Teacher *teacher;
//@property (nonatomic, strong) Student *student;
-(void)testNotification;
@end

//
//  Student.m
//  08-广播多个发送一个接受
//
//  Created by captain on 2018/2/9.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)init
{
    if(self = [super init])
    {
        NSDictionary *dics = @{@"name" : @"jason", @"address" : @"Chengdu"};
//        NSObject *objs = [NSNumber numberWithInt:50];
        NSString *objs = @"Student发送";

        [[NSNotificationCenter defaultCenter]postNotificationName:@"testNotification content!" object:objs userInfo:dics];
    }
    return self;
}
@end

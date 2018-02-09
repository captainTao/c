//
//  Teacher.m
//  07-广播一发对多个接收
//
//  Created by captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
-(id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction) name:@"testNotification" object:nil];
    }
    return self;
}

-(void)testAction
{
    NSLog(@"teacher接受到广播");
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"testNotification" object:nil
     ];
}
@end

//
//  Aclass.m
//  05-类之间的通信: block
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Aclass.h"

@implementation Aclass

-(void)testBlock
{
    // 类之间的通信：A找B办事
    // 代码块实现通信
    /*
     MyBlock b1 = ^(NSString *str1){
     NSLog(@"Aclass :%@", str1);
     };
     Bclass *classb = [[Bclass alloc]init];
     [classb testBlcok:b1 str1:@"Aclass"];
     */
    // 快速实现方法：
    Bclass *classb = [[Bclass alloc]init];
    [classb testBlcok:^(NSString *str1){
        NSLog(@"Aclass:%@", str1);
    } str1:@"Aclass"];
}

@end

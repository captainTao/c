//
//  Bclass.h
//  hellom
//
//  Created by captain on 2018/1/31.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aclass.h"

typedef void (^MyBlock)(NSString *);

@interface Bclass : NSObject
// 代码块：
-(void)testBlcok:(MyBlock)block str1:(NSString *)str1;

//广播：
-(void)testNotification;

@end

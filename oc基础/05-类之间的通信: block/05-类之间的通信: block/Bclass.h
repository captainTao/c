//
//  Bclass.h
//  05-类之间的通信: block
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bclass : NSObject

typedef void (^MyBlock)(NSString *);

// 代码块：
-(void)testBlcok:(MyBlock)block str1:(NSString *)str1;

@end

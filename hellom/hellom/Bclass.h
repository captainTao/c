//
//  Bclass.h
//  hellom
//
//  Created by captain on 2018/1/31.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyBlock)(NSString *);
@interface Bclass : NSObject
-(void)testBlcok:(MyBlock)block str1:(NSString *)str1;
@end

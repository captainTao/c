//
//  KVO.h
//  11-KVO的使用
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface KVO : NSObject

@property(nonatomic, strong)Person *p1;
-(void)testKVO;

@end

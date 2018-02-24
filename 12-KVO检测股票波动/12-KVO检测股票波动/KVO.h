//
//  KVO.h
//  12-KVO检测股票波动
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stock.h"

@interface KVO : NSObject

@property(nonatomic, strong) Stock *stock1;
-(void)detectStockPrice;

@end

//
//  KVO.m
//  12-KVO检测股票波动
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "KVO.h"
float currentPrice;

@implementation KVO
-(void)detectStockPrice;
{
    self.stock1 = [[Stock alloc]init];
    [self.stock1 setPrice:currentPrice];
}

@end

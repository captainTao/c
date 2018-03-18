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
// 注册  --- 实例化对象或成员变量，注册观察者
-(void)detectStockPrice;
{
    //stock的实例化：
    self.stock1 = [[Stock alloc]init];
    [self.stock1 setPrice:currentPrice];
    [self.stock1 addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    //timer的实例化：
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(pricechange) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];
}

-(void)pricechange
{
    currentPrice += 0.1;
    [self.stock1 setPrice:currentPrice];
}
// 观察 --- 判断观察结果！处理结果
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSString *oldPriceS = [change valueForKey:@"old"];
    NSString *newPriceS = [change valueForKey:@"new"];
    float oldPrice = oldPriceS.floatValue;
    float newPrice = newPriceS.floatValue;
    if (newPrice > oldPrice) {
        NSLog(@"股票价格正在上涨，当前价格为%0.2f！", newPrice);
    }else
    {
        NSLog(@"股票价格下跌了，当前价格为%0.3f！", newPrice);
    }
    
}

//移除观察着 -- 对象销毁时
-(void)dealloc
{
    [self.stock1 removeObserver:self forKeyPath:@"price"];
}
@end

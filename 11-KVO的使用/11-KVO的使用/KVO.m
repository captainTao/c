//
//  KVO.m
//  11-KVO的使用
//
//  Created by captain on 2018/2/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "KVO.h"

@implementation KVO
/*KVO基本步骤：
 1.注册
 2.观察
 3.移除观察者
 */
-(void)testKVO
{
//    //1.注册
    self.p1 = [[Person alloc]init];
    [self.p1 setAge:15];
    [self.p1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    /* //或者直接去掉self
     _p1 = [[Person alloc]init];
     _p1.age = 15;
     [_p1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
     _p1.age = 19;
     */
    self.p1.age = 19; //有年龄变化
    
}

-(void)dealloc
{
    [self.p1 removeObserver:self forKeyPath:@"age"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"年龄age变化了");
    
    //获取老的和新的值：
    NSString *oldage = [change valueForKey:@"old"];
    NSLog(@"现在的年龄为：%@岁", oldage);
    NSString *newage = [change valueForKey:@"new"];
    NSLog(@"现在的年龄为：%@岁", newage);
}

@end

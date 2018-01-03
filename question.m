/************************************************.01*/


#import <Foundation/Foundation.h>

@interface Car : NSObject
{// 成员变量
    @public
    int wheels;
    int speed;
}

- (void)run;
@end

@implementation Car
- (void)run
{
    NSLog(@"%d个轮子，速度为%dkm/h的车子跑起来", wheels, speed);
}
@end


void test(int w, int s)
{
    w = 20;
    s = 200;
}

void test1(Car *newC)
{
    newC->wheels = 5;
}

void test2(Car *newC)
{
    Car *c2 = [Car new];
    c2->wheels = 5;
    c2->speed = 300;
    
    newC = c2;
    newC->wheels = 6;
}

int main()
{
    Car *c = [Car new];
    c->wheels = 4;
    c->speed = 250;
    
    //test(c->wheels, c->speed);
    //test1(c);
    test2(c);
    
    [c run];
    
    return 0;
}

/*
结果为：4个轮子，速度为250km/h的车子跑起
为什么c2这个对象没有复制成功？

c2位局部变量，只是局部生效？

*/
/************************************************.02*/


/************************************************.03*/


/************************************************.04*/


/************************************************.05*/

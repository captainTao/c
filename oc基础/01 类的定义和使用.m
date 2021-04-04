#import <Foundation/Foundation.h>
void test2();
@interface Car : NSObject //加上:NSObject的目的是让Car类具备创建对象的能力
{
    @public   //@public可以让Car对象的wheels和speed属性被外界访问
    int wheels; // 多少个轮子
    int speed; // 时速
}
- (void)run; // 跑的行为
@end//  默认会初始化为0

@implementation Car
- (void) run
{
    NSLog(@"%i个轮子，%i时速的车子跑起来了", wheels, speed);
}
@end

int main()
{
    // 创建车子对象
    Car *c = [Car new];//Car new]每次都会创建出新的对象，并且返回对象的地址，那么就应该用一个指针变量保存对象的地址
    c->wheels = 3;  //设置指针c， car对象的属性
    c->speed = 300;
    test2(c);
    [c run];  //结果：6,250
    return 0;
}
void test2(Car *newC){  //创建car类的指针，car类似于int,char类型
    newC->speed = 250;
    newC->wheels = 6;
}


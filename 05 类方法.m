/*
 对象方法
 1> 减号 - 开头
 2> 只能由对象来调用
 3> 对象方法中能访问当前对象的成员变量（实例变量）
 
 类方法
 1> 加号 + 开头
 2> 只能由类（名）来调用
 3> 类方法中不能访问成员变量（实例变量）
 
 
 类方法的好处和使用场合
 1> 不依赖于对象，执行效率高
 2> 能用类方法，尽量用类方法
 3> 场合：当方法内部不需要使用到成员变量时，就可以改为类方法
 
 可以允许类方法和对象方法同名
 */



// 工具类：基本没有任何成员变量，里面的方法基本都是类方法


/***********************************************/

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int age;
}

// 类方法都是以+开头
+ (void)printClassName;

- (void)test;
+ (void)test;

@end

@implementation Person

+ (void)printClassName
{
    // error：instance variable 'age' accessed in class method
    // 实例变量age不能在类方法中访问
    //NSLog(@"这个类叫做Person-%d", age);
}

- (void)test
{
    NSLog(@"111-%d", age);
    
    //[Person test];
}

+ (void)test
{
    // 会引发死循环
    //[Person test];
    
    NSLog(@"333");
    
    // 会引发死循环
//    /[Person test];
}

@end

int main()
{
    //[Person printClassName];
    
    [Person test];   //333
    
    //Person *p = [Person new];
    //[p test];
    
    /*
     -[Person printClassName]: unrecognized selector sent to instance 0x7fa520c0b370
     */
    // 系统会认为现在调用的printClassName是个对象方法
    //[p printClassName];
    
    return 0;
}




/***********************************************/


// 类方法举例


// 一般用于工具类
/*
 设计一个计算器类
 * 求和
 * 求平均值
 */

#import <Foundation/Foundation.h>

// 工具类：基本没有任何成员变量，里面的方法基本都是类方法
@interface JiSusnQi : NSObject
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2;

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2;
@end

@implementation JiSusnQi
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2
{
    int sum = [JiSusnQi sumOfNum1:num1 andNum2:num2];  //JiSusnQi可以替换为self, self代表当前对象，当前类
    // int sum = [self sumOfNum1:num1 andNum2:num2]; 
    return sum / 2;
}
@end

int main()
{
    int a = [JiSusnQi averageOfNum1:10 andNum2:12];
    
    NSLog(@"a=%d", a);
    
//    JiSusnQi *jsq = [JiSusnQi new];
//    
//    
//    [jsq sumOfNum1:10 andNum2:13];
    
    return 0;
}
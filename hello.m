1. 常见区别
关键字以@开头
nil相当于NULL,0
输出用NSLog(@"hello")

2. 编译的区别

#include <stdio.h>
int main()
{
    printf("第1个OC程序\n");
    return 0;
}

编译cc –c main.m
链接cc main.o
运行./a.out


#import <Foundation/Foundation.h>
int main()
{
    NSLog(@"第2个OC程序");
    return 0;
}

编译cc –c main.m
链接cc main.o –framework Foundation
运行./a.out


3. note:
NSLog输出后会自动换行，printf输出后不会自动换行


4. #import的作用
跟#include一样，用来拷贝某个文件的内容
可以自动防止文件内容被拷贝多次，也就以为着头文件中不用加入下面的预处理指令了
#ifndef 	_STDIO_H_
#define	_STDIO_H_
#endif


5. Foundation框架的作用
a. 开发OC、iOS、Mac程序必备的框架
b. 此框架中包含了很多常用的API（应用编程接口）
c. 框架中包含了很多头文件，若想使用整个框架的内容，包含它的主头文件即可 
#import <Foundation/Foundation.h>


6. BOOL的使用
a. BOOL类型的本质
typedef signed char BOOL;
b. BOOL类型的变量有2种取值：YES、NO
#define YES (BOOL)1
#define NO  (BOOL)0
c. BOOL的输出(当做整数来用)
NSLog(@"%d %d", YES, NO);



面向过程 Procedure Oriented
面向对象 Object Oriented，简称OO
面向对象编程 Object Oriented Programming，简称OOP


oc 类：

-------------------------------------------
#import <Foundation/Foundation.h>
// 类的声明

@interface Car : NSObject //加上:NSObject的目的是让Car类具备创建对象的能力
{
    @public   //@public可以让Car对象的wheels和speed属性被外界访问
    int wheels; // 多少个轮子
    int speed; // 时速
}
- (void)run; // 跑的行为,有参数的话用括号，()只能是括住数据类型；
// 方法必须以减号  -  开头
// 方法用小括号括住数据类型
// 方法需要写在大括号外面
@end
// 	默认会初始化为0


// 类的实现
@implementation Car //用来实现类的声明
- (void) run 
{
    NSLog(@"%i个轮子，%i时速的车子跑起来了", wheels, speed);
}
@end


// 创建对象

// 主函数
int main()
{
    // 创建车子对象
    Car *c = [Car new];//Car new]每次都会创建出新的对象，并且返回对象的地址，那么就应该用一个指针变量保存对象的地址
    c->wheels = 3;  //设置指针c， car对象的属性
    c->speed = 300;
    
    [c run]; //给c发一条run的信息
    return 0;
}


// 创建多个Car对象,用类创建的每个对象在内存中都是独立的，互不干扰；
// 分别只设置wheels、speed属性
Car *c1 = [Car new];
c1->wheels = 4;

Car *c2 = [Car new];
c2->speed = 250;
[c1 run]; 


// 1个赋值给另一个，然后修改属性 （复制对象，然后修改）
Car *c1 = [Car new];
c1->wheels = 4;
c1->speed = 250;

Car *c2 = c1;
c2->wheels = 3;
[c1 run];

-------------------------------------------
note:
1.@interface就好像暴露在外面的时钟表面
2.@implementation就好像隐藏在时钟内部的构造实现

3.常见错误:
-  只有类的声明，没有类的实现
-  漏了@end
-  @interface和@implementation嵌套
-  两个类的声明嵌套
-  成员变量没有写在括号里面
-  方法的声明写在了大括号里面

4.  语法细节
-  成员变量不能在{}中进行初始化、不能被直接拿出去访问
-  方法不能当做函数一样调用
-  成员变量\方法不能用static等关键字修饰，别跟C语言混在一起（暂时忽略）
-  类的实现可用写在main函数的后面，主要在声明后面就行了

5.  OC方法和函数的区别
-  OC方法只能声明在@interface和@end之间，只能实现在@implementation和@end之间。也就是说OC方法不能独立于类存在
-  C函数不属于类，跟类没有联系，C函数只归定义函数的文件所有
-  C函数不能访问OC对象的成员
-  低级错误：方法有声明，但是实现的时候写成了函数
-  函数和对象一点关系都没有，函数除了不能放在 interface 声明里面外，其余的地方都可以放；

6.  OC的方法注意
-  方法只有声明，没有实现（经典错误）
-  方法没有声明，只有实现（编译器警告，但是能调用，OC的弱语法）
-  编译的时候：访问没有的成员变量直接报错，访问没有的方法，只是警告

7.  @implementation
a, 没有@interface，只有@implementation，也是能成功定义一个类的
@implementation Car : NSObject
{
    @public
    int wheels; // 多少个轮子
    int speed; // 时速
}
- (void) run  
{
    NSLog(@"%i个轮子，%i时速的车子跑起来了", wheels, speed);
}
@end
b,  @implementation中不能声明和@interface一样的成员变量



--------------------------
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



// 类的合理设计


//
//  类的合理设计.m
//  需求：人遛狗
//
//  Created by captain on 2017/12/5.
//
typedef enum {
    SexMan,
    SexWoman
} Sex;
typedef struct {
    int year;
    int mouth;
    int day;
} Date;
typedef enum {
    ColorGreen,
    ColorBlack,
    ColorRed
} Color;

#import <Foundation/Foundation.h>

@interface Dog : NSObject  //狗的属性
{
@public
    Color curclor;//毛色
    double weight;//体重
}
- (void)run;
- (void)eat;
@end

@implementation Dog
- (void)run{
    weight -= 1;
    NSLog(@"狗跑完这次后的体重%f", weight);
}
- (void)eat{
    weight += 1;
    NSLog(@"狗吃完这次后的体重%f", weight);
}
@end

@interface Student :NSObject  //人的属性:吃，跑，遛狗，喂狗
{
    @public
    Sex sex; //性别
    Date birthday;//生日
    double weight;//体重
    Color favcolor;//喜欢的颜色
    char *name; //经编译发现这儿不能直接用name,只能用 *name,不知道为什么？是否可以理解为char为一个类？人拥有名称这个属性
    Dog *dog; //一个人一条狗，相当于狗也是人的属性，所以dog也是一个指针；
}
- (void)eat;
- (void)run;
- (void)print;

- (void)rundog;
- (void)feeddog;
@end

@implementation Student
- (void) eat
{
    weight += 1; //体重+1
    NSLog(@"人吃完这次后的体重为%f", weight);
}
- (void) run
{
    weight -= 1; //体重-1
    NSLog(@"人跑完这次后的体重为%f", weight);
}
- (void)print
{
    NSLog(@"姓名=%s,体重=%f,颜色=%d,性别=%d,生日=%d-%d-%d", name, weight, favcolor, sex,  birthday.year, birthday.mouth, birthday.day);
}

- (void)rundog{
//    让狗跑起来
    NSLog(@"遛狗...");
    [dog run];
}
- (void)feeddog{
//    让狗吃起来
    NSLog(@"喂狗...");
    [dog eat];
}
@end


int main(){
    Student *s = [Student new]; //创建学生这个对象；
    Dog *n = [Dog new];
    n->curclor = ColorBlack;//一条黑狗
    n->weight = 20; //一条10斤的狗
    
    s->dog = n;//把一条新的狗赋值给学生类中狗的属性；
    s->weight = 50;
    s->sex = SexMan;//性别赋值；
    //    s->birthday = {2012,9,12}; //编译报错，在定义结构体变量的时候才能这样写；
   
    /*可以这样写：
    s->birthday.year = 2012;
    s->birthday.mouth = 9;
    s->birthday.day = 12;
    */
    
    /*  或者像如下赋值
    Date d = s->birthday
    d.year = 2012;
    d.mouth = 9;
    d.day = 12;
    s->birthday = d;
    */
   
    // 或者这样赋值---只有在定义变量的时候才你能够赋值，不能直接：s->birthday = {2012,9,12};
    Date d ={2012,9,12};
    s->birthday = d;
    
    s->name = "jack";
    s->favcolor = ColorBlack;//赋值颜色
    
//    [s eat];
//    [s eat];
//    [s run];
//    [s run];
//    [s print];

    [s rundog];
    [s feeddog];
    return 0;
}



// 匿名对象：类新建对象的时候，不用指针命名



NSString的简单使用

1.  字符串的快速创建
NSStirng *str = @“Hello”;
2.  使用静态方法创建
3.  使用%@输出字符串
NSString *name = @”mj”;
NSLog(@“我的名字是%@”,  name);


面向对象的三大特性：
封装，继承，多态

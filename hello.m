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



// 无参，有参函数的调用


#import <Foundation/Foundation.h>

// 有参,有返回值方法类的调用
/*
计算器：
1.返回pi
2.返回一个整数的平方
3.返回两个整数的和
*/
@interface Calculator : NSObject
- (double)pi;
- (int)square:(int)num;
// - (int)sum:(int)num1 :(int)num2;  //一般不这么写
- (int)sumWithNum1:(int)num1 andNum2:(int)num2;
@end

@implementation Calculator
- (double)pi{
    return 3.14;
}
- (int)square:(int)num{
    return num * num;
}
- (int)sumWithNum1:(int)num1 andNum2:(int)num2{
    return num1 + num2;
}
@end

int main(int argc, char const *argv[])
{
    Calculator *cal = [Calculator new];

    NSLog(@"调用pi方法之后的值：%f", [cal pi]); //0个参数一个返回值
    NSLog(@"平方后的值为%d", [cal square:10]); //一个参数一个返回值
    NSLog(@"两个参数的和为%d", [cal sumWithNum1:8 andNum2:9]);//两个参数一个返回值
    return 0;
}





// 对象的封装

声明；（成员变量，每个变量的可读写）
方法实例；（可读写的具体内容）
main主函数：（新建对象，然后实现对应的方法）

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    // 成员变量尽量不要用@public
    // @public
    int age;
    
    //@public
    // 只读（readonly）：只允许外界访问我的no，不允许外界修改我的no
    int no; // 只需要提供get方法
}

//
/*
 set方法
 1.作用： 提供一个方法给外界设置成员变量值，可以在方法里面对参数进行相应过滤
 2.命名规范：
 1> 方法名必须以set开头
 2> set后面跟上成员变量的名称，成员变量的首字母必须大写
 3> 返回值一定是void
 4> 一定要接收一个参数，而且参数类型跟成员变量类型一致
 5> 形参的名称不能跟成员变量名一样
 */
- (void)setAge:(int)newAge;

/*
 get方法
 1.作用：返回对象内部的成员变量
 2.命名规范：
 1> 肯定有返回值，返回值类型肯定与成员变量类型一致
 2> 方法名跟成员变量名一样
 3> 不需要接收任何参数
 */
- (int)age;

- (void)study;

@end

@implementation Student

// set方法的实现
- (void)setAge:(int)newAge
{
    // 对传进来的参数进行过滤
    if (newAge <= 0)
    {
        newAge = 1;
    }
    
    age = newAge;
}

- (int)age
{
    return age;
}

- (void)study
{
    NSLog(@"%d岁的学生在学习", age);
}

@end

int main()
{
    Student *stu = [Student new];
    //stu->age = -10;
    
    //stu->age = 10;
    
    [stu setAge:10];
    
    
    NSLog(@"学生的年龄是%d岁", [stu age]);
    
    //[stu study];
    
    
    return 0;
}



// oc允许传递没有被定义的消息，但c，和c++允许
// oc的方法是动态调用，是在运行中才会检测；


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
    int sum = [JiSusnQi sumOfNum1:num1 andNum2:num2]; //JiSusnQi可以替换为self, self代表当前对象，代表类
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


self对象：


#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

- (void)test;

@end

@implementation Person
- (void)setAge:(int)age
{
    // _age = age;
    self->_age = age;
}
- (int)age
{
    return self->_age;
}

- (void)test
{
    // self：指向了方向调用者,代表着当期对象
    int _age = 20;
    NSLog(@"Person的年龄是%d岁", self->_age);
}

@end

int main()
{
    Person *p = [Person new];
    
    [p setAge:10];
    
    [p test];
    
    return 0;
}






/*
 self的用途：
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法利用"self->成员变量名"访问当前对象内部的成员变量
 
 2> [self 方法名]可以调用其他对象方法\类方法
 */
#import <Foundation/Foundation.h>
@interface Dog : NSObject
- (void)bark;
- (void)run;
@end

@implementation Dog
- (void)bark
{
    NSLog(@"汪汪汪");
}
- (void)run
{
    [self bark];  //self指向了当前对象
    //NSLog(@"汪汪汪");
    NSLog(@"跑跑跑");
}
@end

int main()
{
    Dog *d = [Dog new];
    
    [d run];
    
    return 0;
}


继承
/*
 1.继承的好处：
 1> 抽取重复代码
 2> 建立了类之间的关系
 3> 子类可以拥有父类中的所有成员变量和方法
 
 2.注意点
 1> 基本上所有类的根类是NSObject
 */


/*
 1.重写：子类重新实现父类中的某个方法，覆盖父类以前的做法
 2.注意
 1> 父类必须声明在子类的前面
 2> 子类不能拥有和父类相同的成员变量
 3> 调用某个方法时，优先去当前类中找，如果找不到，去父类中找
 
 2.坏处：耦合性太强


 继承的使用场合
 1> 当两个类拥有相同属性和方法的时候，就可以将相同的东西抽取到一个父类中
 2> 当A类完全拥有B类中的部分属性和方法时，可以考虑让B类继承A类
 */


每一个对象里面有一个isa指针，它指向类；
而每个类中有一个superclass指针，它指向它的父类；


/********Animal的声明*******/
@interface Animal : NSObject
{
    int _age;
    double _weight;
}

- (void)setAge:(int)age;
- (int)age;

- (void)setWeight:(double)weight;
- (double)weight;
@end

/********Animal的实现*******/
@implementation Animal
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)setWeight:(double)weight
{
    _weight = weight;
}
- (double)weight
{
    return _weight;
}
@end

/********Dog*******/
// : Animal 继承了Animal，相当于拥有了Animal里面的所有成员变量和方法
// Animal称为Dog的父类
// Dog称为Animal的子类
@interface Dog : Animal
@end

@implementation Dog
@end

/********Cat*******/
@interface Cat : Animal
@end

@implementation Cat
@end

int main()
{
    Dog *d = [Dog new];
    
    [d setAge:10];
    
    NSLog(@"age=%d", [d age]);
    return 0;
}

/*
1.继承的使用场合
 1> 当两个类拥有相同属性和方法的时候，就可以将相同的东西抽取到一个父类中
 2> 当A类完全拥有B类中的部分属性和方法时，可以考虑让B类继承A类
 A
 {
    int _age;
    int _no;
 }
 
 B : A
 {
    int _weight;
 }
 
 // 继承：xx 是 xxx
 // 组合：xxx 拥有 xxx
 
 2.组合
 A
 {
     int _age;
     int _no;
 }
 
 B
 {
     A *_a;
     int _weight;
 }
*/

组合：


@interface Score : NSObject
{
    int _cScore;
    int _ocScore;
}
@end

@implementation Score
@end

@interface Student : NSObject
{
    // 组合
    Score *_score;      // 组合，一个类拥有另外一个类
//    int _cScore;
//    int _ocScore;
    int _age;
}
@end

@implementation Student

@end


super对象

/*
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 */

#import <Foundation/Foundation.h>

// 僵尸
@interface Zoombie : NSObject
- (void)walk;

+ (void)test;
- (void)test;

@end

@implementation Zoombie
- (void)walk
{
    NSLog(@"往前挪两步******");
}

+ (void)test
{
    NSLog(@"Zoombie+test");
}

- (void)test
{
    NSLog(@"Zoombie-test");
}
@end

// 跳跃僵尸
@interface JumpZoombie : Zoombie
+ (void)haha;
- (void)haha2;
@end


@implementation JumpZoombie

+ (void)haha
{
    [super test];
}

- (void)haha2
{
    [super test];
}

- (void)walk
{
    // 跳两下
    NSLog(@"跳两下");
    
    // 走两下(直接调用父类的walk方法)
    [super walk];
    //NSLog(@"往前挪两步----");

}
@end

int main()
{
    //[JumpZoombie haha];
    JumpZoombie *jz = [JumpZoombie new];
    
    [jz haha2];
    
    return 0;
}
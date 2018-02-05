60min入门教程：
https://github.com/qinjx/30min_guides/blob/master/ios.md

meteclass是放在哪里？
http://blog.csdn.net/windyitian/article/details/19810875
http://blog.csdn.net/jijunyuan/article/details/46780257

oc的cache呢
说道签名 了吗？
消息转发流程是吧
oc的runtime使用场景
runloop runtime
用present
就是两个vc跳转

任我行。当然薪资可能不理想5000-10000

你先看基础的
然后底层看


dealloc  最好还是写起   也还要做些事情   比如移除观察者  等其他释放性的操作
这里面要写广播的注册，发送，响应，销毁
--------------------------------------
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
链接cc main.o          ------这一句就可以了
运行./a.out


#import <Foundation/Foundation.h>     //系统自带的用<>,不是自带的用引号""；在.m文件见中尽量用import，不用include.
int main()
{
    NSLog(@"第2个OC程序");
    return 0;
}

编译cc –c main.m
链接cc main.o –framework Foundation           ------这一句就可以了
运行./a.out


3. note:
NSLog输出后会自动换行，printf输出后不会自动换行
double f = 2.1e-10;
NSLog(@"%g", f); // 科学计数用%g来输出
%u, 无符号输出；


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

Foundation框架头文件的路径
1> 右击Xcode.app --> 显示包内容
2> Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.0.sdk/System/Library/Frameworks/Foundation.framework
 

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



/***************************** BOOL *********************************/
#import <Foundation/Foundation.h>

BOOL test(BOOL mybool)
{
    return NO;
}

int main()
{
    BOOL b = YES;
    
    BOOL b2 = NO;
    
    BOOL b3 = 1; // YES
    
    BOOL b4 = 0; // NO
    
    
    //NSLog(@"%i", b);
    
    NSLog(@"%d", test(YES));
    return 0;
}

/******************************** oc 类*******************************/
// oc 类：


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

/******************************* 类的语法细节 *************************************/

/*

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
-  类的实现可用写在main函数的后面，主函数在声明后面就行了

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

*/

/*
NSString的简单使用

1.  字符串的快速创建
NSStirng *str = @“Hello”;
2.  使用静态方法创建
3.  使用%@输出字符串
NSString *name = @”mj”;
NSLog(@“我的名字是%@”,  name);
*/


/****************************** 类的定义 **************************************/

// 类的定义：

#import <Foundation/Foundation.h>
void test2();
@interface Car : NSObject //加上:NSObject的目的是让Car类具备创建对象的能力
{
    @public   //@public可以让Car对象的wheels和speed属性被外界访问
    int wheels; // 多少个轮子
    int speed; // 时速
    // 成员变量不能在类声明中进行初始化，比如：double height = 1.55;
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
    Car *c = [Car new]; //Car new]每次都会创建出新的对象，并且返回对象的地址，那么就应该用一个指针变量保存对象的地址
    c->wheels = 3;  //设置指针c， car对象的属性
    c->speed = 300;
    test2(c);
    [c run];  //结果：6,250
    return 0;
}

// 方法不能独立于类存在，类外面只能定义函数
void test2(Car *newC){  //创建car类的指针，car类似于int,char类型
    newC->speed = 250;
    newC->wheels = 6;
}



/**************************** 类的合理设计 **********************************/

// 类的合理设计

//
//  类的合理设计.m
//  需求：人遛狗
//

typedef enum {  //枚举定义类型
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


/***************************** 带参数和不带参数的类方法 ****************************/


// 匿名对象：类新建对象的时候，不用指针命名


// 在类中；无参，有参函数的调用

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


/****************** 对象的封装：-set, get *************************/

// 对象的封装：-set, get：

//   封装的好处
// 1. 过滤不合理的值
// 2. 屏蔽内部的赋值过程
// 3. 让外界不必关注内部的细节


// 一般步骤：
// 声明：（成员变量，确定每个变量的可读写）
// 方法实例；（可读写的具体内容）
// main主函数：（新建对象，然后实现对应的方法）


// OC的弱语法：
// oc允许传递没有被定义的消息，但c，和c++不允许
// oc的方法是动态调用，是在运行中才会检测；


/*
面向对象的三大特性：
封装，继承，多态

set方法:
1.有参数，参数类型与成员变量保持一致
2.返回值为void
3.命名以set开始，后面成员变量名的首字母必须大写

1)  作用：用来设置成员变量，可以在方法里面过滤掉一些不合理的值
2)  命名规范：
  # 方法都是以set开头，而且后面跟上成员变量名，成员变量名的首字母必须大写
  # 形参名称不要跟成员变量同名


get方法:
1.没有参数
2.有返回值
3.命名与成员变量同名，但差一个下划线
4.赋值在方法中赋值

1)  作用：返回对象内部的成员变量
2)  命名规范：get方法的名称一般就跟成员变量同名
4.  成员变量的命名规范
  # 成员变量都以下划线 _ 开头
  # 可以跟get方法的名称区分开
  # 可以跟其他局部变量区分开，一看到下划线开头的变量，肯定是成员变量
*/

/*
  成员变量的命名规范：一定要以下划线 _ 开头
  作用：
  1.让成员变量和get方法的名称区分开
  2.可以跟局部变量区分开，一看到下划线开头的变量，一般都是成员变量
*/


/*********************** 类方法 **************************/

// 类方法：

/*
 对象方法
 1> 减号 - 开头
 2> 只能由对象来调用
 3> 对象方法中能访问当前对象的成员变量（实例变量）
 
 类方法
 1> 加号 + 开头
 2> 只能由类（名）来调用
 3> 类方法中不能访问成员变量（_age; _weight; 实例变量）
 
 
 类方法的好处和使用场合
 1> 不依赖于对象，执行效率高
 2> 能用类方法，尽量用类方法
 3> 场合：当方法内部不需要使用到成员变量时，就可以改为类方法
 
 可以允许类方法和对象方法同名
 */



// 工具类：基本没有任何成员变量，里面的方法基本都是类方法


/******************** self, super ***********************/

// self, super:

// self对象：

/*
成员变量和局部变量同名:
1.当成员变量和局部变量同名时，采取就近原则，访问的是局部变量
2.用self访问成员变量，区分同名的局部变量
*/

/*
 self的用途：
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法利用"self->成员变量名"访问当前对象内部的成员变量
 
 3> self->_xx   当前对象方法中调用self
 4> [self 方法名]可以调用其他对象方法\类方法
 */


// super对象:

/*
 super的作用
 1.直接调用父类中的某个方法

 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 */


/******************** 继承，多态，组合 ***********************/

// 继承，多态，组合：


// 继承：

// 1.每一个对象里面有一个isa指针，它指向类本身；
// 2.而每个类中有一个superclass指针，它指向它的父类；

/*
-   父类\超类 superclass
-   子类 subclass\subclasses


 oc是单继承，c++,python是多继承


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

*/


// 组合：

// 组合：（一个类拥有另外一个类，但两个类的属性不一致，比如学生没法继承分数，只能拥有）


/*
1.继承的使用场合：
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



// 类：其实可以理解为一个类型，跟int, double, char 等类型相似
// 枚举：其实枚举也可以理解为一个类型，只是这个类型只能取它定义的几个值而已


/*
enum Season {spring, summer, autumn, winter};

enum Season {spring, summer, autumn, winter} s;

enum {spring, summer, autumn, winter} s;


宏定义枚举类型的第一种方式：
enum Season {spring, summer, autumn, winter};
typedef enum Season Season; // 给枚举类型起别名

定义枚举类型的第二种方式：
typedef enum Season {spring, summer, autumn, winter} Season

定义的第三种方式：
typedef enum {spring, summer, autumn, winter} Season;

typedef enum {  // 枚举类型,常用第三种方式
    SexMan,
    SexWoman
} Sex;
*/



/*
 多态：

 1.没有继承就没有多态

 2.代码的体现：父类类型的指针指向子类对象

 3.好处：如果函数\方法参数中使用的是父类类型，可以传入父类、子类对象
 
 4.局限性：
    1> 父类类型的变量 不能 直接调用子类特有的方法。必须强转为子类类型变量后，才能直接调用子类特有的方法

 5.细节：
   动态绑定：在运行时根据对象的类型确定动态调用的方法
 */


// 只有利用类名调用类方法的时候，不需要在类后面写*
// 其他情况下，类名后面统一加上*


/********************* NSString *****************************/

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //char *_name;
    NSString *_name;
}
@end

int main()
{
    /*
    // 最简单的创建字符串的方式
    NSString *str = @"itcast";
    
    char *name = "itcast";
    
    
    NSLog(@"我在%@上课", str);
    //NSLog(@"%s", name);
    */
    
    int age = 15;
    int no = 5;
    NSString *name = @"哈哈jack";
    // length方法算的是字数
    int size = [name length];
    
    NSLog(@"%d", size);
    
    // 创建OC字符串的另一种方式
    NSString *newStr = [NSString stringWithFormat:@"My age is %d and no is %d and name is %@", age, no, name];
    
    
    NSLog(@"---- %ld", [newStr length]);
    
    return 0;
}

// Note: 以后在OC中用NSString 类代替字符char类型


/********************** oc多文件工作 ****************************/

/*
 总结
 1.只有利用类名调用类方法的时候，不需要在类名后面写*。其他情况下，类名后面统一加上一个*
 Circle *c1 = [Circle new];
 - (BOOL)isInteractWithOther:(Circle *)other;
 
 2.返回值是BOOL类型的方法，方法名一般都以is开头
 - (BOOL)isInteractWithOther:(Circle *)other;
 
 3.想要拥有某个对象，就先创建对象，然后调用set方法将对象传递给内部的成员变量
 // 创建圆心对象
 Point2D *p2 = [Point2D new];
 [p2 setX:12 andY:19];
 // 设置圆心
 [c2 setPoint:p2];
 
 - (void)setPoint:(Point2D *)point
 {
    _point = point;
 }
 
 
 4.定义一个类分2个文件：.h声明文件、.m实现文件
 .h : 成员变量、方法的声明
 .m : 方法的实现
 
 5.如果想使用某一个类，只需要#import类的.h文件即可
 */

/********************** Xcode Project ****************************/

/*

xcode文档的安装：

1.直接放到Xcode中
/Applications/Xcode.app/Contents/Developer/Documentation/DocSets

2.放到硬盘的某个路径
/Users/用户名/Library/Developer/Shared/Documentation/DocSets


xcode的方法：
1. 新建类
2. 断点调试
3. 代码块的保存和调用 
4. 标记和注释，// #pragma mark - 今天就写到这儿....  (这是xcode特有的，- 是用来分组的)
5. 多文件查看（不同的视图）

*/



一、点语法：（为其他语言程序员快速上手） 转为set和get方法， 是方法调用

p.age=10       // [p setAge:10]  相当于set方法
int a = p.age  // [p age]        相当于get方法
/*

访问成员变量用： self->_age;

// set方法实现中：--不能这么写
self.age = age;

// get方法实现中：--不能这么写
return self.age;

只能写成 return self->_age;


*/


xcode自动生成的都是private类型；比如  @property NSString *name;  private类型在子类中不能进行直接赋值。
/*
@public：   可以对外在任何地方访问；
@private:   只能在当前类的对象方法中直接访问；如果要访问，用set或者get方法
@protected: 能在当前类和子类的对象方法中访问，不能在main函数中访问； 什么在声明中都不写的时候，访问的就是这种模式
@package：  同一个“体系内”（框架）就能直接访问对象的成员变量，介于@private和@public之间

写在main函数后面的成员变量不管什么类型，都不能直接访问；
声明里面不写关键词，默认是protected;
实现里面不写关键词，默认是private;

xcode自动生成的都是private类型；比如  @property NSString *name;  

implementation中不能定义和声明interface中一样的成员变量



二、 @property：可以自动生成某个成员变量的setter和getter声明 ,写在@interface中；(声明)


note: 最新版本的property可以自动生成成员变量和对应的声明和实现；缺点是这个变量是private私有类型，只能当前对象访问；


@property int age; 
相当于下面两句：
- (void)setAge:(int)age;
- (int)age;


NSString *_name;

@property NSString *name;  
相当于下面两句：
- (void)setName:(NSString *)Name;
- (NSString *)Name;


三、 @synthesize自动生成age的setter和getter实现，并且会访问_age这个成员变量,如果成员变量不存在，就会自动生成对应的@private类型的成员变量（实现）

@synthesizes是写在implamentation中；

正确的是：@synthesize age = _age;  // 访问的是_age这个成员变量名；

@synthesize age  //这句话只能默认访问age这个成员变量，不是访问的_age这个成员变量；


@synthesize age = _age; 
相当于下面的内容：
- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

@property和@synthesize可以一行实现多个变量的声明或实现：

//@property double weight, NSString *name;  //同类型转换,不同类型不能放在一句当中，这行报错
@property int age, height;
@synthesize weight = _weight, name = _name;

细节：
1.如手动实现了setter方法，编译器只会生成getter方法和成员变量；
2.如手动实现了getter方法，编译器只会生成setter方法和成员变量；
3.如同时实现了setter和getter方法，编译器就不会生成任何方法和成员变量；

*/


/************************ id *****************************/

// 1. id是万能指针，可以指向任何OC对象；
// 2. id已经包括了*, 所以在书写的时候，id后面不需要加*，  id = NSObject *
// 3. id类型的变量不能用点语法；

// id类型的官方定义:
typedef struct objc_object {
    Class isa;
} *id;


Person *p = [Person new];

id  d = [Person new]; //这一句等同于上一句。。。比如这儿如果调用d的方法就不能用点语法，id后面也没有*号；


/********************************* 构造方法 *****************************/

// ----------------------------------------1.重写init:

Person *p =[Person new];

// 1.调用+alloc分配存储空间
Person *p1 = [Person alloc];
// 2.调用-init进行初始化
Person *p2 = [p1 init];


//上面两步简写成下面的内容：
Person *p3 = [[Person alloc] init];

init方法就是构造方法；

// 重写init方法：在类的实现中写：

@implementation Person
- (id)init
{
    if(self = [super init])  //如果对象初始化成功，则进行赋值。。
    {  // 初始化成功
        _age = 10;
    }
    return self;
}
@end

// 创建对象的时候可以用下面两种方法，效果是一样的；

Person *p3 = [[Person alloc] init];  // -----这儿为新建对象, 以后推荐都用这种方式
Person *p3 = [Person new]


/*
 完整地创建一个可用的对象
 1.分配存储空间  +alloc
 2.初始化 -init
*/

/*
重写构造方法的目的：为了让对象创建出来，成员变量就有一些固定的值；
注意点：
1.先调用父类的构造方法（[super init]）
2.再进行子类内部成员变量的初始化
*/


// -----------------------------------------2.自定义init构造方法：
/*
 自定义构造方法的规范
 1.一定是对象方法，一定以 - 开头
 2.返回值一般是id类型
 3.方法名一般以initWith开头
 4.父类的属性交给父类去处理，子类的属性交给子类处理；
*/

@interface Person:NSObject
- (id)initWithName:(NSString *)name;
@end


@implementation Person
- (id)initWithName:(NSString *)name
{
    if ( self = [super init] )
    {
        _name = name;
    }    
    return self;
}
@end

Person *p3 = [[Person alloc] initWithName:@"Rose"];  // ------这儿为调用  


// 如果要传两个参数：  （比python麻烦多了）
- (id)initWithName:(NSString *)name andAge:(int)age;

- (id)initWithName:(NSString *)name andAge:(int)age
{
    if ( self = [super init] )
    {
        _name = name;
        _age = age;
    }
    return self;
}

Person *p3 = [[Person alloc] initWithName:@"Jack" andAge: 20];  // ---调用





// 父类的属性交给父类方法去处理，子类方法处理子类自己的属性
- (id)initWithName:(NSString *)name andAge:(int)age andNo:(int)no
{
    // 将name、age传递到父类方法中进行初始化
    if ( self = [super initWithName:name andAge:age])
    {
        _no = no;
    }
    
    return self;
}

Student *p = [[Student alloc] initWithName:@"Jim" andAge:29 andNo:10]; // ---调用

/*
自定义模板路径：
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates

* File Templates 文件模板：可以修改类文件等
* Project Templates  项目模板：可以修改一些项目描述

*/



/********************* Category 分类 *****************************/

/*
 分类的作用：在不改变原来类内容的基础上，可以为类增加一些方法
 
 使用注意：
 1.分类只能增加方法，不能增加成员变量
 2.分类方法实现中可以访问原来类中声明的成员变量  (分类中的成员变量的权限是否与原来类中的成员变量保持一致？)
 3.分类可以重新实现原来类中的方法，但是会覆盖掉原来的方法，会导致原来的方法没法再使用，如果在分类中重写方法，就不用再次声明了；但我们一般不在分类中重写；
 4.分类中通方法名调用的优先级：分类(最后参与编译的分类优先) --> 原来类  --> 父类， 优先去分类中查找，然后再去原来类中找，最后再去父类中找
 5.分类命名一般以功能来命名；
 6.开发的过程中一般会给系统自带的类去增加分类来扩充它的方法；

 7.Category可以访问原始类的实例变量，但不能添加变量，只能添加方法。如果想添加变量，可以考虑通过继承创建子类 
 8.Category可以实现原始类的方法，但不推荐这么做，因为它是直接替换掉原来的方法，这么做的后果是再也不能访问原来的方法
 9.多个Category中如果实现了相同的方法，只有最后一个参与编译的才会有效
 */

// 类库：很多类的集合，网上有很多开源的类库，可以拷贝过来，导入头文件，直接引用；


+ (int)numberCountOfString:(NSString *)str
{
    // 1.定义变量计算数字的个数
   int count = 0;
   
   for (int i = 0; i<str.length; i++)
   {
       unichar c = [str characterAtIndex:i];  // 从哪一个index开始计算；
       
       if ( c>='0' && c<='9')
       {
           count++;
       }
   }
   return count;
    
}


/********************* 类的本质 *****************************/

// 类其实也是一个对象；
// 类本身也是一个对象，是个Class类型的对象，简称类对象

typedef struct objc_class *Class;

/*
    利用 Class 创建  Person类对象
    利用 Person类对象 创建 Person类型的对象


    // a.获取内存中的类对象的第一种方法，通过类的对象来获取：
    Class c1 = [p1 class];   // Class后边不放指针的*
    
    Class c2 = [p2 class];
    
    
    // b.获取内存中的类对象的第二种方法，通过类的对象来获取：
    Class c3 = [Person class];

    
    NSLog(@"c1=%p, c2=%p, c3=%p", c1, c2, c3); //获取Class类指针的地址,注意后面没有加 & 地址符号，这几个地址是相等的，表明只有一个类对象；



1.类对象 就是 类，两个等价；
    Person *p = [[Person alloc] init];
    [Person test];   // 类的 +test方法

 上面调用类对象的test方法跟下面调用类的test方法是等价的
    Class c = [p class];
    [c test];    // 类的 +test方法



2.创建对象也可以用Class类来创建：
    Class c = [Person class]
    Person *p2 = [[c alloc] init];
*/




// 程序调用的两个方法：---------------------load  initialize

+ (void)load
+ (void)initialize
/*
 1.当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法。只会调用一次。load方法只有在类被加载的时候才调用。

 2.当第一次使用某个类时，就会调用当前类的+initialize方法
 
 3.先加载父类，再加载子类（先调用父类的+load方法，再调用子类的+load方法），再依次调用继承的子类的分类load方法，最后再调用第一个父类的分类中的+load方法；
   先初始化父类，再初始化子类（先调用父类的+initialize方法，再调用子类的+initialize方法）

 4.对于类和分类，加载的时候，都进行了+(void)load,（先进行了父类的load,再进行了分类的load）; 初始化的时候，只进行了分类的 +(void)initialize方法


-  +load  主类（父类->子类）+分类(子类->父类)；
-   在程序启动的时候会加载所有的类和分类，并调用所有类和分类的+load方法
-   先加载父类，再加载子类；也就是先调用父类的+load，再调用子类的+load
-   先加载元原始类，再加载分类
-   不管程序运行过程有没有用到这个类，都会调用+load加载

-   +initialize  分类方法优先:(父类->子类);
-   在第一次使用某个类时（比如创建对象等），就会调用一次+initialize方法
-   一个类只会调用一次+initialize方法，先调用父类的，再调用子类的

*/


/*
比如有几个对象：人，学生，好学生，属于继承关系，人,学生，好学生有一个分类为MJ一类；
都写了各自的load和initialize方法；

则：
1.当程序加载，只有一开始main函数的时候，就执行了每一个类的 + (void)load方法；顺序为：主类（父类->子类）+分类(子类->父类)；
2.当main函数执行 [GoodStudent alloc] 时候,就在先执行了上述的load方法之后，再执行了各自的： 分类方法优先:(父类->子类);

*/



/*************************** description *****************************/


// 打印一个对象的所有属性，用%@符号进行占位，  NSString也是一个对象；

 NSLog(@"%@", p);  // 默认情况下，利用NSLog和%@输出对象时，结果是：<类名：内存地址>
// 上面的这句的执行步骤如下：
// 1.会调用对象p的-description方法
// 2.拿到-description方法的返回值（NSString *）显示到屏幕上
// 3.-description方法默认返回的是“类名+内存地址”   <Person: 0x7f9259e06a50>

// 改变NSLog的输出，就是重写-description方法：


// - description决定了实例对象的输出结果:
- (NSString *)description
{
    // 下面代码会引发死循环------不要在description中使用self NSLog
    // NSLog(@"%@", self);
    return [NSString stringWithFormat:@"age=%d, name=%@", _age, _name];  //如果这儿在子类中，获取不到的时候，就用当前对象的get方法;
    //return @"3424324";
}



//上面是 - 的description，下面的是 + 的description
Class c = [Person class];

NSLog(@"%@", c);        //  实际操作中,如果没定义+description方法，那么Person类对象的NSLog输出为Person；Person的对象NSLog输出为一个内存地址；
// 1.会调用类的+description方法
// 2.拿到+description方法的返回值（NSString *）显示到屏幕上

// + description 决定了类对象的输出结果:
+ (NSString *)description
{
    return @"Abc";
}


// 如下程序description的举例：
#import <Foundation/Foundation.h>
@interface Person : NSObject
@property int age;
@end

@implementation Person
+ (NSString *)description
{
    return @"A";
}
- (NSString *)description
{
    return @"B";
}
@end

int main()
{
    Person *p = [Person new];  // 对象
    Person *p2 = [[Person class] new]; // 对象
    NSLog(@"%@", p);
    NSLog(@"%@", p2);
    NSLog(@"%@", [Person class]);   // 类本身
    NSLog(@"%@", [p class]);  // 类本身
    return 0;
}

/*
结果为： B B A A
*/




// 地址输出，用%p；

Person *p = [[Person alloc] init];
// 指针变量的地址
NSLog(@"%p", &p);
// 对象的地址,  跟下面这个是一致的。
NSLog(@"%p", p);
// <类名：对象地址>
NSLog(@"%@", p);




// 日志增强：

// 输出当前函数名
NSLog(@"%s\n", __func__);

// 输出行号
NSLog(@"%d", __LINE__);

// NSLog输出C语言字符串的时候，不能有中文
// NSLog(@"%s", __FILE__);

// 输出源文件的名称
printf("%s\n", __FILE__);




/*************************** SEL *****************************/

//:以后还会学习直接用方法的地址去执行程序，这样会提高执行效率；

typedef struct objc_selector   *SEL;
/*
 SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去找对应的方法地址。找到方法地址就可以调用方法
 其实消息就是SEL, 发消息就是发SEL;

 一个方法对应一个SEL,不管是类方法还是对象方法；
*/

// 无参数：
[p test2];
// 1.把test2包装成SEL类型的数据
// 2.根据SEL数据找到对应的方法地址
// 3.根据方法地址调用对应的方法


//1. 直接调用selector：先转换再调用）
NSString *name = @"test2";

SEL s = NSSelectorFromString(name);  //把一个test2的方法名转换为sel类型，然后调用performSelector方法；

[p performSelector:s];


//2. 间接调用test2方法
[p performSelector:@selector(test2)];  // 这儿就是通过sel去寻找对应的方法，其中selector就是sel



// 有参数的调用方法：
[p test3:@"123"];
// 如果有参数，则调用下面的方法：
[p performSelector:@selector(test3:) withObject:@"456"]; // 注意test3后面有个冒号（因为这儿有参数要传）。其中  SEL s = @selector(test3:);




// 每一个方法中都存在一个_cmd方法，它是SEL类型，也代表着它当前的方法的selector;
- (void)test2
{
    // _cmd代表着当前方法 
    NSString *str = NSStringFromSelector(_cmd);   // 把SEL转换为字符串；
    
    // 会引发死循环
    // [self performSelector:_cmd];
    
    NSLog(@"调用了test2方法-----%@", str);
}


// 将SEL对象转为NSString对象
NSString *str = NSStringFromSelector(@selector(test));



// selector运用：
在Objective-C里，selector主要用来做两类事情：

1.绑定控件触发的动作
@implementation DemoViewController
- (void)downButtonPressed:(id)sender {//响应“按钮被按下事件”的方法
    UIButton *button = (UIButton*)sender;
    [button setSelected:YES];
}

- (void)drawAnButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom]; 
    btn.frame = _frame; 
    btn.tag = 1;
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget: self
         action: @selector(downButtonPressed:)
         forControlEvents: UIControlEventTouchUpInside];//当这个按钮被按下时，触发downButtonPressed:方法
}
@end

2.延时异步执行
@implementation ETHotDealViewController
- (void)viewDidLoad {
    
    //获取数据源
    HotDealDataSource *ds = [[HotDealDataSource alloc]init];
    [ds reload];
    _items = ds.items;
    
    [self performSelector: @selector(refreshTable)
          withObject: self
          afterDelay: 0.5];//延迟0.5秒调用refreshTable方法
}

-(void)refreshTable
{
    [self.tableView reloadData];
}
@end
这个例子中，获取数据源是通过ASIHTTP组件异步调用服务端HTTP接口，refreshTable要用到数据源返回回来的数据，
如果不延迟0.5秒，就会立刻执行，执行的时候数据还在路上呢，页面就要变空白了。


/******************************* 内存管理 *****************************/

// ARC: Automatic Reference Counting

// 默认情况下，Xcode是不会管僵尸对象的，使用一块被释放的内存也不会报错。为了方便调试，应该开启僵尸对象监控：
// 开启僵尸对象检测：点击运行按钮旁边的终端按钮，选择edit Scheme,然后选择Diagnostict，选择Memory Management，勾选僵尸对象；



1.栈 ：局部变量，全局变量   // 系统自动回收，由操作系统分配和释放，先进后出
2.堆 ：对象，             // 动态分配，手动回收,由程序员手动分配和释放，先进先出


//  管理范围：任何继承了NSObject的对象，对其他基本数据类型（int、char、float、double、struct、enum等）无效


/*

// 引用计数器的基本结构：
1.每个OC对象都有自己的引用计数器，是一个整数，表示“对象被引用的次数”，即有多少人正在使用这个OC对象
2.每个OC对象内部专门有4个字节的存储空间来存储引用计数器


// 引用计数器的作用：
3.当使用alloc、new或者copy创建一个新对象时，新对象的引用计数器默认就是1
4.当一个对象的引用计数器值为0时，对象占用的内存就会被系统回收。
5.如果对象的计数器不为0，那么在整个程序运行过程，它占用的内存就不可能被回收，除非整个程序已经退出


// ---------------------------------retain, release；

// 引用计数器操作：
6.给对象发送一条retain消息,可以使引用计数器值+1（retain方法返回对象本身）
7.给对象发送一条release消息,可以使引用计数器值-1
8.可以给对象发送retainCount消息获得当前的引用计数器值
9.调用一次retain 方法，及应该调用一次release，调用一次alloc就应该调用一次release;如果多调用了release方法，程序会报错；
  release完之后，需要把指针赋值为空指针；


*/
  // 指针p变成空指针
  [p release];
   p = nil;  // release完之后，对象变成了一个僵尸对象，这个时候的指针还有指向，需要把指针赋值为空指针；


// 获取计数器的值
 Person *p = [[Person alloc] init];
 NSUInteger c = [p retainCount];  // 这儿或者 int c = (int) [p retainCount];  强制转换
 NSLog(@"计数器：%ld", c);  // 输出为ld类型，长整型？


 [p retain];  // retain方法返回的是对象本身




// ---------------------------------dealloc；

/*
// 对象销毁：
10.当一个对象被销毁时，系统会自动向对象发送一条dealloc消息
11.一般会重写dealloc方法，在这里释放相关资源，dealloc就像对象的遗言
12.一旦重写了dealloc方法，就必须调用[super dealloc]，并且放在最后面调用
13.不要直接调用dealloc方法
14.一旦对象被回收了，它占用的内存就不再可用，坚持使用会导致程序崩溃（野指针错误）
*/

- (void)dealloc
{
    NSLog(@"Person对象被回收");

    // super的dealloc一定要调用，而且放在最后面
    [super dealloc];
}


// 野指针：指向僵尸对象（不可用内存）的指针
// EXC_BAD_ACCESS : 野指针错误， 访问了一块坏的内存（已经被回收、已经不可用的内存
// OC不存在空指针错误，给空指针发送消息，不报错




/*
 1.方法的基本使用
 1> retain ：计数器+1，会返回对象本身
 2> release ：计数器-1，没有返回值
 3> retainCount ：获取当前的计数器
 4> dealloc
  * 当一个对象要被回收的时候，就会调用
  * 一定要调用[super dealloc]，这句调用要放在最后面
 
 2.概念
 1> 僵尸对象 ：所占用内存已经被回收的对象，僵尸对象不能再使用
 2> 野指针 ：指向僵尸对象（不可用内存）的指针，给野指针发送消息会报错（EXC_BAD_ACCESS）
 3> 空指针 ：没有指向任何东西的指针（存储的东西是nil、NULL、0），给空指针发送消息不会报错
 
 */

// 谁创建，谁release;
// 谁retain,谁release;

/*
 1.你想使用（占用）某个对象，就应该让对象的计数器+1（让对象做一次retain操作）
 2.你不想再使用（占用）某个对象，就应该让对象的计数器-1（让对象做一次release）
 
 3.谁retain，谁release
 4.谁alloc，谁release
 */




// ------------------------------多个对象之间的内存管理；
// 组合关系：书和人

@implementation Person
- (void)setBook:(Book *)book
{
    _book = [book retain];   //占有一次书，对他的引用计数器进行+1；

}

- (Book *)book
{
    return _book;
}

- (void)dealloc
{
    [_book release];        // 释放的时候，对占用的书对象进行释放；
    NSLog(@"Person对象被回收");  
    [super dealloc];
}
@end




// ---------------------------set方法的内存管理：

/*
 内存管理代码规范：
 1.只要调用了alloc，必须有release（autorelease）
   对象不是通过alloc产生的，就不需要release
 
 2.set方法的代码规范
 1> 基本数据类型：直接复制
 - (void)setAge:(int)age
 { 
    _age = age;
 }
 
 2> OC对象类型
 - (void)setCar:(Car *)car
 {
    // 1.先判断是不是新传进来对象
    if ( car != _car )
    {
        // 2.对旧对象做一次release
        [_car release];
 
        // 3.对新对象做一次retain
        _car = [car retain];
    }
 }
 
 3.dealloc方法的代码规范
 1> 一定要[super dealloc]，而且放到最后面
 2> 对self（当前）所拥有的其他对象做一次release
 - (void)dealloc
 {
    [_car release];
    [super dealloc];
 }
 */

@implementation Person
- (void)setCar:(Car *)car
{
    if (car != _car) // 传进来的对象不是当前对象的时候 ，先判断是不是新传进来对象
    {
        // 对当前正在使用的车（旧车）做一次release
        [_car release];
        
        // 对新车做一次retain操作
        _car = [car retain];
    }
}
- (Car *)car
{
    return _car;
}

- (void)setAge:(int)age
{ // 基本数据类型不需要管理内存
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)dealloc
{
    // 当人不在了，代表不用车了
    // 对车做一次release操作
    [_car release];
    
    NSLog(@"%d岁的Person对象被回收了", _age);
    
    [super dealloc];
}

@end


/******************************* @property参数 *****************************/

// ---------------------------------简写retain:


@interface Person : NSObject
@property int age;
@property (retain) Book *book;  // 这里的retain : 自动生成的set方法里面，release旧值，retain新值
@property (retain) NSString *name;
@end


@implementation Person
- (void)dealloc         // 但在实现中dealloc还是需要手动来写；
{
    [_book release];
    [_name release];
    [super dealloc];
}
@end



// --------------------------------property参数：

/*
 1.set方法内存管理相关的参数
 * retain : release旧值，retain新值（适用于OC对象类型）
 * assign : 直接赋值（默认，适用于非OC对象类型：int, double, 枚举enum类型, 结构体struct类型...）
 * copy   : release旧值，copy新值（一般用于NSString *）
 
 2.是否要生成set方法
 * readwrite : 同时生成setter和getter的声明、实现(默认)
 * readonly  : 只会生成getter的声明、实现
 
 3.多线程管理
 * nonatomic : 性能高 (一般就用这个)
 * atomic    : 性能低（默认）
 
 4.setter和getter方法的名称
 * setter : 决定了set方法的名称，一定要有个冒号 : （因为要穿传参数，所以需要个冒号）
 * getter : 决定了get方法的名称(一般用在BOOL类型)
 */


// 上面4个类型的参数，只能从每个类型中选一个参数，或者某个类型不写，就传默认值；


@interface Person : NSObject

// 返回BOOL类型的方法名一般以is开头
@property (getter = isRich) BOOL rich;   // 一般重命名getter用在返回bool类型的声明里 

@property (getter = abc, setter = setAbc:) int height;   // setAbc后面需要冒号
 
@property (nonatomic, assign, readwrite) int weight;   // 以后在写的时候都需要些高性能的nonatomic参数,不是OC对象，包括常见的整型，枚举类型都应该写assign类型；

@property (retain) NSString *name;
@end



// 从1970-01-01 00:00:00 开始，一共度过了多少毫秒
@property (nonatomic, assign) long time;
@property (nonatomic) time_t time;   // 这两句的意义一致，对于时间的类型，time_t;



/******************************* @class循环引用 *****************************/

两个类的循环引用：

// 以后用 "@class 类名;" 来引用另外一个类。
/*
 循环retain：
 1. 比如A对象retain了B对象，B对象retain了A对象
 2. 这样会导致A对象和B对象永远无法释放


 1.@class的作用：仅仅告诉编译器，某个名称是一个类
 @class Person; // 仅仅告诉编译器，Person是一个类
 
 2.开发中引用一个类的规范
 1> 在.h文件中用@class来声明类， 这样可以提高性能，为了防止更改某一个头文件的名字后，在每一个文件中去修改名字也是为了提高性能；
    （当然在.m文件中，只有使用的时候还是要导入对应头文件）
 2> 在.m文件中用#import来包含类的所有东西
 
 3.两端循环引用解决方案
 1> 一端class用retain
 2> 一端class用assign
 
 // person和card的关系：
 @property (nonatomic, retain) Card *card;
 @property (nonatomic, assign) Person *person;
 */


// 相互引用导致谁也释放不了谁；如果只有一方占有，则可以直接释放
int main()
{
    // 后面的数字为引用计数；
    // p - 1
    Person *p = [[Person alloc] init];
    // c - 1
    Card *c = [[Card alloc] init];
    
    // c - 2
    p.card = c;   // 人拥有了身份证
    
    // p - 1
    c.person = p;  // 身份证拥有了人
    
    // c - 1
    [c release];
    
    // p - 0  c - 0
    [p release];
    return 0;
}


/******************************* autorelease *****************************/


// 在dealloc中就不用手动去释放对象了，重写dealloc,还是需要在结尾写[super dealloc]; 
- (void)dealloc
{
    NSLog(@"%d岁的人被销毁了", _age);
    
    [super dealloc];   
}
@end


// autorelease ：半自动释放，延时了release时间，适用于小内存占用的管理,不能精确控制释放的时间，如果占用内存大的对象，一般手动release;

/*
 1.autorelease的基本用法
 1> 会将对象放到一个自动释放池中
 2> 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
 3> 会返回对象本身
 4> 调用完autorelease方法后，对象的计数器不变
 
 @autoreleasepool
 {
    // 1
    Person *p = [[[Person alloc] init] autorelease];
 }
 
 2.autorelease的好处
 1> 不用再关心对象释放的时间
 2> 不用再关心什么时候调用release
 

 3.autorelease的使用注意
 1> 占用内存较大的对象不要随便使用autorelease
 2> 占用内存较小的对象使用autorelease，没有太大影响
 
 
 4.错误写法
 1> alloc之后调用了autorelease，又调用release
 @autoreleasepool
 {
    // 1
    Person *p = [[[Person alloc] init] autorelease];
 
    // 0
    [p release];
 }
 
 2> 连续调用多次autorelease
 @autoreleasepool
 {
    Person *p = [[[[Person alloc] init] autorelease] autorelease];
 }
 
 5.自动释放池
 1> 在iOS程序运行过程中，会自动创建无数个池子。这些池子都是以栈结构存在（先进后出）
 2> 当一个对象调用autorelease方法时，会将这个对象放到栈顶的释放池
 
 
 */

// 6. 自动释放池的创建：

// a>  ios 5.0后:
@autoreleasepool
{
    Person *p = [[[Person alloc] init] autorelease];
    // ....
}


// b>   ios 5.0前:
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
// .....
[pool release]; // 或[pool drain];




// -------------------------------------------自动创建autorelease对象：

/*
 1.系统自带的方法里面没有包含alloc、new、copy，说明返回的对象都是autorelease的
 
 2.开发中经常会提供一些类方法，快速创建一个已经autorelease过的对象，这个对象就不需要我们手动再去release一次了；
   自带的类对象就是如此，比如 [NSDate date];


 1> 创建对象时不要直接用类名，一般用self，这样子类调用父类的方法的时候就创建的子类，就不需要重写父类的方法了；
 + (id)person
 {
    return [[[self alloc] init] autorelease];
 }

 */


@interface Person : NSObject         // 声明
@property (nonatomic, assign) int age;  

+ (id)person;      // 创建一个自动release的person, 用id类型

+ (id)personWithAge:(int)age;  // 创建一个自动release的有年龄的person, 用id类型
@end


@implementation Person         // 实现

+ (id)person
{
    // return [[[Person alloc] init] autorelease];
    return [[[self alloc] init] autorelease];  // 一般用self,不用类名,以便子类调用创建的是子类对象
}

+ (id)personWithAge:(int)age
{
    /*
    Person *p = [[[Person alloc] init] autorelease];
    p.age = age;
    return p
    */
    Person *p = [self person];  // 一般用self,不用类名
    p.age = age;
    return p;
}
@end

int main(int argc, char const *argv[])  // 主函数
{
    /*
    // 以前的创建方法：
    Person *p = [[Person alloc]init];
    p.age = 200;
    [p release];
    */

    @autoreleasepool
    {
        // 方式一：
        Person *p1 = [[[Person alloc] init] autorelease];  
        p1.age = 100;

        // 方式二：
        Person *p2 = [Person person]; // 嫌弃上面的创建代码太长，可以自定义一个person类来创建；
        p2.age = 100;

        Person *p3 = [Person personWithAge:100]; // 创建一个有初始化变量的autorelease对象；；

    // 类方法的命名应该以类名称person开头，这也跟其他语言中的包有类似之处:
    // 包方法      包名
    // Student    com.mj.test
    // Student    com.mj.test2
    
        NSString *str = @"123123";     // 系统自带类，没有alloc,就不用release，因为创建的是一个autorelease对象
        
        NSString *str2 = [NSString stringWithFormat:@"age is %d", 10];


        NSNumber *num = [[NSNumber alloc] initWithInt:10];
        [num release]; //有alloc就应该有release
        
        NSNumber *num2 = [NSNumber numberWithInt:100];
    }
    return 0;
}
 

/******************************* ARC *****************************/
 
// ARC: Automatic Reference Counting

/*
跟非ARC模式区别：
1. 不用手动创建autorelease对象了
2. 在重写dealloc中不能用[super dealalloc];
*/

/*
 ARC的判断准则：只要没有强指针指向对象，就会释放对象
 
 
 1.ARC特点:
 1> 不允许调用release、retain、retainCount
 
 2> 允许重写dealloc，但是不允许调用[super dealloc]
 
 3> @property的参数
  * strong ：成员变量是强指针（适用于OC对象类型）, 相当于原来的retain;
  * weak ：成员变量是弱指针（适用于OC对象类型）, 相当于原来的assign;
  * assign : 适用于非OC对象类型, 在ARC中还是可以用；
 
 4> 以前的retain改为用strong
 
 指针分2种：
 1> 强指针：默认情况下，所有的指针都是强指针 __strong
 2> 弱指针：__weak
 
 * 默认所有实例变量和局部变量都是Strong指针
 * 弱指针指向的对象被回收后，弱指针会自动变为nil指针，不会引发野指针错误


note:
 * 不能调用release、retain、autorelease、retainCount
 * 可以重写dealloc，但是不能调用[super dealloc]
 * @property : 想长期拥有某个对象，应该用strong，其他对象用weak
 * 其他基本数据类型依然用assign
 * 两端互相引用时，一端用strong、一端用weak

 */


// ARC中不允许用retain,release, retainCount,[super dealloc], 但可以重写 - (void) dealloc;


// 重写dealloc,不能写[super dealloc]; 
- (void)dealloc
{
    NSLog(@"%d岁的人被销毁了", _age);
    
    // [super dealloc];    // ARC中不能写这一句了
}
@end


// 弱指针创建对象后就被销毁，这样的写法没有意义；
__weak Person *p = [[Person alloc] init];  
// 一个对象只要有强指针，就不销毁，只要没有强指针，就被销毁，不会管弱指针；
// 只要还有一个强指针变量指向对象，对象就会保持在内存中


// 如果指向对象的指针赋值为空，那么这个对象也会自动被销毁；
Person *p = [[Person alloc] init];
p = nil;  //指针赋值为空，指向person对象的强指针不存在，则person对象被销毁了；


Person *p1 = [[Person alloc] init];
Person *p2 = p1;  // 这儿是把p1指针中的地址赋值了给p2;





// xcode老版本非ARC模式转换为新的ARC模式：
点击: edit--->convert--->To OC ARC，然后下一步，后续会有预览图，看哪些代码会被删除；

// 查看一个项目是不是ARC模式：
“点击项目文件，选择build setting---->搜索框中输入 auto 或者 arc, 看下方ARC的值是yes，则是ARC模式，如果没有搜索到ARC或者是no,则不是arc模式”

// 如果要让一个项目既兼容ARC, 又要兼容非ARC：
1.则需要  点击项目文件，选择build Phases---->compile Sources--->选择不需要的ARC的文件，按enter,在compiler Flags里面输入  -fno-objc-arc
  然后在对应的.m文件中就能使用release,retain等方法了；


2.如果要在非ARC项目中选择支持arc的文件，则输入： -f-objc-arc




/*--------------------------- ARC中class相互引用------------------------*/


// ARC中class类的相互引用：

// 相互引用导致谁也释放不了谁；如果只有一方占有，则可以直接释放

int main()
{
    Person *p = [[Person alloc] init]; 
    Dog *d = [[Dog alloc] init];
      
    p.dog = d;          //两个对象相互引用，导致对象释放不了
    d.person = p;

    return 0;
}

// 当main函数一执行完，他的局部变量就被销毁，这里的*p, *d都被销毁了；


/*
 当两端循环引用的时候，解决方案：
 1> ARC
 1端用strong，另1端用weak
 
 2> 非ARC
 1端用retain，另1端用assign
 */


// person.h

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

@property (nonatomic, strong) Dog *dog;  // 这儿用strong,

@end


// dog.h
#import <Foundation/Foundation.h>

@class Person;

@interface Dog : NSObject

@property (nonatomic, weak) Person *person;  // 这里用weak.

@end




/*******************************block*****************************/


/*
 block要掌握的东西
 1> 如何定义block变量
 int (^sumBlock)(int, int);
 void (^myBlock)();
 
 2> 如何利用block封装代码
 ^(int a, int b) {
    return a - b;
 };
 
 ^() {
    NSLog(@"----------");
 };
 
 ^ {
    NSLog(@"----------");
 };
 
 3> block访问外面变量
 * block内部可以访问外面的变量
 * 默认情况下，block内部不能修改外面的局部变量
 * 给局部变量加上__block关键字，这个局部变量就可以在block内部修改
 
 4>　利用typedef定义block类型
 typedef int (^MyBlock)(int, int);

 // 以后就可以利用MyBlock这种类型来定义block变量

 MyBlock block;
 MyBlock b1, b2;
 
 b1 = ^(int a, int b) {
    return a - b;
 };
 
 MyBlock b3 = ^(int a, int b) {
    return a - b;
 };

 5> 
 * block常用作传值，实际上就是把block的地址传到要调用block的地方
 * block本质上就是一个函数指针，即代码块的内存地址
 */




-------------------------没有参数,没有返回值的block:
int main()
{  
    // block用来保存一段代码,
    // block跟普通的代码块有区别，普通代码块会执行，block调用的时候才会执行
    // block的标志：^
    /*
     block跟函数很像：
     1.可以保存代码
     2.有返回值
     3.有形参
     4.调用方式一样
     */
    
    // 定义block变量
    /*
    void (^myblock)() = ^(){
        NSLog(@"----------------");
        NSLog(@"----------------");
    };*/
    
    // 如果block没有形参，可以省略后面的()
    void (^myblock)() = ^{
        NSLog(@"----------------");
        NSLog(@"----------------");
    };
    
    // 利用block变量调用block内部的代码
    myblock();
    
    myblock();  // 这里执行了两次

}


// 指针指向函数：
int sum（int a, int b）
{
    return a + b;
}

int (*p) (int, int) = sum;  // 指针指向函数名
p(10, 6) // 指针调用





-------------------------有参数，有返回值的block调用：
int main()
{
    int (^sumblock)(int, int) = ^(int a, int b){
        return a + b;
    };
    
    int c = sumblock(10, 11);
}


int main()
{
    void (^lineBlock)(int) =  ^(int n)
    {
        for (int i = 0; i<n; i++) {
            NSLog(@"----------------");
        }
    };

    lineBlock(5);
}


-------------------------block与局部变量的的关系：
int main()
{
    int a = 10;
    __block int b = 20; // 给b前面加上__block关键字，b就可以在block内部修改
    
    void (^block)();   // 函数可以分开写，就如先定义函数名，再定义函数内部；
    
    block = ^{
        // block内部可以访问外面的变量
        //NSLog(@"a = %d", a);
        
        // 默认情况下，block内部不能修改外面的局部变量
        // a = 20;
        
        // 给局部变量加上__block关键字，这个局部变量就可以在block内部修改
        b = 25;
    };
      
    block();
}


/*
// 函数可以分开声明和定义，也可以写在一起
int (^sumBlock)(int, int);

sumBlock = ^(int a, int b) {
    return a + b;
};


int (^minusBlock)(int, int) = ^(int a, int b) {
    return a - b;
};
*/


----------------------------block与typedef：
/*
 函数指针的typedef
 typedef int (*SumP)(int, int);

 int (*p)(int, int) = sum;
 int (*p2)(int, int) = sum;

 SumP p = sum;
 SumP p2 = sum;
*/ 


// block的typedef:
typedef int (^MyBlock)(int, int);

int main()
{
    MyBlock sumBlock;
    sumBlock = ^(int a, int b) {
        return a + b;
    };
    
    MyBlock minusBlock = ^(int a, int b) {
        return a - b;
    };
    
    MyBlock multiplyBlock = ^(int a, int b) {
        return a * b;
    };
    
    NSLog(@"%d - %d - %d", multiplyBlock(2, 4),  sumBlock(10 , 9), minusBlock(10, 8)); // typedef的调用；直接在函数名后加参数即可；
     
    return 0;
}


/*******************************protocol*****************************/


/*
 1.协议的定义
 @protocol 协议名称 <NSObject>
  // 方法声明列表....
 @end
 
 基协议：NSObject, NSObject协议中声明很多最基本的方法，比如description、retain、release等

 2.如何遵守协议
 1> 类遵守协议
 @interface 类名 : 父类名 <协议名称1, 协议名称2>
 
 @end
 
 2> 协议遵守协议
 @protocol 协议名称 <其他协议名称1, 其他协议名称2>
 
 @end
 
 3.协议中方法声明的关键字
 1> @required (默认)
   要求实现，如果没有实现，会发出警告
 
 2> @optional
   不要求实现，不会有警告
 

 4.定义一个变量的时候，限制这个变量保存的对象遵守某个协议
 类名<协议名称> *变量名;
 id<协议名称> 变量名;
 NSObject<MyProtocol> *obj;
 id<MyProtocol> obj2;
 
 如果没有遵守对应的协议，编译器会警告
 
 5.@property中声明的属性也可用做一个遵守协议的限制
 @property (nonatomic, strong) 类名<协议名称> *属性名;
 @property (nonatomic, strong) id<协议名称> 属性名;

 // 举例：
 @property (nonatomic, strong) Dog<MyProtocol> *dog;
 @property (nonatomic, strong) id<MyProtocol> dog2;
 
 6.协议可用定义在单独.h文件中，也可用定义在某个类中
 1> 如果这个协议只用在某个类中，应该把协议定义在该类中
 2> 如果这个协议用在很多类中，就应该定义在单独文件中
 
 7.分类可用定义在单独.h和.m文件中，也可用定义在原来类中
 1> 一般情况下，都是定义在单独文件
 2> 定义在原来类中的分类，只要求能看懂语法
 

 @interface Person (MJ)    // ()是分类，:是继承，<>是协议；
 // ----分类的方法
 @end

 @implementation Person (MJ)
 // ----分类的方法的实现
 @end
 */



//  要求创建的对象遵守某一个协议：
Person<MyProtocol> *obj = [[Person alloc] init];

// NSObject类型的对象，并且要遵守NSCopying协议
NSObject<NSCopying> *obj;

// 任何OC对象，并且要遵守NSCoding协议
id<NSCoding> obj2;



// ----------------------------------------1.协议文件定义：

#import <Foundation/Foundation.h>
@protocol MyProtocol <NSObject>  // 定义了一个名叫MyProtocol的协议

- (void)test4;

@required
- (void)test;
- (void)test2;

@optional
- (void)test3;

@end



// ----------------------------------------2.协议文件遵从另外一个协议：

// 一个协议遵守了另外一个协议，就可以拥有另一个协议的所有方法声明
#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@protocol MyProtocol3 <MyProtocol>
  // 方法声明列表....
@end


// 跟@class类一样，还有一种声明协议的方法，不需要导入协议的.h文件
// 直接先用 @protocol 协议名; 来声明，当在类的实现中用到的时候，再在头文件中导入协议的.h文件

@protocol MyProtocol2, MyProtocol3;




// ----------------------------------------3.类中的某个类型变量遵守某个协议：

 @property (nonatomic, strong) 类名<协议名称> *属性名;
 @property (nonatomic, strong) id<协议名称> 属性名;

 // 举例：
 @property (nonatomic, strong) Dog<MyProtocol> *dog;
 @property (nonatomic, strong) id<MyProtocol> dog2;




// ----------------------------------------4.某个类遵守某个协议：
#import "TicketDelegate.h"
@interface Agent : NSObject <TicketDelegate>


/*******************************protocol代理*****************************/

// 协议常用于代理， 一个类满足代理需要遵从代理的协议：



/******************************* runtime *******************************/
http://blog.csdn.net/a19860903/article/details/44853841

RunTime简称运行时。就是系统在运行的时候的一些机制，其中最主要的是消息机制。
runtime是属于OC的底层，是一套比较底层的纯C语言API, 属于1个C语言库;


1.首先我们来看看obj这个对象，iOS中的obj都继承于NSObject。

@interface NSObject <nsobject> {
    Class isa  OBJC_ISA_AVAILABILITY;
}</nsobject>

2.在NSObjcet中存在一个Class的isa指针。然后我们看看Class：

typedef struct objc_class *Class;

struct objc_class {

  Class isa; // 指向metaclass

  Class super_class ; // 指向其父类

  const char *name ; // 类名

  long version ; // 类的版本信息，初始化默认为0，可以通过runtime函数class_setVersion和class_getVersion进行修改、读取

  long info; // 一些标识信息,如CLS_CLASS (0x1L) 表示该类为普通 class ，其中包含对象方法和成员变量;CLS_META (0x2L) 表示该类为 metaclass，其中包含类方法;

  long instance_size ; // 该类的实例变量大小(包括从父类继承下来的实例变量);

  struct objc_ivar_list *ivars; // 用于存储每个成员变量的地址

  struct objc_method_list **methodLists ; // 与 info 的一些标志位有关,如CLS_CLASS (0x1L),则存储对象方法，如CLS_META (0x2L)，则存储类方法;

  struct objc_cache *cache; // 指向最近使用的方法的指针，用于提升效率；

  struct objc_protocol_list *protocols; // 存储该类遵守的协议

}


Class isa：指向metaclass，也就是静态的Class。
一般一个Obj对象中的isa会指向普通的Class，这个Class中存储普通成员变量和对 象方法（“-”开头的方法），
普通Class中的isa指针指向静态Class，静态Class中存储static类型成员变量和类方法（“+”开头的方 法）。

Class super_class:指向父类，如果这个类是根类，则为NULL。

过程：
1.封装为selector消息发送
2.通过isa指针找到class,
3.在obj_cache中去找方法
4.在obj_method_list中去找方法

应用场景：
1.运行中：动态创建一个类,（比如KVO的底层实现）
2.运行中：动态为某个类添加方法和属性
3.遍历类的所有方法和属性
（比如字典–>模型：利用runtime遍历模型对象的所有属性, 根据属性名从字典中取出对应的值, 设置到模型的属性上；还有归档和接档，利用runtime遍历模型对象的所有属性）

/******************************* RunLoop *******************************/

RunLoop就是一个事件处理的循环，用来不停的调用工作以及处理事件。
使用runloop的目的就是节省cpu效率，线程在有工作的时候忙于工作，在没工作的时候处于休眠状态；

其实就是处理各种事件的循环。
核心价值：不停的接受数据。

runloop线程处理的东西包括：
handlePort
customeScr
mySelector
timerFired

/******************************* 深拷贝和浅拷贝 *******************************/

浅拷贝：
1.指向的内存地址是一样的，又称指针拷贝
2.数据不独立，对一个对象操作会引起另外一个对象内容的改变
3.释放对象的时候，会造成野指针错误，所以释放对象的时候，适合深拷贝；
4.只复制对象的基本类型，对象类型仍属于原来的引用

深拷贝：
在堆中另外开辟了一个空间来存储对象的内容


// 对象的快速拷贝：

// personn.h
@interface
@property (nonatomic, copy) NSString *name; // 定义person的name属性
@end

// person.m
@implementation
-（id）copyWithZone:(NSZone*)zone{
    Person *copy = [[[self class]allocWithZone:zone]init];
    copy.name= [self.name copyWithZone:zone];
    return copy;
}
@end

// main.m:
Person *p1 = [[Person alloc]init];
p1.name = @"Robin";
Person *p2 = [p1 copy];
NSLog(@"%@, %@", p1, p2); // 输出之后发现他们的内存地址不一样，且他们都有一个相同的name属性，Robin




// 字符串的可变与不可变：
不可变到可变：copy:只修改内容，mutableCopy:修改地址
NSString *str1 = @"hello";
NSMutableString *str2 = [str1 copy];
NSMutableString *str3 = [str1 mutableCopy];
NSLog(@"%@ %@ %@", str1, str2, str3);
NSLog(@"%p %p %p", str1, str2, str3);
    
不可变到不可变：copy:只修改内容，mutableCopy:修改地址
NSString *str1 = @"hello";
NSString *str2 = [str1 copy];
NSString *str3 = [str1 mutableCopy];
NSLog(@"%@ %@ %@", str1, str2, str3);
NSLog(@"%p %p %p", str1, str2, str3);

可变到不可变：copy:修改地址，mutableCopy:修改地址
// NSMutableString *str1 = @"hello"; // 换成这个，copy:只修改内容
NSMutableString *str1 = [[NSMutableString alloc]initWithString:@"hello"];
NSString *str2 = [str1 copy];
NSString *str3 = [str1 mutableCopy];
NSLog(@"%@ %@ %@", str1, str2, str3);
NSLog(@"%p %p %p", str1, str2, str3);

可变到可变：copy:修改地址，mutableCopy:修改地址
// NSMutableString *str1 = @"hello"; // 换成这个，copy:只修改内容
NSMutableString *str1 = [[NSMutableString alloc]initWithString:@"hello"];
NSMutableString *str2 = [str1 copy];
NSMutableString *str3 = [str1 mutableCopy];
NSLog(@"%@ %@ %@", str1, str2, str3);
NSLog(@"%p %p %p", str1, str2, str3);




// 数组的可变与不可变：

不可变到可变：copy:只修改内容，mutableCopy:修改地址,内容
NSArray *arr1 = @[@"a",@"b"];
NSMutableArray *arr2 = [arr1 copy];
NSMutableArray *arr3 = [arr1 mutableCopy];
NSLog(@"%@ %@ %@", arr1, arr2, arr3);
NSLog(@"%p %p %p", arr1, arr2, arr3);

不可变到不可变：copy:只修改内容，mutableCopy:修改地址，内容
NSArray *arr1 = @[@"a",@"b"];
NSArray *arr2 = [arr1 copy];
NSArray *arr3 = [arr1 mutableCopy];
NSLog(@"%@ %@ %@", arr1, arr2, arr3);
NSLog(@"%p %p %p", arr1, arr2, arr3);

可变到不可变：copy:修改地址，内容，mutableCopy:修改地址，内容
//NSMutableArray *arr1 = @[@"a",@"b"]; // copy:只修改内容，mutableCopy:修改地址，内容
NSMutableArray *arr1 = [[NSMutableArray alloc]initWithObjects:@"a",@"b", nil];
NSArray *arr2 = [arr1 copy];
NSArray *arr3 = [arr1 mutableCopy];
NSLog(@"%@ %@ %@", arr1, arr2, arr3);
NSLog(@"%p %p %p", arr1, arr2, arr3);

可变到可变：copy:修改地址，内容，mutableCopy:修改地址，内容
// NSMutableArray *arr1 = @[@"a",@"b"]; // copy:只修改内容，mutableCopy:修改地址，内容
NSMutableArray *arr1 = [[NSMutableArray alloc]initWithObjects:@"a",@"b", nil];
NSMutableArray *arr2 = [arr1 copy];
NSMutableArray *arr3 = [arr1 mutableCopy];
NSLog(@"%@ %@ %@", arr1, arr2, arr3);
NSLog(@"%p %p %p", arr1, arr2, arr3);


/******************************* 谓词的基本使用 *******************************/

// 相当于python中的filter函数：（过滤数组）

1.==:过滤字符串
NSArray *arr1 = @[@"ios", @"android", @"wp"];
// 创建谓词
NSPredicate *pre1 = [NSPredicate predicateWithFormat:@"self == 'ios'"]; // 这儿是过滤条件
// 谓词作用数组：
NSArray *arr2 = [arr1 filteredArrayUsingPredicate: pre1];
NSLog(@"%@", arr2);


2.intValue:过滤数值大小
NSArray *arr1 = @[@"-3", @"15", @"32", @"-33"];
NSPredicate *pre1 = [NSPredicate predicateWithFormat:@"-10 < self.intValue && self.intValue< 3 "];
NSArray *arr2 = [arr1 filteredArrayUsingPredicate: pre1];
NSLog(@"%@", arr2);


3.contains:包含某个字段
NSArray *arr1 = @[@"adb", @"install", @"c360", @"allof"];
NSPredicate *pre1 = [NSPredicate predicateWithFormat:@"self contains %@", @"all"];
NSArray *arr2 = [arr1 filteredArrayUsingPredicate: pre1];
NSLog(@"%@", arr2);


4.过滤某个对象，用属性
Person *p1 = [[Person alloc]init];
p1.age = 10;
Person *p2 = [[Person alloc]init];
p2.age = 20;
NSArray *PersonArray1 = @[p1, p2];
NSLog(@"%@",PersonArray1);
NSPredicate *pre = [NSPredicate predicateWithFormat:@"self.age == 10"]; // self.age可以写成age
NSArray *PersonArray2 = [PersonArray1 filteredArrayUsingPredicate:pre];
NSLog(@"%@", PersonArray2);

/*******************************类之间的通信*******************************/
类之间通信的三大方式：
BLock, 通知，委托代理
KVO, KVC, Timer

BLock：为了避免交叉引用，造成对象无法释放

/*******************************广播*******************************/


================================Foundation====================================

/******************************* OC 结构体*******************************/
/*
结构体：
 NSRange(location length)
 NSPoint\CGPoint
 NSSize\CGSize
 NSRect\CGRect (CGPint CGSize)
 */
    


NSRange：

    // @"i love oc"  // love的范围
    
    //NSRange r1 = {2, 4}; // 不用
    //NSRange r2 = {.location = 2, .length = 4};// 不用
    NSRange r3 = NSMakeRange(2, 4); // 掌握， love的位置
    NSString *str = @"i love oc";
    
    
    // 查找某个字符串在str中的范围，返回的是一个结构体
    // 如果找不到，length=0，location=NSNotFound==-1
    NSRange range = [str rangeOfString:@"java"]; // 查找java在str中的位置：
    NSLog(@"loc = %ld, length=%ld", range.location, range.length);


NSPoint\CGPoint：

    CGFloat 就是double类型；
    一般用CGPoint,因为它是跨平台的；一般用CG开头的函数

    // 设置点
    CGPoint p1 = NSMakePoint(10, 10);
    NSPoint p2 = CGPointMake(20, 20);// 最常用，括号中的类型都是float类型


NSSize\CGSize：

    // 设置宽度，长度
    NSSize s1 = CGSizeMake(100, 50);
    NSSize s2 = NSMakeSize(100, 50);
    CGSize s3 = NSMakeSize(200, 60);

    
NSRect\CGRect (CGPint CGSize)：

    // 同时设置点，宽度，长度，是上面两个结构体的嵌套
    CGRect r1 = CGRectMake(0, 0, 100, 50);
    
    CGRect r2 = { {0, 0}, {100, 90}};
    
    CGRect r3 = {p1, s2}; // 用两个结构体赋值；
    
   
// -------------------------------设置原点：
    // 使用CGPointZero等的前提是添加CoreGraphics框架
    CGRect r4 = {CGPointZero, CGSizeMake(100, 90)};
    
    // CGPointZero 原点常量
    // CGSizeZero  矩形常量
    // CGRectZero  原点矩形常量
    
    // 表示原点
    CGPointZero == CGPointMake(0, 0)
    


//-------------------------------结构体转为字符串：
// 打印一个结构体，一般我们先用NSString转换为一个字符串来查看：

    // 不用这种方式，太冗长；
    // NSLog(@"x=%f, y=%f, width=%f, height=%f", r1.origin.x, r1.origin.y, r1.size.width, r1.size.height);
    

    // 将结构体转为字符串：
    NSString *str = NSStringFromPoint(p1); // 点
    
    NSString *str = NSStringFromSize(s3);  // 矩形
    
    NSString *str = NSStringFromRect(r1);  // 点，矩形
    
    NSLog(@"%@", str);
    



//-------------------------------常用函数：
    
    // 使用这些CGPointEqualToPoint、CGRectContainsPoint等函数的前提是添加CoreGraphics框架
    // CG开头方法的一般依赖于CoreGraphics框架
    // NS开头的方法依赖于NSObject框架

    // NextStep  Foundation 
    
    
    // 比较两个点是否相同（x、y）
    BOOL b = CGPointEqualToPoint(CGPointMake(10, 10), CGPointMake(10, 10));
    CGRectEqualToRect(<#CGRect rect1#>, <#CGRect rect2#>)  // 两个矩形是否相等
    CGSizeEqualToSize(<#CGSize size1#>, <#CGSize size2#>)  // 两个尺寸是否相等
    
    
    // 判断一个矩形返回是否包含一个点？
    // x (50, 150) y (40 , 90)
    BOOL b2 = CGRectContainsPoint(CGRectMake(50, 40, 100, 50), CGPointMake(60, 45)); 
    
    NSLog(@"%d", b2);





/******************************* OC NSString*******************************/ 

//  -----------------------------------字符串的创建的几种方式：
1.字符串的初始化：
    NSString *s1 = @"jack";
    
    //NSString *s2 = [[NSString alloc] initWithString:@"jack"];  // 与上面等价，一般写上面那个
    
    NSString *s3 = [[NSString alloc] initWithFormat:@"age is %d", 10];
    
    // C字符串 --> OC字符串
    NSString *s4 = [[NSString alloc] initWithUTF8String:"jack"];
    // OC字符串 --> C字符串
    const char *cs = [s4 UTF8String];

2.基础数据类型转为字符串：
NSString *str1 = [NSString stringWithFormat:@"%d",1];
NSString *str2 = [NSString stringWithFormat:@"%f",3.1415]; 

3.字符串转为基础数据类型：
int a = str1.intValue;
float b = str2.floatValue;

4.字符串的比较：
 if([str1 isEqualToString: str2]){ // 这是比较字符串的内容
    NSLog(@"%@字符串相等");
 }
 str1 == str2 // 字符串的内存地址和内容

 5.字符串的大小写转换：
 NSString *str1 = @"abCDefg";
 NSString *str2 = [str1 lowercaseString]; // 全是小写
 NSString *str3 = [str1 uppercaseString]; // 全是大写
 NSString *str4 = [str1 capitalizedString]; //首字母大写
 NSLog(@"%@",[NSString stringWithFormat:@"%@\n%@\n%@", str2, str3, str4]);
 6.字符串和数组的关系：
 
 7.字符串的内容索引：
 NSString *str1 = @"abcdefg";
 NSString *str2 = @"cde";
 NSRange range;
 range = [str1 rangeOfString:str2];
 NSLog(@"%lu %lu",range.length, range.location);

 8.字符串的位置索引：
 NSString *str1 = @"abcdefg";
 NSRange range = {range.length = 2, range.length = 3};
 NSString *str2 = [str1 substringWithRange:range];
 NSLog(@"%@", str2);
 
 9.字符串的增删改查：(关于查就是7和8)
 NSString *str1 = @"abc";
 NSString *str2 = [str1 stringByAppendingString:@"efg"]; // 增加字符串
 NSString *str3 = [str1 stringByAppendingFormat:@"%d", 12345]; // 增加格式化字符串
 NSLog(@"str1 = %@, str2 = %@, str3 = %@", str1, str2, str3);
 // 这儿并没有改变str1的值，而是返回了一个增加的值
 NSString *str4 = [str3 stringByReplacingOccurrencesOfString:@"c123" withString:@"aa"];// 改
 NSString *str5 = [str3 stringByReplacingOccurrencesOfString:@"c123" withString:@""]; // 删
 NSLog(@"str4 = %@, str5 = %@", str4, str5);
 
 10.可变字符串：
 NSMutableString *str6 = [[NSMutableString alloc] init];
 [str6 appendString:@"123"];  // 增加没有返回值，是增加本身
 [str6 appendFormat:@"%f", 3.1415]; // 增加格式化的字符
 [str6 insertString:@"haha" atIndex:1]; // 插入字符
 NSLog(@"%@", str6);
 
 11.字符串的内容检查：
 NSString *str7 = @"http://www.baidu.com";
 if ([str7 containsString:@"baidu"]){
     NSLog(@"包含baidu");
 }
 if ([str7 hasPrefix:@"http"]){
     NSLog(@"头包含http");
 }
 if ([str7 hasSuffix:@"com"]){
     NSLog(@"结尾包含com");
 }
 
 12.常用技巧：
 a.字符串去首尾空格：
 NSString *str8 = @" abc defg ";
 NSString *str9 = [str8 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
 NSLog(@"%@\n%@", str8, str9);
 b.字符串的长度
 NSLog(@"%lu - %lu", str8.length, str9.length);

/*
 NSString : 不可变字符串 （添加，删除）
 
 NSMutableString : 可变字符串，它是上面的NSString的子类
*/

 NSMutableString *s1 = [NSMutableString stringWithFormat:@"my age is 10"]; // NSMutableString,可变类型，没有返回值，直接改变原来的值
// 拼接内容到s1的后面
[s1 appendString:@" 11 12"];     // 增


// 获取is的范围
NSRange range = [s1 rangeOfString:@"is"];
[s1 deleteCharactersInRange:range]; // 删除is  删

// 对比NSString和NSMutableString新增方法的区别：
NSString *s2 = [NSString stringWithFormat:@"age is 10"]; // NSString,不可变类型
NSString *s3 = [s2 stringByAppendingString:@" 11 12"];  // 有返回值，这个是新建一个字符串   // 增





//  -----------------------------------读取文件：

 // NSUTF8StringEncoding 用到中文就可以用这种编码 （把一个文件或者网页内容转为字符串）
 NSString *s5 = [[NSString alloc] initWithContentsOfFile:@"/Users/apple/Desktop/1.txt" encoding:NSUTF8StringEncoding error:nil];
 
 // URL : 资源路径
 // 协议头://路径
 // file:// 本地文件
 // ftp:// ftp服务器
 // http://weibo.com/a.png  http服务器
 
 // （把一个文件或者网页内容转为字符串）
 NSURL *url = [[NSURL alloc] initWithString:@"file:///Users/apple/Desktop/1.txt"];
 NSURL *url = [NSURL fileURLWithPath:@"/Users/apple/Desktop/1.txt"]; // 或者这样写，fileUrl是表示文件资源的一个方法
 
 NSString *s6 = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
 NSLog(@"s6=\n%@", s6); // 换行再输出
    
/*
 上面都是对象方法，都有对应的类方法：

 一般都会有一个类方法跟对象方法配对：
 [NSURL URLWithString:<#(NSString *)#>];
 [NSString stringWithFormat:@""];
 [NSString stringWithContentsOfFile:<#(NSString *)#> encoding:<#(NSStringEncoding)#> error:<#(NSError *__autoreleasing *)#>];
 
 */



//  -----------------------------------文件写入：
// 字符串的导出
[@"Jack\nJack" writeToFile:@"/Users/apple/Desktop/my.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];  
// 这其中Yes，代表：如果文件写入有错误，则停止创建文件； NO表示，会继续创建，即使错误；


NSString *str = @"4234234";
NSURL *url = [NSURL fileURLWithPath:@"/Users/apple/Desktop/my2.txt"];
[str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];



练习简单的爬baidu教程：
-------------------------------------
// 请求baidu
NSURL *url = [NSURL URLWithString:@"http://news.baidu.com/?tn=news"];
NSString *str = [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
// 写入文件
[str writeToFile:@"/Users/captain/desktop/baidu.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
NSURL *path = [NSURL fileURLWithPath:@"/Users/captain/desktop/baidu.txt"];
// 读取文件
NSLog(@"%@",[[NSString alloc]initWithContentsOfURL:path encoding:NSUTF8StringEncoding error:nil]);




/******************************* OC NSArray*******************************/ 

集合类：
NSArray
NSMutableArray  // 可变

NSSet
NSMutableSet  // 可变

NSDictionary
NSMutableDictionary  // 可变

NSDate


// c语言的数组只能放一种类型的对象
// oc的数组是面向对象数组，不能存放非oc对象类型，比如int, stuct, enum ; 里面对象的属性可以不一样；


1.数组的初始化：
NSArray *arr1 = [[NSArray alloc]initWithObjects:@"bilibili",@"balala",@"fftt", nil];
NSArray *arr2 = @[@"bobo", @"keke", @"hehhe"];
NSLog(@"%@", arr2);

2.增删改查：

查：位置索引：
NSString *item1 = [arr2 firstObject];
NSString *item2 = [arr2 lastObject];
NSString *item3 = [arr2 objectAtIndex:1];
NSLog(@"%@ %@ %@", item1, item2, item3);

查：内容索引
NSInteger index = [arr2 indexOfObject:@"hehhe"];
NSLog(@"index=%ld", index);

查：长度
NSLog(@"count= %lu",arr2.count);
NSLog(@"%d %d", [arr2 containsObject:@"heheh"], [arr2 containsObject:@"keke"]);

增：
NSMutableArray *array1 = [[NSMutableArray alloc]init];
NSMutableArray *array2 = [[NSMutableArray alloc]initWithObjects:@"girl", @"boy", @"man", @"woman", nil];

[array2 addObject:@"baby"];
[array2 insertObject:@"youth" atIndex:2];
NSLog(@"%@", array2);

删除，改：
[array2 removeLastObject];
[array2 removeObject:@"youth"];
[array2 removeObjectAtIndex:1];
[array2 removeAllObjects];
NSLog(@"%@", array2);

3.字符串的遍历：（见下面的遍历）

4.字符串与数组互转：NSString <--> NSArray(字符串分割)
 NSString *string1 = @"1@2@3@4@5";
 NSArray *array1 = [string1 componentsSeparatedByString:@"@"];
 NSLog(@"%@", array1);
 
 NSMutableString *string2 = [[NSMutableString alloc]init];
 for (NSString *item in array1){
     [string2 appendFormat:@"%@@", item];
 }
 NSLog(@"%@", string2);

5.可变数组与不可变数组的互转：
 NSArray *array1 = @[@"123",@"456"];
 NSMutableArray *array2 = [[NSMutableArray alloc]initWithArray:array1];
 // 可变数组转不可变，直接赋值
 NSArray *array3 = array2;


1.NSArray的创建-------------------------------------

/*
 int a = 5;
 int ages[10] = {1, 90, 89, 17};
 */

a.最老的方法
 Person *p = [[Person alloc] init];
 Person *persons[5] = {p,  [[Person alloc] init]};

 NSArray *arr1 = [[NSArray alloc]initWithObjects:@"hahha",@"bbb", nil];
// OC数组不能存放nil值
// OC数组只能存放OC对象、不能存放非OC对象类型，比如int、struct、enum等


b.比较常用的方法：
// 这个array永远是空数组
NSArray *array = [NSArray array];
NSArray *array2 = [NSArray arrayWithObject:@"jack"];

// nil是数组元素结束的标记
NSArray *array3 = [NSArray arrayWithObjects:@"jack", @"rose", nil]; // 创建两个及以上的数组必须写nil
NSArray *array4 = [NSArray arrayWithObjects:@"jack", @"rose", @"4324324", nil];


c.快速创建一个NSArray对象
NSArray *array4 = @[@"jack", @"rose", @"4324324"];



2.NSArray的元素个数-------------------------------------

// [array2 count]; 这个是set语法,可以
NSLog(@"%ld", array3.count); // 点语法也可以



3.NSArray中元素的访问-------------------------------------

NSLog(@"%@", [array3 objectAtIndex:1]); // 访问的第二个元素

//array3[1]; // 或者像数组一样访问也可以
NSLog(@"%@", array3[0]);



4.NSArray中数组的遍历-------------------------------------

Person *p = [[Person alloc] init];
NSArray *array = @[p, @"rose", @"jack"];


a. 最普通的遍历一：
for (int i = 0; i<array.count; i++)
{
    NSLog(@"%@", array[i]);
}


b. for .. in遍历二：
// id obj代表着数组中的每一个元素
int i = 0;
for (id obj in array)
{
    // 找出obj元素在数组中的位置
    NSUInteger i = [array indexOfObject:obj]; // i的类型为NSUInteger,数组索引为ndexOfObject:obj，这个是数组对象的方法

    NSLog(@"%ld - %@", i, obj);
    //i++;

    if (i==0)  // 遍历1次就退出循环
    {
        break;  // 停止遍历
    }
}


c.利用自带的函数进行block遍历三：
// 每遍历到一个元素，就会调用一次block
// 并且当前元素和索引位置当做参数传给block

[array enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop)  // 这个block接受三个参数
{
     NSLog(@"%ld - %@", idx, obj);
     
     if (idx == 0)  
     {
         // 停止遍历
         *stop = YES;  // 停止遍历，相当于c中的break, break只用于switch和for中，不能用于oc数组
     }
     
 }];




/******************************* OC NSMutableArray*******************************/ 
NSArray ：不可变数组
NSMutableArray : 可变数组

// @[] 只创建不可变数组NSArray
/*错误写法：
NSMutableArray *array = @[@"jack", @"rose"];
[array addObject:@"jim"];
*/


5.可变数组的基本使用------------------------------------增删改查
NSMutableArray *array = [NSMutableArray arrayWithObjects:@"rose", @"jim", nil];

// 添加元素
[array addObject:[[Person alloc] init]];

[array addObject:@"jack"];

// 删除元素
[array removeAllObjects];

// 删除指定的对象
[array removeObject:@"jack"];
[array removeObjectAtIndex:0];

// 错误写法,不能添加空值
// [array addObject:nil];

// 打印数组
NSLog(@"%@", array);
NSLog(@"%@",@[@"jack", @"rose"]);
NSLog(@"%ld", array.count);





// 练习运用：

计算文件的代码行数：------文件的读写：
--------------------------------------------------------

// 计算文件的代码行数
/*
 path : 文件的全路径(可能是文件夹、也可能是文件)
 返回值 int ：代码行数
*/
NSUInteger codeLineCount(NSString *path)
{
    // 1.获得文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 2.标记是否为文件夹
    BOOL dir = NO; // 标记是否为文件夹
    // 标记这个路径是否存在
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    // 3.如果不存在，直接返回0
    if(!exist)
    {
        NSLog(@"文件路径不存在!!!!!!");
        return 0;
    }
    
    // 代码能来到着，说明路径存在
    if (dir)
    { // 文件夹
        // 获得当前文件夹path下面的所有内容（文件夹、文件）
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        
        // 定义一个变量保存path中所有文件的总行数
        int count = 0;
        
        // 遍历数组中的所有子文件（夹）名
        for (NSString *filename in array)
        {
            // 获得子文件（夹）的全路径
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, filename];
            
            // 累加每个子路径的总行数
            count += codeLineCount(fullPath);
        }
        
        return count;
    }
    else
    { // 文件
        // 判断文件的拓展名(忽略大小写)
        NSString *extension = [[path pathExtension] lowercaseString];
        if (![extension isEqualToString:@"h"]
            && ![extension isEqualToString:@"m"]
            && ![extension isEqualToString:@"c"])
        {
            // 文件拓展名不是h，而且也不是m，而且也不是c
            return 0;
        }
        
        // 加载文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        // 将文件内容切割为每一行
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        // 删掉文件路径前面的/Users/apple/Desktop/iOS课堂共享/0722课堂共享/
        NSRange range = [path rangeOfString:@"/Users/apple/Desktop/iOS课堂共享/0722课堂共享/"];
        NSString *str = [path stringByReplacingCharactersInRange:range withString:@""];
        
        // 打印文件路径和行数
        NSLog(@"%@ - %ld", str, array.count);
        
        return array.count;
    }
}



// 字符分割：

NSString *str = @"jack\nrose\njim\njake";
[str writeToFile:@"/Users/apple/Desktop/abc.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
NSArray *array = [str componentsSeparatedByString:@"\n"];
for (NSString *line in array)
{
    NSLog(@"%@", line);
}



/******************************* OC Set*******************************/ 

NSSet
NSMutableSet  // 可变

// set: 无序的集合：
/*
 NSSet和NSArray的对比
 1> 共同点
 * 都是集合，都能存放多个OC对象
 * 只能存放OC对象，不能存放非OC对象类型（基本数据类型：int、char、float等，结构体，枚举）
 * 本身都不可变，都有一个可变的子类
 
 2> 不同点
 * NSArray有顺序，NSSet没有顺序
 */

// set的基本使用
1.初始化
NSSet *s = [NSSet set]; // 空的集合
NSSet *s2 = [NSSet setWithObjects:@"jack",@"rose", @"jack2",@"jack3",nil];

2.取元素，只能随机取一个
NSString *str =  [s2 anyObject];// 随机拿出一个元素
NSLog(@"%@", str);

3.集合的长度
NSLog(@"%ld", s2.count);



//可变set:
1.初始化
NSMutableSet *s = [NSMutableSet set];

2.添加元素
[s addObject:@"hack"];

3.删除元素
[s removeObject:<#(id)#>];


/******************************* OC Dictionary*******************************/ 

NSDictionary
NSMutableDictionary  // 可变

/*
 集合
 1.NSArray\NSMutableArray
 * 有序
 * 快速创建（不可变）：@[obj1, obj2, obj3]
 * 快速访问元素：数组名[i]
 
 2.NSSet\NSMutableSet
 * 无序
 
 3.NSDictionary\NSMutableDictionary
 * 无序
 * 快速创建（不可变）：@{key1 : value1,  key2 : value2}
 * 快速访问元素：字典名[key]
 */

1.定义：
NSDictionary *dic1 = [NSDictionary alloc]init];
// 先输入value，再输入key // value - key
NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"2.5",@"apple",@"北京", @"address",nil]; 

// 定义一：
NSDictionary *dict = [NSDictionary dictionaryWithObject:@"jack" forKey:@"name"];

// 定义二：
NSArray *keys = @[@"name", @"address"];
NSArray *objects = @[@"jack", @"北京"];

NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

// 定义三：
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
@"jack", @"name",
@"北京", @"address",
@"32423434", @"qq", nil]; // value - key

// 定义四：快速定义，一般用这种// key - value
NSDictionary *dict = @{@"name" : @"jack", @"address" : @"北京"}; 

2.查值：
NSDictionary *dict = @{@"name" : @"jack", @"address" : @"北京"};
NSString *str1 = [dict valueForKey:@"name"]; // 方法一
NSString *str2 = [dict objectForKey:@"name"]; // 方法二
NSString *str3= dict[@"name"];// 方法三
NSLog(@"%@-%@-%@",str1, str2, str3);

id obj = [dict objectForKey:@"name"]; // 方法二,用id
id obj = dict[@"name"]; // 方法三，用id

// 返回的是键值对的个数
NSLog(@"%ld", dict.count);

// 查询所有的key和value
NSArray *keys = [dict allKeys];
NSArray *values = [dict allValues];
NSLog(@"%@-%@",keys, values);

3.遍历：

// 字典遍历
NSDictionary *dict = @{
@"address" : @"北京",
@"name" : @"jack",
@"name2" : @"jack",
@"name3" : @"jack",
@"qq" : @"7657567765"};


// 遍历方法一：
NSArray *keys = [dict allKeys]; // 拿出所有的key

for (int i = 0; i<dict.count; i++)
{
    NSString *key = keys[i];
    NSString *object = dict[key];
    NSLog(@"%@ = %@", key, object);
}


// 遍历方法二：
[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) 
{
     NSLog(@"%@ - %@", key, obj);
     
     // *stop = YES;
 }];

----------------------------------------------NSMutableDictionary： 

NSMutableDictionary *dict = [NSMutableDictionary dictionary];
4.增
// 添加键值对
[dict setObject:@"jack" forKey:@"name"];
[dict setObject:@"北京" forKey:@"address"];

5.改
[dict setObject:@"rose" forKey:@"name"]; // 覆盖

6.删
// 移除键值对
[dict removeObjectForKey:<#(id)#>];

// 查
NSString *str = dict[@"name"];

// 打印
NSLog(@"%@", dict);
NSLog(@"%@", @[@"jack", @"rose"]);

// 改
NSMutableDictionary *dict = @{@"name" : @"jack"};
//[dict setObject:@"rose" forKey:@"name"]; 这儿报错，不能把不可变的字典用可变字典的方法：






综合运用：
------------------------------------
// 快速创建字典数组：
NSArray *persons = @[
@{@"name" : @"jack", @"qq" : @"432423423", @"books": @[@"5分钟突破iOS编程", @"5分钟突破android编程"]},
@{@"name" : @"rose", @"qq" : @"767567"},
@{@"name" : @"jim", @"qq" : @"423423"},
@{@"name" : @"jake", @"qq" : @"123123213"}
];


// 取值
NSString *bookName = persons[0][@"books"][1];
NSLog(@"%@", bookName);



/******************************* NSNumber******************************/ 


NSNumber *num = [NSNumber numberWithInt:10]; // 这样把10转换为一个number对象
NSDictionary *dict =  @{
    @"name" : @"jack",
    @"age" : num 
};

// 取出num还是一个number对象
NSNumber *num2 = dict[@"age"];
// 用intvalue可以转弯int类型，对应还有doubleValue, floatValue, ....
int a = [num2 intValue];
NSLog(@"%d" , a);


// 类型转换：
NSNumber *n = [NSNumber numberWithDouble:10.5];
int d = [n doubleValue];

// 字符串转为整型：
int a = 20;
// @"20"
NSString *str = [NSString stringWithFormat:@"%d", a];
NSLog(@"%d", [str intValue]);


// @20  将 20包装成一个NSNumber对象   -----编译器特性，快速包装
NSArray *array = @[
@{@"name" : @"jack", @"age" : @20},

@{@"name" : @"rose", @"age" : @25},

@{@"name" : @"jim", @"age" : @27}
];


// 将各种基本数据类型包装成NSNumber对象
@10.5; // 包装浮点
@YES; // 包装布尔
@'A'; // NSNumber对象，包装字符
@"A"; // NSString对象


// 将age变量包装成NSNumber对象
int age = 100;
[NSNumber numberWithInt:age]; // 包装变量方法一：
@(age); // 小括号为取值----包装变量， 快速包装变量方法二：


/******************************* NSValue******************************/ 

#import <Foundation/Foundation.h>

// NSNumber之所以能包装基本数据类型为对象，是因为继承了NSValue

int main()
{
    
    // 结构体--->OC对象
    
    CGPoint p = CGPointMake(10, 10);
    // 将结构体转为Value对象
    NSValue *value = [NSValue valueWithPoint:p]; //同样可以把矩形包装为对象；
    
    // 将value转为对应的结构体
    [value pointValue];
    
    NSArray *array = @[value ]; // 讲包装后的对象放入到数组中去；
    
    return 0;
}

/******************************* NSDate******************************/ 


// 创建一个时间对象
NSDate *date = [NSDate date]; // 当前时间
// 打印出的时候是0时区的时间（北京-东8区）
NSLog(@"%@", date);


// 时间后面30s
NSDate *date2 = [NSDate dateWithTimeInterval:30 sinceDate:date];
// 当前时间后的20s
NSDate *date3 = [NSDate dateWithTimeIntervalSinceNow:20];

//返回1970-1-1 00:00:00时间10秒后的时间
NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:10];


// 从1970-1-1 00:00:00开始到date2走过的秒数
NSTimeInterval seconds = [date2 timeIntervalSince1970];
// 输出时间差，为float
NSLog(@"%f", seconds);

// date2到现在的时间差
NSTimeInterval interval = [date2 timeIntervalSinceNow];
// 两个时间差：
NSTimeInterval interval = [date2 timeIntervalSinceDate:date3];

// 比较时间，返回比较早的时间
NSDate *newdate = [date2 earlierDate:date3];
// 比较时间，返回比较晚的时间
NSDate *newdate = [date2 laterDate:date3];



// 时间格式转换字符串：
NSDate *date = [NSDate date];

// 日期格式化类：
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
// HH是24进制，hh是12进制
formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss"; //定义自己想要的格式
// formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";

NSString *string = [formatter stringFromDate:date];
NSLog(@"%@", string);  // 2018-01-25 16:52:48



// 字符串转为日期格式：
// 返回的格林治时间
NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
NSDate *date2 = [formatter dateFromString:@"2010/09/09 13:14:56"];
NSLog(@"%@", date2); // Thu Sep 9 13:14:56 2010


// link:NSDate的操作：
http://blog.csdn.net/daiyelang/article/details/18731543


----------finished on date 2018/1/25 22:18
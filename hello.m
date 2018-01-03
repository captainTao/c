/*
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


#import <Foundation/Foundation.h>
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
*/


/*******************BOOL************************/
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

/*******************************************/
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

/*******************************************/

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


/*******************************************/

// 类的定义：

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



/*******************************************/

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


/*******************************************/


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


/*******************************************/

// 对象的封装：-set, get：

//   封装的好处
//     过滤不合理的值
//     屏蔽内部的赋值过程
//     让外界不必关注内部的细节


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

    set方法
1.有参数，参数类型与成员变量保持一致
2.返回值为void
3.命名以set开始，后面成员变量名的首字母必须大写

1)  作用：用来设置成员变量，可以在方法里面过滤掉一些不合理的值
2)  命名规范：
   方法都是以set开头，而且后面跟上成员变量名，成员变量名的首字母必须大写
   形参名称不要跟成员变量同名


    get方法
1.没有参数
2.有返回值
3.命名与成员变量同名，但差一个下划线
4.赋值在方法中赋值

1)  作用：返回对象内部的成员变量
2)  命名规范：get方法的名称一般就跟成员变量同名
4.  成员变量的命名规范
   成员变量都以下划线 _ 开头
   可以跟get方法的名称区分开
   可以跟其他局部变量区分开，一看到下划线开头的变量，肯定是成员变量
*/

/*成员变量的命名规范：一定要以下划线 _ 开头
  作用：
  1.让成员变量和get方法的名称区分开
  2.可以跟局部变量区分开，一看到下划线开头的变量，一般都是成员变量
*/


/*******************************************/

// 类方法：

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


/*******************************************/

// self, super:

// self对象：

/*
 self的用途：
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法利用"self->成员变量名"访问当前对象内部的成员变量
 
 3> self->_xx   当前对象方法中调用self
 4> [self 方法名]可以调用其他对象方法\类方法
 */


/*******************************************/

// 继承，多态，组合：

// super:

/*
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 */



// 继承：

// 1.每一个对象里面有一个isa指针，它指向类本身；
// 2.而每个类中有一个superclass指针，它指向它的父类；

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


// 组合：

// 组合：（一个类拥有另外一个类，但两个类的属性不一致，比如学生没法继承分数，只能拥有）

// 类：其实可以理解为一个类型，跟int, double, char 等类型相似
// 枚举：其实枚举也可以理解为一个类型，只是这个类型只能取它定义的几个值而已

/*
enum Season {spring, summer, autumn, winter};

enum Season {spring, summer, autumn, winter} s;

enum {spring, summer, autumn, winter} s;


宏定义枚举类型的第一种方式：
enum Season {spring, summer, autumn, winter};
typedef enum Season Season;// 给枚举类型起别名

定义枚举类型的第二种方式：
typedef enum Season {spring, summer, autumn, winter} Season

定义的第三种方式：
typedef enum {spring, summer, autumn, winter} Season;

typedef enum {  //枚举类型
    SexMan,
    SexWoman
} Sex;
*/



/*
 多态
 1.没有继承就没有多态
 2.代码的体现：父类类型的指针指向子类对象
 3.好处：如果函数\方法参数中使用的是父类类型，可以传入父类、子类对象
 
 4.局限性：
 1> 父类类型的变量 不能 直接调用子类特有的方法。必须强转为子类类型变量后，才能直接调用子类特有的方法
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



/********************** Xcode Project ****************************/

/*

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

点语法一般用在main函数中,不能写在方法的实现中：

*/




xcode自动生成的都是private类型；比如  @property NSString *name;  private类型在子类中不能进行直接赋值。
/*
@public：   可以对外在任何地方访问；
@private:   只能在当前类的对象方法中直接访问；如果要访问，用set或者get方法
@protected: 能在当前类和子类的对象方法中访问； 什么都不写的时候，访问的就是这种模式
@package：  同一个“体系内”（框架）可以访问，介于@private和@public之间

声明里面不写，默认是protected;
实现里面不写，默认是private;

xcode自动生成的都是private类型；比如  @property NSString *name;  

implementation中不能定义和声明interface中一样的成员变量



   父类\超类 superclass
   子类 subclass\subclasses

oc是单继承，c++,python是多继承


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


相当于下面的内容：
- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

细节：
1.如手动实现了setter方法，编译器只会生成getter方法和成员变量；
2.如手动实现了getter方法，编译器只会生成setter方法和成员变量；
3.如同时实现了setter和getter方法，编译器就不会生成任何方法和成员变量；

*/


/********************* id *****************************/

// 1. id是万能指针，可以指向任何OC对象；
// 2. id已经包括了*, 所以在书写的时候，不需要*， id = NSObject *

// id类型的官方定义:
typedef struct objc_object {
    Class isa;
} *id;


Person *p = [Person new];

id  d = [Person new]; //这一句等同于上一句。。。


/********************* 构造方法 *****************************/

// 1.重写init:-----------------

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
    {
        _age = 10;
    }
    return self;
}
@end

// 创建对象的时候可以用下面两种方法，效果是一样的；

Person *p3 = [[Person alloc] init];  // -----这儿为调用, 以后推荐都用这种
Person *p3 = [Person new]

/*
重写构造方法的目的：为了让对象创建出来，成员变量就有一些固定的值；
注意点：
1.先调用父类的构造方法（[super init]）
2.再进行子类内部成员变量的初始化
*/



// 2.自定义init构造方法：--------------------
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


/*

/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates

* File Templates 文件模板：可以修改类文件等

* Project Templates  项目模板：可以修改一些项目描述

*/



/********************* Category 分类 *****************************/

/*
 分类的作用：在不改变原来类内容的基础上，可以为类增加一些方法
 
 使用注意：
 1.分类只能增加方法，不能增加成员变量
 2.分类方法实现中可以访问原来类中声明的成员变量
 3.分类可以重新实现原来类中的方法，但是会覆盖掉原来的方法，会导致原来的方法没法再使用
 4.分类中通方法名调用的优先级：分类(最后参与编译的分类优先) --> 原来类  --> 父类
 */


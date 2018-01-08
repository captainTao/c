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


/******************对象的封装：-set, get*************************/

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


/********************类方法***********************/

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


/********************self, super***********************/

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


/********************继承，多态，组合***********************/

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

id  d = [Person new]; //这一句等同于上一句。。。比如这儿如果调用d的方法就不能用点语法


/********************* 构造方法 *****************************/

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

Person *p3 = [[Person alloc] init];  // -----这儿为调用, 以后推荐都用这种
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

    a.// 获取内存中的类对象的第一种方法，通过类的对象来获取：
    Class c1 = [p1 class];   // Class后边不放指针的*
    
    Class c2 = [p2 class];
    
    b.// 获取内存中的类对象的第二种方法，通过类的对象来获取：
    Class c3 = [Person class];

    NSLog(@"c1=%p, c2=%p, c3=%p", c1, c2, c3); //获取Class类指针的地址,注意后面没有加 & 地址符号，这几个地址是相等的，表明只有一个类对象；



类对象 就是 类，两个等价；
    Person *p = [[Person alloc] init];
    [Person test];

1. 上面调用类对象的test方法跟下面调用类的test方法是等价的
    Class c = [p class];
    [c test];

2.创建对象也可以用Class类来创建：
    Person *p2 = [[c new] init];
*/




// 程序调用的两个方法：-----------------load  initialize

+ (void)load
+ (void)initialize
/*
 1.当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法。只会调用一次。load方法只有在类被加载的时候才调用。

 2.当第一次使用某个类时，就会调用当前类的+initialize方法
 
 3.先加载父类，再加载子类（先调用父类的+load方法，再调用子类的+load方法），再依次调用继承的子类的分类load方法，最后再调用第一个父类的分类中的+load方法；
   先初始化父类，再初始化子类（先调用父类的+initialize方法，再调用子类的+initialize方法）

 4.对于类和分类，加载的时候，都进行了+(void)load,（先进行了父类的load,再进行了分类的load）; 初始化的时候，只进行了分类的 +(void)initialize方法


-  +load
-   在程序启动的时候会加载所有的类和分类，并调用所有类和分类的+load方法
-   先加载父类，再加载子类；也就是先调用父类的+load，再调用子类的+load
-   先加载元原始类，再加载分类
-   不管程序运行过程有没有用到这个类，都会调用+load加载

-   +initialize
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



/********************* description *****************************/


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


// 看如下程序输出的description：类的descripiton貌似又是对的。。。
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
    Person *p = [Person new];
    Person *p2 = [[Person class] new];
    NSLog(@"%@", p);
    NSLog(@"%@", p2);
    NSLog(@"%@", [Person class]);
    NSLog(@"%@", [p class]);
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


/******************************* 内存管理 *****************************/

// ARC: Automatic Reference Counting

// 默认情况下，Xcode是不会管僵尸对象的，使用一块被释放的内存也不会报错。为了方便调试，应该开启僵尸对象监控：
// 开启僵尸对象检测：点击运行按钮旁边的终端按钮，选择edit Scheme,然后选择Diagnostict，选择Memory Management，勾选僵尸对象；



1.栈 ：局部变量，全局变量   // 系统自动回收
2.堆 ：对象，             // 动态分配，手动回收


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
// EXC_BAD_ACCESS : 访问了一块坏的内存（已经被回收、已经不可用的内存
// 野指针错误
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
 * assign : 直接赋值（默认，适用于非OC对象类型：int, double, 枚举类型, 结构体...）
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



/******************************* class相互引用 *****************************/

两个类的循环引用：

/*
循环retain：
1. 比如A对象retain了B对象，B对象retain了A对象
2. 这样会导致A对象和B对象永远无法释放


 1.@class的作用：仅仅告诉编译器，某个名称是一个类
 @class Person; // 仅仅告诉编译器，Person是一个类
 
 2.开发中引用一个类的规范
 1> 在.h文件中用@class来声明类， 这样可以提高性能，为了防止更改某一个头文件的名字后，在每一个文件中去修改名字（当然在.m文件中，使用的时候还是要导入对应头文件）；也是为了提高性能；
 2> 在.m文件中用#import来包含类的所有东西
 
 3.两端循环引用解决方案
 1> 一端class用retain
 2> 一端class用assign
 
 */


/******************************* autorelease *****************************/

// 自动释放池的创建

// >  ios 5.0后:
@autoreleasepool
{
    // ....
}


// >   ios 5.0前:
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
// .....
[pool release]; // 或[pool drain];


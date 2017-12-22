// 继承：

// 1.每一个对象里面有一个isa指针，它指向类；
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



/***********************************************/

// 对象方法继承：

#import <Foundation/Foundation.h>

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




/***********************************************/

// 对象方法，类方法的继承，以及重写：


#import <Foundation/Foundation.h>
// Person
@interface Person : NSObject
{
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

- (void)run;
+ (void)test;
@end


@implementation Person
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}
- (void)run
{
    NSLog(@"person---跑");
}
+ (void)test
{
    NSLog(@"Person+test");
}
@end

// 不允许子类和父类拥有相同名称的成员变量
// Student
@interface Student : Person
{
    int _no;
    // int _age;
}
+ (void)test2;
@end


@implementation Student
// 重写：子类重新实现父类中的某个方法，覆盖父类以前的做法
- (void)run
{
    NSLog(@"student---跑");
}

+ (void)test2
{
    [self test];
}
@end


int main()
{
    [Student test2];  //Person+test
    
//    Student *s = [Student new];
//    
//    [s run];
    
    return 0;
}




/***********************************************/


// 组合：（一个类拥有另外一个类，但两个类的属性不一致，比如学生没法继承分数，只能拥有）


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
    Score *_score;      // 组合，一个类拥有另外一个类， 就类似于int a 之类的
//    int _cScore;
//    int _ocScore;
    int _age;
}
@end

@implementation Student

@end






/***********************************************/

/*
 多态
 1.没有继承就没有多态
 2.代码的体现：父类类型的指针指向子类对象
 3.好处：如果函数\方法参数中使用的是父类类型，可以传入父类、子类对象
 4.局限性：
 1> 父类类型的变量 不能 直接调用子类特有的方法。必须强转为子类类型变量后，才能直接调用子类特有的方法
 */


#import <Foundation/Foundation.h>


// 动物
@interface Animal : NSObject
- (void)eat;
@end

@implementation Animal
- (void)eat
{
    NSLog(@"Animal-吃东西----");
}
@end

// 狗
@interface Dog : Animal
- (void)run;
@end

@implementation  Dog
- (void)run
{
    NSLog(@"Dog---跑起来");
}
- (void)eat //父类定义了eat,这里就不用声明了
{
    NSLog(@"Dog-吃东西----");
}
@end

// 猫
@interface Cat : Animal

@end

@implementation Cat
- (void)eat
{
    NSLog(@"Cat-吃东西----");
}
@end

// 这个函数是专门用来喂动画
//void feed(Dog *d)
//{
//    [d eat];
//}
//
//void feed2(Cat *c)
//{
//    [c eat];
//}
//
// 上面猫和狗，可以抽离出一个animal：这就是多态的好处
// 如果参数中使用的是父类类型，可以传入父类、子类对象
void feed(Animal *a)
{
    [a eat];
}

int main()
{
    // NSString *d = [Cat new];
    // [d eat];
    
    /*
    Animal *aa = [Dog new];  //oc为弱语法
    // 多态的局限性：父类类型的变量 不能 用来调用子类的方法
    //[aa run];
    
    // 将aa转为Dog *类型的变量
    Dog *dd = (Dog *)aa; //类型的强制转换，如： int a = (int) 3.14;
    
    [dd run];
    */
    
    //Dog *d = [Dog new];
    
    //[d run];
    
    /*
    Animal *aa = [Animal new];
    feed(aa);
    
    Dog *dd = [Dog new];
    feed(dd);
    
    Cat *cc = [Cat new];
    feed(cc);
     */
    
    /*
    // NSString *s = [Cat new];
    Animal *c = [Cat new];
    
    
    NSObject *n = [Dog new];
    NSObject *n2 = [Animal new];
    
    
    // 多种形态
    //Dog *d = [Dog new]; // Dog类型
    
    // 多态：父类指针指向子类对象
    Animal *a = [Dog new];
    
    // 调用方法时会检测对象的真实形象
    [a eat];
    */
    return 0;
}
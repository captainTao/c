/*
C语言一共提供了32个关键字，这些关键字都被C语言赋予了特殊含义:
auto double int struct break else long switch
case enum register typedef char extern return union
const float short unsigned continue for signed void
default goto sizeof volatile do if while static
*/



/*

 a = 10
 b = 11
 交换之后
 a -> 11
 b -> 10
 
 1.利用第三方变量(工作，掌握)
 int temp = a;
 a = b;
 b = temp;
 
 2.不利用第三方变量（面试，有印象）
 a = b - a; //求差值
 b = b - a; //一个数减去差值等于另外一个数
 a = b + a; //一个数+差值等于另外一个数



a=10,b=11,使用两种方法交换他们的值：
使用第三方变量
int temp;
temp = a;
a = b;
b = temp;

不使用第三方变量
a = b - a;
b = b - a;
a = b + a;

不使用第三方变量
a = a ^ b;
b = a ^ b;
a = a ^ b;

 */


/*

分别使用3种语言在屏幕上输出“哈哈”这一段文字，并且换行
1.C语言
#include <stdio.h>
int main()
{
    printf("哈哈\n");
    return 0;
}

2.Objective-C(OC)
#import <Foundation/Foundation.h>
int main()
{
    NSLog(@"哈哈");
    return 0;
}

3.Java
class Test
{
    public static void main(String[] args)
    {
        System.out.println("哈哈");
    }
}

*/

/***********************内存寻址**************************/

#include <stdio.h>

/*
 1.内存寻址由大到小，优先分配内存地址比较大的字节给变量
 
 2.变量越先定义，内存地址就越大
 
 3.取得变量的地址：&变量名
 
 4.输出地址：%p
 
 5.一个变量一定先进行初始化，才能使用
 */

int main()
{
    // 内存寻址由大到小
    int a = 10;
    
    int b = 20;
    
    int c;
    
    // &是一个地址运算符，取得变量的地址
    // %p用来输出地址
    // 0x7fff56f09bc8
    printf("a的地址是：%p\n", &a);
    // 0x7fff56f09bc4
    printf("b的地址是：%p\n", &b);
    // 0x7fff56f09bc0
    printf("c的地址是：%p\n", &c);
    
    //由于变量c没有经过初始化，所以直接拿来使用是不对的
    //int d = c  + 1;
     
    printf("c的值是%d\n", c);
    
    return 0;
}
/*
运行结果：
a的地址是：0x7ffee7a12978
b的地址是：0x7ffee7a12974
c的地址是：0x7ffee7a12970
c的值是-408868456
*/


/*********************代码块****************************/

/*
 1.变量的作用域
 从定义变量的那一行代码开始，一直到所在的代码块结束
 
 2.代码块的作用
 及时回收不再使用的变量，为了提升性能

 */
#include <stdio.h>


int test()
{
    int v = 10;
    return 0;
}

int main()
{
    {
        double height = 1.55;
        
        height = height + 1;
        
        printf("height=%f\n", height); //height=2.550000
    }
    
   /*
    {
        int a = 10;   //代码块只生效局部
    }
    
    printf("a=%d\n", a);*/
    
    
    int score = 100;
    
    {
        int score = 200;
        
        {
            int score;
            score = 50;
        }
        
        printf("score=%d\n", score); //score=200
    }
    
    printf("score=%d\n", score); //score=100     
    return 0;
}

/*
结果：

height=2.550000
score=200
score=100

*/

#include <stdio.h>

int main()
{
    int a = 20;
    int score = a + 100;
    printf("%d\n", score); //120
    
    {
        int score = 50;
        {
            score = 10;
            printf("%d\n", score);//10
        }
        a = 10;
    }
    
    {
        score = a + 250;
        // printf("%d\n", a); //10
        // printf("%d", score); //260
        int score = 30;
        printf("%d", score); //30
    }
    
    printf("%d\n", score); //260
    return 0;
}


/*
结果：

120
10
30260

*/

/*********************scanf****************************/

int age;
scanf("%d", &age);  //&是C语言中的一个地址运算符
// 短横线- 
scanf("%d-%d-%d", &a, &b, &c); //输入的时候： 10-14-20
// 逗号, 
scanf("%d,%d,%d", &a, &b, &c); // 输入格式：10,14,20  
// 井号# 
scanf("%d#%d#%d", &a, &b, &c); // 输入格式：10#14#20  
// 字母x ,或者其他英文字母
scanf("%dx%dx%d", &a, &b, &c); // 输入格式：10x14x20
// 空格 ， 分隔符可以是空格、tab、回车
scanf("%d %d %d", &a, &b, &c);

// note:  
// scanf的第一个参数中不要包含\n，比如scanf(“%d\n”, &a); 这将导致scanf函数无法结束


// scanf练习1:
#include <stdio.h>

int main()
{
    // 定义一个变量，用来保存用户输入的整数
    int number;
    
    // scanf函数只接受变量的地址
    // scanf函数是一个阻塞式的函数，等待用户输入
    // 用户输入完毕后，就会将用户输入的值赋值给number变量
    // 函数调用完毕
    scanf("%d", &number);
    
    printf("用户输入的值是%d\n", number);
    
    return 0;
}


// scanf练习2：
/*
 提示用户输入两个整数，计算并且输出两个整数的和
*/

#include <stdio.h>

int main()
{
    // 1.定义2个变量，保存用户输入的整数
    int num1, num2;
    
    // 2.提示用户输入第1个整数
    printf("请输入第1个整数：\n");
    
    // 3.接收用户输入的第1个整数
    scanf("%d", &num1);
    
    // 4.提示用户输入第2个整数
    printf("请输入第2个整数：\n");
    
    // 5.接收用户输入的第2个整数
    scanf("%d", &num2);
    
    // 6.计算和，并且输出
    int sum = num1 + num2;
    printf("%d+%d=%d\n", num1, num2, sum);
    
    //printf("num1=%d, num2=%d\n", num1, num2);
    return 0;
}


// scanf练习3：
#include <stdio.h>

int main()
{
    /* 1.输入字符
    char myc;
    
    scanf("%c", &myc);
    
    printf("输入的字符是%c\n", myc);
     */
    
    /* 2.一次性输入多个数值，并且以某些符号隔开
    int num1, num2;
     
    scanf("%d#%d", &num1, &num2);
    
    printf("num1=%d, num2=%d\n", num1, num2);
    */
    
    /*
    3.如果scanf参数中以空格隔开，实际输入可以以空格、tab、回车作为分隔符
    int num1, num2;
    scanf("%d %d", &num1, &num2);
    printf("num1=%d, num2=%d\n", num1, num2);
     */
    
    /*
    4.scanf中不能写\n
    int a;
    scanf("%d\n", &a); // 错误写法
    printf("a的值是%d\n", a);
     */
    
    return 0;
}


/*********************类型转换****************************/

/*
// 类型转换

自动类型转换
int a = 10.6;
int b = 10.5 + 1.7;
自动将大类型转换为了小类型，会丢失精度

自动类型提升


强制类型转换
double a = (double)1 / 2;
double b = (double)(1 / 2);
*/
#include <stdio.h>

int main()
{
    /*1.算数运算符的基本使用
    int a = 10 + 1 + 2 - 3 + 5;
    
    int b = -10;
    
    int c = 10 * b;
    
    int d = 10 / 2;
    
    // 取余运算（模运算）
    // %两边都是整数
    // %取余结果的正负性只跟%左边的数值有关
    int e = 10 % -3;
    printf("%d\n", e);
    */
    
    /*
    // 自动类型转换(double->int)
    int a = 10.8;
    
    // 强制类型转换（double->int）
    int b = (int) 10.5;
    printf("%d\n", a);
     */
    
    // 自动类型提升(int->double)
    double c = 10.6 + 6;

    double d = 1 / 3;
    
    double e = (double)3/2;
    
    printf("e的值是%f\n", e);
        
    return 0;
}


/*********************赋值运算****************************/


//赋值运算：
#include <stdio.h>

int main()
{
    int a = 10;
    
    // a = a + 5;
    
    // 复合赋值运算符
    a += 5; // a = a + 5;
    
    a *= 5; // a = a * 5;
    
    a += 5 + 6 + 4; // a = a + (5 + 6 + 4);
    
    a = 5 + 6 * 5 + 8;   

    printf("a的值是%d\n", a);
       
    return 0;
}


/*************************自增，自减************************/
/*
i++  ：先引用后增加
++i  ：先增加后引用
i++  ：先在i所在的表达式中使用i的当前值，后让i加1
++i  ：让i先加1，然后在i所在的表达式中使用i的新值
*/

// 自增和自减：
// NO.1:
#include <stdio.h>
int main()
{
    /*
    int a = 10;
    
    a = a + 1; // 11
    
    a += 1; // 12
    
    a++; // 13
    
    ++a; // 14
    
    a--; // a -= 1;  a = a - 1;   13
    */
    // printf("a的值是%d\n", a);
    
    int b;
    int a = 10;
   
    // b = (a++) + (++a); // b = 10 + 12;
    
    b = (++a) + (a++);   // b = 11 + 11;
   
    // a -> 11
    
    // a : 12
    printf("b=%d, a=%d\n", b, a);
    
    return 0;
}


// NO2.
#include <stdio.h>

int main()
{
    int x = 1,y = 1;
    if(x++==2 && ++y==2) { //0 && 1
        x =7;            //这里if没有执行完，所以y值还停留在1
    }
    printf("x=%d, y=%d\n", x, y); //2,1
    return 0;
}

// NO.3
#include <stdio.h>

int main()
{
    int x = 1,y = 1;
    if(x++==2 || ++y==2) {  0||1
        x =7;               //这里执行了if,所以y就变成了2了
    }
    printf("x=%d, y=%d\n", x, y); //7,2
    return 0;
}

/******************sizeof*******************************/

sizeof( 数据类型 ): 数据类型的长度

#include <stdio.h>

int main()
{
    // int size = sizeof(10); // 整形长度： 4
    // int size = sizeof 10.9;  // 浮点型长度： 8
    
    // int a = 10;
    
    // int size = sizeof(a);  
    // int size = sizeof a;
    
    int size = sizeof(char);  //字符型： 1
    // int size = sizeof char; // 错误的
    
    printf("size=%d\n", size);
    
    return 0;
}


/******************** 或||且&&非！*******三目**********************/

// 逻辑运算：

/*
main函数
返回值：0，正常退出；1，异常退出

signed int等价于signed，
unsigned int等价于unsigned

| 按位或
^ 按位异或
~ 按位取反


或||，且&&，非！
*/


#include <stdio.h>

int main()
{
    //逻辑与 条件1 && 条件2
    
    // int a  =  10>3 && 7<6;
    
    //int a = 0 && 10;
    
    //printf("a=%d\n", a);
    
    /*
    int a = 10;
    int b = 10;
    
    //int c = (a>5) && (++b>=11);
    
    int c = (a<5) && (++b>=11);
    
    // a = 10
    // b = 10
    // c = 0
    printf("a=%d, b=%d, c=%d\n", a, b, c);*/
    
    
    // 逻辑或 条件1 || 条件2
    
    //int a = 0 || 11;
    /*
    int a = 10;
    int b = 10;
    
    int c = (a<5) || (b++ - 10);
    
    // a = 10
    // b = 11
    // c = 0
    printf("a=%d, b=%d, c=%d\n", a, b, c);*/
    
    // 逻辑非 !条件
    // 如果条件成立，就返回0；如果条件不成立，就返回1
    
    //int a = !(10>8);
    
    //int a = !-10;
    
    //int a = !10>8;
    
    /*
    int a = !!10;
    
    printf("a=%d\n", a);
    */
         
    
    return 0;
}



// 三目运算符  条件 ? 数值1 : 数值2

//int a = !100 ? 9 : 89;

//printf("a=%d\n", a);


#include <stdio.h>

int main()
{
    /* 计算2个整数之间的最大值
    int a = 10;
    
    int b = 99;
    
    int c = a>b ? a : b;
     
     printf("c is %d\n", c);
    */
    
    // 计算3个整数之间的最大值
    int a = 10;
    int b = 999999;
    int c = 1000;
    
     // 求出a、b的最大值
    int abMax = (a > b) ? a : b;
    // 求出最终的最大值
    int d = (abMax > c) ? abMax : c;
    
    //int d = (((a > b) ? a : b) > c) ? ((a > b) ? a : b) : c;
    
    printf("d is %d\n", d);
    return 0;
}

/********************** if ***************************/


/*
 1.if的第1种结构
 if(条件)
 {
    语句1;
    语句2;
    ......
 }
 
 2.if的第2种结构
 if(条件1)
 {
     语句1;
     语句2;
     ......
 } 
 else
 {
    
 }
 
 3.if的第3种结构
 if(条件1)
 {
     语句1;
     语句2;
     ......
 }
 else if(条件2)
 {
 
 }
 else if(条件3)
 {
 
 }
 else if(条件4)
 {
 
 }
 else 
 {
 
 }
 
 4.if的第4种结构
 if (条件)
   语句1;

note:
1.  比较大小时，常量值放左边，变量放右边
2.  注意赋值运算符，不要写成两个=
3.  if语句后面不要写;
*/


/*
 输入一个整数score代表分数，根据分数输出等级（A-E）(用两种方式)
 A：90~100
 B：80~89
 C：70~79
 D：60~69
 E：0~60
*/

#include <stdio.h>

int main()
{
    // 1.提示输入
    printf("请输入分数值:\n");
    
    // 2.接收输入
    int score;
    scanf("%d", &score);
    
    // 3.判断等级 （性能最高）
    if (score>=90 && score<=100) { // [90, 100]
        printf("A\n");
    } else if (score>=80) { // [80, 89]
        printf("B\n");
    } else if (score>=70) { // [70, 79]
        printf("C\n");
    } else if (score>=60) { // [60, 69]
        printf("D\n");
    } else { // (-∞, 59]
        printf("E\n");
    }
    
    /* 性能中等
    if (score>=90 && score<=100) { // [90, 100]
        printf("A\n");
    } else if (score>=80 && score<=89) { // [80, 89]
        printf("B\n");
    } else if (score>=70 && score<=79) { // [70, 79]
        printf("C\n");
    } else if (score>=60 && score<=69) { // [60, 69]
        printf("D\n");
    } else { // (-∞, 59]
        printf("E\n");
    }*/
    
    /* 性能最差
    if (score>=90 && score<=100) { // [90, 100]
        printf("A\n");
    }
    
    if (score>=80 && score<=89) { // [80, 89]
        printf("B\n");
    }
    
    if (score>=70 && score<=79) { // [70, 79]
        printf("C\n");
    }
    
    if (score>=60 && score<=69) { // [60, 69]
        printf("D\n");
    }
    
    if (score<=59) { // (-∞, 59]
        printf("E\n");
    }*/
    return 0;
}


// if 练习：
/*
题目：程序运行的时候提示下列信息
 请输入相应数字选择需要执行的运算：
 1 加法
 2 减法
 
 用户选择运算后，再提示用户输入两个需要进行运算的整数，输入完毕后就输出运算结果
*/
#include <stdio.h>

int main()
{
    // 1. 提示用户选择计算类型
    printf("请输入相应数字选择需要执行的运算：\n");
    printf("1 加法\n");
    printf("2 减法\n");
    
    // 2. 定义变量存储用户选择的计算类型
    int type = 0;
    
    // 3. 让用户输入计算类型
    scanf("%d", &type);
    
    if (type!=1 && type!=2)
    {
        // type值输入不合理，就直接退出程序
        printf("非法选择\n");
        return 0;
    }
    
    // 4.提示用户输入两个计算的数值
    printf("请连续输入两个需要进行运算的整数，并且以空格隔开\n");
    
    // 5.定义2个变量存储数值
    int num1, num2;
    scanf("%d %d", &num1, &num2);
    
    // 6.计算
    int result;
    if (type == 1) {
        result = num1 + num2;
        printf("%d + %d = %d\n", num1, num2, result);
    } else if (type == 2) {
        result = num1 - num2;
        printf("%d - %d = %d\n", num1, num2, result);
    }
    return 0;
}


/*********************** switch ***************************/
/*
 if (条件)
 {
 
 }
 
 
 switch (数值)
 {
    case 数值1:
        语句1;
        break;
 
    case 数值2:
        语句2;
        break;
 
    default :
        语句3;
        break;
 }
 */


/*
 if和switch
 1> if语句能完成的功能，switch并不一定能完成
 int a = 10;
 if (a>100)
 {
 
 }
 
 2> 在有些情况下，if语句和switch语句可以互换
 
 3> switch能完成的功能，if语句都能完成
 */


// switch练习1：
#include <stdio.h>
int main()
{
    //int a = 10;
    // break:退出整个switch语句
    // 如果case后面没有break，就会执行后面所有case中的语句，直到遇到break为止
    /*
    int b = 10;
    
    switch (a)
    {
        case 10:
            printf("A\n");
            b++;
        case 5:
            printf("B\n");
            b++;
        case 0:
            printf("C\n");
            b++;
            break;
        default:
            printf("D\n");
            break;
    }
    
    printf("b的值是%d\n", b);*/
    
    char c = '+';
    int a = 10;
    int b = 20;
    // 如果要在case后面定义新的变量，必须用大括号{}包住
    switch (c) {
        case '+':
        {
            int sum = a + b;
            printf("和是%d\n", sum);
            break;
        }
            
        case '-':
        {
            int minus = a - b;
            printf("差是%d\n", minus);
            break;
        }
    }
    
    return 0;
}



 /*
 switch练习2：
 输入一个整数score代表分数，根据分数输出等级（A-E）(用两种方式)
 A：90~100 score/10 == 9、10
 B：80~89  score/10 == 8
 C：70~79  score/10 == 7
 D：60~69  score/10 == 6
 E：0~60   
 */

#include <stdio.h>
int main()
{
    int score = 100;
    
    switch (score/10) {
        case 10: // 100
        case 9: // 90+
            printf("A\n");
            break;
        case 8: // 80+
            printf("B\n");
            break;
        case 7: // 70+
            printf("C\n");
            break;
        case 6: // 60+
            printf("D\n");
            break;
        default:
            printf("E\n");
            break;
    }
    
    return 0;
}


/********************** while ****** continue/break **********************/
/*
 if (条件)
 {
 
 }
 
 while (条件)
 {
    循环体
 }
 
 运行原理
 1.如果一开始条件就不成立，永远不会执行循环体
 2.如果条件成立，就会执行一次循环体，执行完毕，再次判断条件是否成立......
 
 break
 直接结束整个while循环
 
 continue
 结束当前的循环体，进入下一次循环体的执行
 
 break和continue只针对当前循环体有效
 */


// break, continue实例：
#include <stdio.h>
int main()
{
    // 1.先确定需要重复执行的操作
    
    // 2.再确定约束条件
    
    // 定义一个变量记录做的次数
    int count = 0;
    
    /*
    while (count<50)
    {
        ++count;
        
        if (count%10 != 0)
        {
            printf("做第%d次俯卧撑\n", count);
        }
    }*/
    
    
    while (count<50)
    {
        ++count;
        
        if (count%10 == 0)
        {
            // 直接结束这一次循环体，进入下一次循环
            continue;   // ------>直接进入下一次循环
        }
        
        printf("做第%d次俯卧撑\n", count);
    }
    
    // while (count < 50)
    // {
    //     ++count;
        
    //     printf("做第%d次俯卧撑\n", count);
        
    //     if (count == 20)
    //     {
    //         break; // ------>直接中断while循环；
    //     }
    //     printf("在while里面");
    // }
    //     printf("在while外面");    
    
    return 0;
}



/*
 break:
 1.使用场合
 1> switch语句：退出整个switch语句
 2> 循环结构：退出整个循环语句
   * while
   * do while
   * for
 2.注意点
 只对最近的循环结构有效
 
 continue：
 1.使用场合
  循环结构：结束当前这次的循环体，进入下一次循环体
     * while
     * do while
     * for
 2.注意点
  只对最近的循环结构有效
 */
#include <stdio.h>
int main()
{
    /*
    for (int i = 0; i<5; i++)
    {
        if (i%2)
        { // i为奇数：1、3
            continue;
        }
        printf("%d\n", i);
    }
    */
    /*
    for (int i = 0; i<5; i++)
    {
        
        printf("哈哈哈\n");
        
        continue;
        
        printf("哈哈哈23\n");
    }*/
    
    for (int i = 0; i<3; i++)
    {
        for (int j = 0; j<4; j++)
        {
            if (j==1)
            {
                continue;            //continue和break都只对当前循环体有效
            }
            
            printf("j=%d, ", j);
        }
        
        // break;
        
        printf("B\n");
    }
    
    return 0;
}



/*
while (条件)
 {
    
 }

do {
 
} while(条件);
 
 while和do-while的区别
 1.很多情况下，while和do while可以互换
 
 2.while特点：如果一开始的条件不成立，永远不会执行循环体
 do while特点：不管一开始的条件是否成立，至少会执行一次循环体
 
 3.最好使用while
*/


/*********************** for ***************************/

/*
 for (语句1; 条件; 语句2)
 {
    循环体
 }
 
 语句1：初始化语句
 语句2：增量语句（执行完循环体后再执行的语句）
 
 1.for一开始就会执行一次语句1（整个for循环只会执行一次）
 2.判断条件是否成立，如果条件成立，就会执行一次循环体，然后就会执行语句2，再次判断条件是否成立


循环如何选择：
1> 一般优先使用for循环
2> 然后再考虑while
3> 最后再考虑do while

*/


// for练习1：
#include <stdio.h>
int main()
{
    /*
     "做俯卧撑"50次
     */
    /*
    int count = 0;
    
    for ( ; count < 50; )       // 可以省略语句1
    {
        printf("做俯卧撑\n");
        count++;
    }*/
    
    /*
    for (int count = 0; count < 50; )      // 可以省略语句2
    {
        printf("做俯卧撑\n");
        count++;
    }*/
    
    /*
    for (int count = 0; count < 50; count++)      // 最常见的格式
    {
        printf("做俯卧撑\n");
    }*/
    
    /*
    for (int count = 0; count < 50; printf("做俯卧撑\n"),printf("哈哈哈\n"),count++)     // 最长的格式
    {
        
    }*/
    
    return 0;
}


// for注意事项：
#include <stdio.h>
int main()
{
    /* 不要随便在for()后面写分号
    for (int i=0; i<5; i++);
    {
        printf("哈哈\n");
    }*/
    
    /* 错误:变量a的作用域不明确
     如果要在循环体中定义新的变量，必须用大括号{}包住
    for (int i=0; i<5; i++)

        int a = 10;
    */
    
    /* 错误
    for (int i = 0; i<10; i++, a++)
    {
        // a只能用在循环体{}中
        int a = 10;
    }*/
    
    /*
    int a = 10;

    for (int i=0, a= 9; i<5; i++)
    {
        //int i = 10;
        int a = 11;
        
        printf("a=%d\n", a);
    }*/
    
    // 最简单的利用for循环实现死循环
    // for(;;);
    
    return 0;
}



// for的嵌套：
/*
提示用户输入一个正整数n，如果n=5，就输出下列图形，其他n值以此类推
*****
****
***
**
*
*/

#include <stdio.h>

int main()
{
    // 1.定义一个变量存储用户输入的值
    int n = 0; // 一定要初始化
    
    // 2.判断n值合不合理
    while (n <= 0)
    {
        // 2.1 提示用户输入正整数
        printf("请输入一个正整数:\n");
        
        // 2.2 接收输入的数据
        scanf("%d", &n);
    }
    
    // 3.输出图形
    for (int i = 0; i<n; i++)// 有多少行
    {
        //printf("*****\n");
        for (int j = 0; j<n-i; j++)
        { // 每一行有多少个
            printf("*");
        }
        
        printf("\n");
    }
    
    return 0;
}
/********************** 函数 ***************************/

/*
 1.什么情况下定义函数：添加一个常用的新功能
 
 2.函数的定义格式
 返回值类型  函数名(形式参数列表)
 {
    函数体
 }
 
 3.定义函数需要明确的东西
 1> 起一个有意义的函数名
 2> 
 */


// 函数练习1：
#include <stdio.h>
int printLine()                       //无参数
{
    printf("-------------\n");
    return 0;
}

int average(int num1, int num2)       //有参数
{
    return (num1 + num2)/2;
}

int main()
{
    /*
    printLine();
    
    printLine();
    
    printLine();
     */
    
    int a = 10;
    int b = 9;
    
    int c = average(a, b);
    
    printf("c is %d\n", c);
    
    int a1 = 11;
    int b1 = 20;
    
    int d = average(a1, b1);
    printf("d is %d\n", d);
    
    return 0;
}


// 注意事项：
/*
 参数注意点：
 1.形式参数：定义函数时函数名后面中的参数,简称形参
 2.实际参数：调用函数式传入的具体数据，简称实参
 3.实参个数必须等于形参个数
 4.函数体内部不能定义和形参一样的变量
 5.如果是基本数据类型作为函数形参，纯粹是值传递，修改函数内部形参的值，并不会影响外面实参的值
 6.一个函数可以没有形参，也可以有无限多个形参
 */

/*
 return的作用：
 1> 退出函数
 2> 返回一个具体值给函数调用者
 
 返回值注意点
 1> void代表没有返回值
 2> 如果没有明确说明返回值类型，默认是返回int类型
 3> 就算明确声明了返回值类型，也可以不返回任何值
 
 默认情况下，C语言不允许两个函数的名称一样
 */

/*
 1.默认情况下，不允许有函数的名称一样
 2.函数不能嵌套定义（例：函数的定义不能写在main函数里面）
 3.函数不能重复定义，但是可以重复声明
 4.如果有函数的声明，没有函数的定义
 1> 编译可以通过，因为编译器只会检测语法合不合理，并不会检测函数有没有定义
 2> 链接报错，因为链接的时候会检测函数是否定义
*/



// 函数练习2：
#include <stdio.h>
// 形式参数,简称形参
int sum(int num1, int num2)
{
    // 函数体内部不能定义和形参一样的变量
    // int num1;

    num1 = 50;

    return num1 + num2;
}


char test()
{
    return 'A';
}

/*
void test(int a, int b)
{

}*/

void test5()
{
    
}

/* 伪代码
void login(QQ, 密码)
{
    // 1.验证QQ有没有值
    if (QQ没有值) return;
    
    // 2.验证密码有没有值
    if (密码没有值) return;
    
    // 3.把QQ、密码发送到服务器
    
}*/

int test3()
{
    printf("999999999\n");
}

// 如果不明确声明返回值类型，默认就是int类型
test2()
{
    printf("888888888\n");
    return 10;
}

int main()
{
    int c = test2();
    printf("c=%d\n", c);
    
    test3();
    //test();
    
    /*
    int a = 100;
    int b = 27;
    
    // a、b称为函数的实际参数，简称实参
    int c = sum(a, b);
    
    printf("a=%d, b=%d, c=%d\n", a, b, c);*/
    return 0;
}


// 函数练习3：
/*
   求两个整数的差
   打印一条横线
   打印N条横线
 
 定义函数的步骤
 1> 根据函数的作用，起一个有意义的名称
 2> 确定函数的形参个数
 3> 确定函数的返回值
 */
#include <stdio.h>

void printLines(int n)
{
    for (int i = 0; i<n; i++)
    {
        printf("-------------------\n");
    }
}

void printLine()
{
    printf("-------------------\n");
}

int minus(int a, int b)
{
    return a - b;
}

int main()
{
    printLines(10);
    //printLine();
    //printf("%d\n", minus(100, 29));
    
    return 0;
}



// 函数练习4：

#include <stdio.h>
// 函数的声明
void printLine(); //一般声明在这

int main()
{
    // void printLine();也可以声明在这
    printLine();
    return 0;
}

// 函数的定义
void printLine()
{
    printf("--------\n");
}

/*********************** include ***************************/

/*
 include
 1> 作用：拷贝右边文件的所有内容到#include所在的位置
 2> 自定义的文件用""，系统自带的文件用<>
 3> #include <stdio.h>的目的：拷贝printf函数的声明
 */

/*********************** 多文件开发 ***************************/
/*
1.函数的定义放.c文件，函数的声明放.h文件
2.如果要使用某个.c文件中定义的函数，只需要#include这个.c文件对应的.h文件
3..h文件的作用：被别人拷贝。编译链接的时候不需要管.h文件
4.cc xx.o xxx.o 将多个目标文件链接在一起
  cc xx.c xxx.c 将多个源文件编译、链接
*/

/*********************** 进制 ***************************/


/*
 %d\%i  十进制形式输出整数
 %c 输出字符
 %p 输出地址
 %f 输出小数
 %o 八进制形式输出整数
 %x 十六进制形式输出整数
 
 */

#include <stdio.h>
int main()
{
    // 默认情况下，就是十进制
    int number = 12;
    
    // 二进制(0b或者0B开头)
    int number2 = 0B1100;
    
    // 八进制（0开头）
    int number3 = 014;
    
    // 十六进制（0x或者0X开头）
    int number4 = 0xc;
    
    // %d以10进制整数的形式输出一个数值
    printf("%x\n", number);  // 以16进制输出
    
    return 0;
}

/*
 1.二进制转十进制
 0b1100 = 0 * 2的0次方 + 0 * 2的1次方 + 1 * 2的2次方+ 1 * 2的3次方
        = 0 + 0 + 4 + 8 = 12
 0b1111 = 1 + 2 + 4 + 8 = 15
 0b1010 = 10
 
 2.十进制转二进制
 67 = 64 + 2 + 1 = 2的6次方 + 2的1次方 + 2的0次方
    = 0b1000000 + 0b10 + 0b1
  = 0b1000011
 
 3.n位二进制的取值范围
 2位二进制位的取值范围：0~3  0~2的2次方-1
 3位二进制位的取值范围：0~7  0~2的3次方-1
 n位二进制位的取值范围：0~2的n次方-1
 
 
 4个字节 -> 31bit
 0    000 0000 0000 0000 0000 0000 0000 1100
 0 ~ 2的31次方-1
 */



// --------------------------------二进制形式输出
#include <stdio.h>
int main()
{
    void putBinary(int);
    
    putBinary(-12);
    putBinary(12);
    putBinary(13);

    return 0;
}

// 输出一个整数的二进制存储形式
void putBinary(int n)
{
    int bits = sizeof(n) * 8;
    while (bits-->0) {
        printf("%d", n>>bits&1);         //一个整数&1可以来判断奇偶性，偶数的结果为0，奇数的结果为1；
        if (bits%4==0) printf(" ");
    }
    printf("\n");
}

/*
1111 1111 1111 1111 1111 1111 1111 0100 
0000 0000 0000 0000 0000 0000 0000 1100 
0000 0000 0000 0000 0000 0000 0000 1101
*/



// --------------------------------二进制输出分割线
/*
写一个函数，用来输出整数在内存中的二进制形式
*/

#include <stdio.h>
void printBinary(int number);

int main()
{
    /*
     0000 0000 0000 0000 0000 0000 0000 0000
     0000 0000 0000 0000 0000 0000 0000 1111
     
     9 : 0000 0000 0000 0000 0000 0000 0000 1001
     -10 : 1111 1111 1111 1111 1111 1111 1111 0110
     */
    
    
    //printf("%d\n", ~9);
    
    
    printBinary(-10);
    return 0;
}

void printBinary(int number)
{
    
    // 记录现在挪到第几位
    // (sizeof(number)*8) - 1 == 31
    int temp = ( sizeof(number)<<3 ) - 1;
    
    while ( temp >= 0 )
    {
        // 先挪位，再&1，取出对应位的值
        int value = (number>>temp) & 1;
        printf("%d", value);
        
        // 
        temp--;
        
        // 每输出4位，就输出一个空格
        if ( (temp + 1) % 4 == 0 )
        {
            printf(" ");
        }
    }
    
    printf("\n");
}

/*********************** 内存存储细节 ***************************/

/*
 字节 变量       内容
 ffc1
 
 ffc2   number2 0000 1101
 ffc3           0000 0000
 ffc4           0000 0000
 ffc5           0000 0000
 
 ffc6   number  0000 1100
 ffc7           0000 0000
 ffc8           0000 0000
 ffc9           0000 0000
 */


int main()
{
    // 一个int类型数据占据4个字节、32bit
    // 0000 0000 0000 0000 0000 0000 0000 1100
    int number = 12; // 1100
    
    // 0000 0000 0000 0000 0000 0000 0000 1101
    int number2 = 13; // 1101
    
    return 0;
}



/*********************** 符号类型说明 ***************************/
#include <stdio.h>
/*
 int 4个字节  %d
 short 2个字节 %d
 long 8个字节  %ld
 long long 8个字节 %lld
 
 
 signed
 unsigned  %u
 */
int main()
{
    // 0000 0000 0000 0000 0000 0000 0000 0000
    // 2的31次方-1
    // 2的32次方-1
    int num;
    
    /*
     signed和unsigned的区别：
      signed 最高位要当做符号位
     unsigned 最高位不要当做符号位
    */
    // signed == signed int
    // signed 有符号:正数、0、负数
    signed int a = 10;
    signed a2 = 10;
    
    // unsigned int == unsigned
    // unsigned 无符号：0、正数
    unsigned int b = 10;
    unsigned b2 = 10;
    
    long unsigned int c = 34343;
    long unsigned c2 = 423432;
    
    short unsigned int d = 4343;
    short unsigned d2 = 43243;
    
    short signed int e = 54354;
    short signed e2 = 434;
    
    
    return 0;
}

void longAndShort()
{
    // long == long int
    long int a = 100645654654645645l;
    long a2 = 100645654654645645l;
    
    // long long int == long long
    long long int c = 100645654654645645ll;
    long long c2 = 4535435435435ll;
    
    // short == short int
    short int d = 5454;
    short d2 = 43434;
    
    //printf("%lld\n", c);
    
    int s = sizeof(long long int);
    printf("%d\n", s);  // 8
}


/*********************** 位运算 ***************************/
/*
     按位与 &
     

     按位或 |


     按位异或 ^ 

     1.相同数值进行异或，结果肯定是0，比如9^9
     2.交换 9^5^6 == 9^6^5
     3.任何数值跟0进行异或，结果还是原来的数值，9^0 == 9
     4.a^b^a == a^a^b == 0^b == b

     按位取反 ~
     ~0000 0000 0000 0000 0000 0000 0000 1001
      1111 1111 1111 1111 1111 1111 1111 0110
     printf("%d\n", ~9);

     左移 <<

     右移 >>

     9<<n -> 9 * 2的n次方
     8>>n -> 8/2的n次方

     判断一个数是否是奇偶性：
     1.用是否被2整除
     2.与0, 1的与操作：
     a&1 == 1 // 奇数
     a&1 == 0 // 偶数


    交换两个数的数值：
    int a = 10;
    int b = 11;
    
    1.借助第三方变量
    int temp = a;
    a = b;
    b = temp;
 
    2.利用两个数之间的差
    a = b - a;
    b = b - a;
    a = b + a;
    
    3. 使用位异或运算符交换两个变量的值
    a = a ^ b;   
    b = a ^ b;
    a = a ^ b;
    
*/     



/*
写一个函数，用来输出整数在内存中的二进制形式
*/

#include <stdio.h>
void printBinary(int number);

int main()
{
    /*
     0000 0000 0000 0000 0000 0000 0000 0000
     0000 0000 0000 0000 0000 0000 0000 1111
     
       9 : 0000 0000 0000 0000 0000 0000 0000 1001
     -10 : 1111 1111 1111 1111 1111 1111 1111 0110
    */
    
    
    //printf("%d\n", ~9);
    
    
    printBinary(-10);
    return 0;
}

void printBinary(int number)
{
    
    // 记录现在挪到第几位
    // (sizeof(number)*8) - 1 == 31
    int temp = ( sizeof(number)<<3 ) - 1;
    
    while ( temp >= 0 )
    {
        // 先挪位，再&1，取出对应位的值
        int value = (number>>temp) & 1;
        printf("%d", value);
        
        // 
        temp--;
        
        // 每输出4位，就输出一个空格
        if ( (temp + 1) % 4 == 0 )
        {
            printf(" ");
        }
    }
    
    printf("\n");
}


/*********************** 字符 ***************************/
   
    // 单引号''只能扩住单字节的字符

    // char c = '男'; // 错误写法
    
    //char c = "A";// 错误写法
    
    // char c = A; // 错误写法

/*********************** 数组 ***************************/
// 数组：
int ages[5] = {19, 19, 20, 21, 25}

// 初始化方式
int a[3] = {10, 9, 6};
int a[3] = {10,9};
int a[] = {11, 7, 6};
int a[4] = {[1]=11,[0] = 7};


// 二维数组初始化
int a[3][4] = {1,2,3,4,5,6};
int a[3][4] = {{},{},{}};

// 数组元素简单访问:
int a[][5] = {3,21,31,2,32,1};


    // 错误写法
    // int ages[];
    
  
    /* 只能在定义数组的同时进行初始化
    int ages[5];
    ages = {10, 11, 12, 14};     // 错误写法
    */

    // 正确写法,注意与上面的对比：
    /*
    int count = 5;
    int ages[count];
    ages[0] = 10;
    ages[1] = 11;
    ages[2] = 18;
    */

    // 如果想再定义数组的同事进行初始化，数组元素个数必须是常量，或者不写
    // int ages[count] = {10, 11, 12};      // 错误写法
    // int ages[] = {10, 11, 12, 78};    // 正确写法




/*
习题
1.提示输入5个学生的成绩，算出平均分、最高分、最低分，然后输出
2.设计一个函数：int arrayMax(int a[], int count)，找出数组元素的最大值
3.设计一个函数：int arraySum(int a[], int n)，求一维数组a前n个数的和
4.设计一个函数：将一维整型数组中的元素逆序存放。比如本来是1,3,4,2，逆序存放就变成了：2，4，3，1
5.编写一个函数char_contains(char str[],char c)，如果字符串str中包含字符c则返回数值1，否则返回数值0
*/


#include <stdio.h>

/*
 提示用户输入5个学生的成绩，算出平均分并且输出
 */

int main()
{
    
    
    // 1.定义一个数组来存储成绩
    int scores[5];
    
    // 2.提示输入成绩
    // 用来存储总分
    int sum = 0;
    for (int i = 0; i<5; i++) {
        // 2.1 提示输入某个学生的成绩
        printf("请输入第%d个学生的成绩:\n", i + 1);
        // 2.2 存储当前学生的成绩
        scanf("%d", &scores[i]);
        // 2.3 累加成绩
        sum += scores[i];
    }
    
    // 3.计算平均分，并且输出
    printf("平均分是%f\n", sum/5.0);


    return 0;
}



/***********************数组函数**************************/

#include <stdio.h>

// 数组作为函数参数，可以省略元素个数
// 数组作为函数参数，传递是整个数组的地址，修改函数形参数组元素的值，会影响到外面的实参数组

void change(int array[])
{
    //printf("array==%p\n", array);
    
    array[0] = 100;
}

void change2(int n)
{
    n = 100;
}

int main()
{
    int ages[6] = {10, 11, 10, 11, 10, 11};
    
    //printf("ages==%p\n", ages);
    
    change(ages);
    
    //change2(ages[0]);
    
    printf("%d\n", ages[0]);
    return 0;
}


/**********************数组练习***************************/
/*

设计一个函数，找出整型数组元素的最大值
*/

#include <stdio.h>

int maxOfArray(int array[], int length)
{
    // 数组当做函数参数传递时，会当做指针变量来使用，指针变量在64bit编译器环境下，占据8个字节
    
    //int size = sizeof(array);
    //printf("array=%d\n", size);
    
    //sizeof(array);
    
    // 1.定义一个变量存储最大值(默认就是首元素)
    int max = array[0];
    
    // 2.遍历所有元素，找出最大值
    for (int i = 1; i<length; i++)
    {
        // 如果当前元素大于max，就用当前元素覆盖max
        if (array[i] > max)
        {
            max = array[i];
        }
    }
    
    return max;
}

int main()
{
    int ages[] = {11, 90, 67, 150, 78, 60, 70, 89, 100};
    
    int ages2[] = {11, 90, 67, 150, 78, 60, 70, 89, 100};
    
    //int size = sizeof(ages);
    
    //printf("ages=%d\n", size);
    int max = maxOfArray(ages, sizeof(ages)/sizeof(int));
    
    printf("%d\n", max);
    return 0;
}


/********************************** 指针 **********************************/
// 指针：
定义：
int a = 10;
int *p = &a;

#include <stdio.h>
int main(int argc, char const *argv[])
{
    int a=10;
    int *pa; //如果要写成一行，用int *pa=&i;
    pa=&a;  //单独一行的时候，不能写成*pa=&i(编译报错),或者*pa=i（出来的值报错）
    *pa=20;
    printf("%d\n", a); //20
    printf("%d\n", *pa); //20
    return 0;
}

清空指针：
p = 0;
p = NULL;

指针探究：
1.指针变量所占用的存储空间？
2.为何指针变量要分类型？
3.指针遍历字符和整型的数组？
4.设计一个函数：int arraySum(int a[], int n)，求一维数组a前n个数的和。现在利用int *p替换int a[]

习题：
1.编写一个int string_len(char *s)，返回字符串s的字符长度


返回指针的函数的一般形式为：类型名 * 函数名(参数列表)
指向函数的指针一般形式：函数的返回值类型 (*指针变量名)(形参1, 形参2, ...);



// ------------------------------------------数组名和指针的区别：
// 循环遍历数组：
#include <stdio.h>
int main(int argc, char const *argv[])
{
int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
for (i = 0; i <= 9; i++) {
    printf("%d\n", a[i]); } 
    return 0;
}

// 指针遍历数组：
#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", pa[i]); }  //通过pa[i]取值，又把指针当做了一个数组
    return 0;
}

// 遍历指针地址：（修改pa+i的值）
#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *(pa+i); }  //通过*(pa+i)取值
    return 0;
}

// 遍历指针地址：(修改pa本身的地址值)
#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *pa); //直接取指针
        pa++; //地址加1
        }  //通过*(pa+i)取值
    return 0;
}

// 遍历数组地址：
#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    for (i = 0; i <= 9; i++){
        printf("%d\n", *(a+i)); } //可以直接取a,数组名也就是指针,前面没定义指针a；这儿不能使用a++，因为a是常量;
    return 0;
}


// 数组名和指针的区别：（某种意义上可以认为一样）
// 指针是一个指针变量，可以被修改；而数组是一个指针常量，不能被修改；

#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    int *const pa = a; //注意const位置，不是const int *pa,常量指针
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *(pa+i)); //直接取指针
        // pa++; //地址加1,这儿不能这么写，认为pa是一个常量了，所以pa的值不能被改变
        }  //通过*(pa+i)取值
    return 0;
}

note:
常量：
const int i=3
int const i=5
指针常量：
const int *p  //p的值可以被修改
int *const p  //p的值不能被修改

==============================================

#include <stdio.h>
void Exchg2(int *px, int *py){
    int tmp = *px; 
    *px = *py; 
    *py = tmp; 
    printf("*px = %d, *py = %d.\n", *px, *py);
} 
int main(){ 
    int a = 4; 
    int b = 6; 
    Exchg2(&a, &b); //6,4；函数的参数是个指针的话，传入的应该是一个地址
    printf("a = %d, b = %d.\n", a, b); //6,4,这里交换了指针地址，即对a，b进行了修改
    return(0);
} 


#include <stdio.h>
void Exchg3(int x, int y){
    int tmp = x; 
    x = y; 
    y = tmp; 
    printf("x = %d,y = %d\n", x, y); 
} 
int main(){ 
    int a = 4; 
    int b = 6; 
    Exchg3(a, b);  //6,4
    printf("a = %d, b = %d\n", a, b); 
    return(0);  //4,6 前一个函数引起的只是x,y形参的变化，不影响实参a,b
}

-------------------------------------------------
指向指针的指针
int **ppi;
int *pi;
int i=50;
pi=&i;
*ppi=&pi;
// *ppi的值就是*pi的值作为地址，然后去寻值


双指针的运用栗子：

#include <stdio.h>
void find1(char array[], char search, char *pa)
{
    int i;
    for (i = 0; *(array + i) != 0; i++){
    if ( *(array+i) == search){
        pa = array + i;
        // printf("找到了,pa=%s\n", pa); //找到了,pa=dfsdfdf
        break;
        }
    else if (*(array+i) == 0){
        pa = 0;
        // printf("没找到,pa=%s\n", pa);
        break;
        }
    }
}

int main()
{
    char str[] = {"afsdfsdfdf\0"}; /* 待查找的字符串 */
    char a = 'd'; /* 设置要查找的字符 */
    char *p = 0; /* 如果查找到后指针 p 将指向字符串中查找到的第 1 个字符的地址。 */
    find1(str, a, p); /* 调用函数以实现所要操作。这儿的p是传入的地址值 */
    if (0 == p){
        printf("没找到！\n"); /* 如果没找到则输出此句 */
        }
    else{
        printf("找到了，p = %s", p); /* 如果找到则输出此句*/
        }
    return(0);
}

//函数的结果是"没有找到"
array = str;
search = a;
pa = p; /* 请注意：以上三句是调用时隐含的动作。*/ 
// 址传递其实就是地址值传递！！！
// 这也是对形参的改变不影响实参；对pa的修改，并不影响函数外部p的值；
// 解决的一种方法是函数内部直接输出


// 还有一种方法就是双指针：
#include <stdio.h>
void find1(char array[], char search, char **ppa)
{
    int i;
    for (i = 0; *(array + i) != 0; i++){
    if ( *(array+i) == search){
        *ppa = array + i;
        // printf("找到了,pa=%s\n", pa);
        break;
        }
    else if (*(array+i) == 0){
        *ppa = 0;
        // printf("没找到,pa=%s\n", pa);
        break;
        }
    }
}
int main()
{
    char str[] = {"afsdfsdfdf\0"}; /* 待查找的字符串 */
    char a = 'd'; /* 设置要查找的字符 */
    char *p = 0; /* 如果查找到后指针 p 将指向字符串中查找到的第 1 个字符的地址。 */
    find1(str, a, &p); /* 调用函数以实现所要操作。这儿传入的是p的地址 */
    if (0 == p){
        printf("没找到！\n"); /* 如果没找到则输出此句 */
        }
    else{
        printf("找到了，p = %s\n", p); /* 如果找到则输出此句*/
        }
    return(0);
}

// 运行结果：找到了，p = dfsdfdf
 array = str;
 search = a;
 ppa = &p; /* 请注意：以上三句是调用时隐含的动作。 */ 
// ppa 指向指针 p 的地址。
// 对*ppa 的修改就是对 p 值的修改。

======================================================

函数名与指针：
note:
1.函数名就是指针；
2.赋值时，即可 FunP = &MyFun (取地址)形式，也可 FunP = MyFun（直接取）。
void MyFun(int x); =  void MyFun(int);   //不能写成 void (*MyFun)(int)。
void(*FunP)(int x); = void (*FunP)(int);  //不能写成 void FunP(int)。 



#include <stdio.h>

void MyFun(int x); // 此处的声明也可写成：void MyFun(int) 

int main(int argc, char* argv[]){
    MyFun(10); // 这里是调用 MyFun(10) 函数 
    return(0);
}

void MyFun(int x){ // 这里定义一个 MyFun 函数 
    printf("%d\n",x);
}



#include <stdio.h>

void MyFun(int x); // 这个声明也可写成：void MyFun( int )

void (*FunP)(int ); //也可声明成 void(*FunP)(int x)，但习惯上一般不这样。

int main(int argc, char* argv[]){
    MyFun(10); // 这是直接调用 MyFun 函数 ，10 
    FunP = &MyFun; // 将 MyFun 函数的地址赋给 FunP 变量 ；这儿类似于 pi=&i 
    (*FunP)(20); // （★）这是通过函数指针变量 FunP 来调用MyFun 函数的。20 
    // FunP(20); //这儿也可以这样写
    // (*MyFun)(20); //也可以这样
}

void MyFun(int x){ /* 这里定义一个 MyFun 函数 */
    printf("%d\n",x);
}



#include <stdio.h>

void MyFun(int x);

void (*FunP)(int );//声明一个用以指向同样参数，返回值函数的指针变量。 

int main(int argc, char* argv[]){
    MyFun(10); //这里是调用 MyFun(10)函数-----10 
    FunP = MyFun; // 将 MyFun 函数的地址赋给 FunP 变量 ，相当于直接将函数名赋值给了指针
    FunP(20); // （★）这是通过函数指针变量来调用 MyFun 函数的。---20
    // (*FunP)(20); //这儿也可以这样写
    // (*MyFun)(20); //也可以这样
    return 0;
}
void MyFun(int x){//这里定义一个 MyFun 函数
    printf("%d\n",x);
}




自动变量：
auto修饰
所有的局部变量在默认情况下都是自动变量

静态变量：
所有的全局变量都是静态变量
被关键字static修饰的局部变量也是静态变量

寄存器变量：
被关键字register修饰的自动变量都是寄存器变量
只有自动变量才可以是寄存器变量，全局变量和静态局部变量不行
寄存器变量只限于int、char和指针类型变量使用


结构体：
c语言中数组只能是一个类型，python可以是多个，于是引入了结构体来解决这个问题；
结构体跟对象不一样；

struct Student {
    char *name; // 姓名
    int age; // 年龄
    float height; // 身高
};


结构体的三种定义：
// 1.先定义结构体类型，再定义变量，结构体变量名为stu
struct Student {
    char *name;
     int age;
 };
struct Student stu;
// 2.定义结构体类型的同时定义变量
struct Student {
    char *name;
    int age;
} stu;
// 3.直接定义结构体类型变量，省略类型名
struct {
    char *name;
    int age;
} stu;


结构体的注意点:
1.不允许对结构体本身递归定义
2.结构体内可以包含别的结构体
3.定义结构体类型，只是说明了该类型的组成情况，并没有给它分配存储空间，就像系统不为int类型本身分配空间一样。
只有当定义属于结构体类型的变量时，系统才会分配存储空间给该变量
struct Student {
    char *name;
    int age;
};
struct Student stu;
// 第1~4行并没有分配存储空间，当执行到第6行时，系统才会分配存储空间给stu变量。
4.结构体变量占用的内存空间是其成员所占内存之和，而且各成员在内存中按定义的顺序依次排列

结构体初始化：
struct Student {
     char *name;
     int age;
};
 
struct Student stu = {"MJ", 27};
// 不能分开，下方的就是错误的：
// struct Student stu;
// stu = {"MJ", 27};

// 访问stu的age成员
stu.age = 27;

连续使用成员运算符"."访问最低一级成员
struct Date {
     int year;
     int month;
     int day;
};
struct Student {
    char *name;
    struct Date birthday;  // 结构体嵌套
};
struct Student stu;
stu.birthday.year = 1986; // 两个点访问深层
stu.birthday.month = 9;
stu.birthday.day = 10;


相同类型的结构体变量之间可以进行整体赋值
struct Student {
    char *name;
    int age;
};
struct Student stu1 = {"MJ", 27};
// 将stu1直接赋值给stu2
struct Student stu2 = stu1;
printf("age is %d", stu2.age);



结构体数组定义：
struct Student {
    char *name;
    int age;
};
struct Student stu[5]; //定义1，数组元素个数是5
 
struct Student {
    char *name;
    int age;
} stu[5]; //定义2
 
struct {
    char *name;
    int age;
} stu[5]; //定义3


结构体初始化：
struct {
    char *name;
    int age;
} stu[2] = { {"MJ", 27}, {"JJ", 30} };


结构体作为函数参数：

#include <stdio.h>

// 定义一个结构体
struct Student {
    int age;
};

void test(struct Student stu) {
    printf("修改前的形参：%d \n", stu.age);
    // 修改实参中的age
    stu.age = 10;    
    printf("修改后的形参：%d \n", stu.age);
}

int main(int argc, const char * argv[]) {   
    struct Student stu = {30};
    printf("修改前的实参：%d \n", stu.age); //30
    
    // 调用test函数
    test(stu);    //前：30，后：10
      
    printf("修改后的实参：%d \n", stu.age); //30,  形参的改变并不会影响实参
    return 0;
}



结构体的指针形式：struct 结构体名称 *指针变量名
结构体的指针形式，有3种访问结构体成员的方式
1.结构体变量名.成员名
2.(*指针变量名).成员名
3.指针变量名->成员名


#include <stdio.h>
int main(int argc, const char * argv[]) {
    // 定义一个结构体类型
    struct Student {
        char *name;
        int age;
    };
    
    // 定义一个结构体变量，实例化结构体
    struct Student stu = {"MJ", 27};
    
    // 定义一个指向结构体的指针变量
    struct Student *p;
    
    // 指向结构体变量stu
    p = &stu;
/*
     这时候可以用3种方式访问结构体的成员
     */
    // 方式1：结构体变量名.成员名
    printf("name=%s, age = %d \n", stu.name, stu.age);
    
    // 方式2：(*指针变量名).成员名
    printf("name=%s, age = %d \n", (*p).name, (*p).age);
    
    // 方式3：指针变量名->成员名
    printf("name=%s, age = %d \n", p->name, p->age);
    
    return 0;
}




枚举：
一般形式为：enum枚举名{枚举元素1,枚举元素2,……};
enum Season {spring, summer, autumn, winter}; 
枚举的三种定义：
enum Season {spring, summer, autumn, winter};
enum Season s;
enum Season {spring, summer, autumn, winter} s;
enum {spring, summer, autumn, winter} s;

note:
1.C语言编译器会将枚举元素(spring、summer等)作为整型常量处理,称为枚举常量。
2.默认情况下，第一个枚举元素的值为0，第二个为1，依次顺序加1。
enum Season {spring, summer, autumn, winter}; 
也就是说spring的值为0，summer的值为1，autumn的值为2，winter的值为3
3.也可以在定义枚举类型时改变枚举元素的值
enum season {spring, summer=3, autumn, winter};
没有指定值的枚举元素，其值为前一元素加1。也就说spring的值为0，summer的值为3，autumn的值为4，winter的值为5

枚举变量的基本操作：
1.赋值：
enum Season {spring, summer, autumn, winter} s;
s = spring; // 等价于 s = 0;
s = 3; // 等价于 s = winter;
2.遍历：
enum Season {spring, summer, autumn, winter} s;
// 遍历枚举元素
for (s = spring; s <= winter; s++) {
    printf("枚举元素：%d \n", s);
}




宏定义：
// C语言提供的预处理指令主要有：宏定义、文件包含、条件编译
// 预处理指令可以出现在程序的任何位置，它的作用范围是从它出现的位置到文件尾。习惯桑写在程序的开头
一般形式：
#define 宏名 字符串
比如#define ABC 10
注意宏跟常量的区别：
#define A 3       //会把全文中所有的a替换为3
const int A = 3;  //会把a常量的值赋值为3


#include <stdio.h>
// 源程序中所有的宏名PI在编译预处理的时候都会被3.14所代替
#define PI 3.14
// 根据圆的半径计radius算周长
float girth(float radius) {
    return 2 * PI *radius;
}
int main ()
{
    float g = girth(2);
    
    printf("周长为：%f \n", g);
    return 0;
}


note:
1.宏名一般用大写字母，以便与变量名区别开来，但用小写也没有语法错误
2.对程序中用双引号扩起来的字符串内的字符，不进行宏的替换操作。比如：
#include <stdio.h>
#define R 10
int main ()
{
    char *s = "Radio";
    printf("%s\n", s);
}
3.如果需要终止宏定义的作用域，可以用#undef命令
#define PI 3.14
/*
.
.
.
*/
#undef PI
4.定义一个宏时可以引用已经定义的宏名


带参数的宏定义
#define 宏名(参数列表) 字符串
#include <stdio.h>
#define average(a, b) (a+b)/2    //感觉宏又有点像函数,average跟参数之间不能有空格,否则编译不过
int main ()
{
    int a = average(10, 4);
    
    printf("平均值：%d \n", a);
    return 0;
}

note:
1.宏名和参数列表之间不能有空格，否则空格后面的所有字符串都作为替换的字符串，导致编译不过
2.宏后面的参数一般需要用括号括起来，即使是一个参数,如下：

#include <stdio.h> 
#define D(a) 2*(a) // 括起来
int main ()
{
    int b = D(3+4);  //2*(3*4)
    
    printf("%d \n", b);
    return 0;
}
#include <stdio.h> 
#define D(a) 2*a // 不括起来
int main ()
{
    int b = D(3+4);  //2*3+4
    
    printf("%d \n", b);
    return 0;
}

3.计算结果最好也用括号括起来
#include <stdio.h>
#define Pow(a) (a) * (a)  //平方的结果没有括起来
int main(int argc, const char * argv[]) {
    int b = Pow(10) / Pow(2);   //(10) * (10) / (2) * (2)=100
    printf("%d\n", b);
    return 0;
}

#include <stdio.h>
#define Pow(a) ((a) * (a))  //平方的结果括起来
int main(int argc, const char * argv[]) {
    int b = Pow(10) / Pow(2);   //((10) * (10)) / ((2) * (2))=25
    printf("%d\n", b);
    return 0;
}


宏与函数的区别：
1.宏定义不涉及存储空间的分配、参数类型匹配、参数传递、返回值问题
2.函数调用在程序运行时执行，而宏替换只在编译预处理阶段进行。所以带参数的宏比函数具有更高的执行效率



条件编译：

#if 条件1
 ...code1...
#elif 条件2
 ...code2...
#else
 ...code3...
#endif   //需要写endif

举个栗子：
#include <stdio.h>
#define MAX 11

int main ()
{
#if MAX == 0
    printf("MAX是0");
#elif MAX > 0
    printf("MAX大于0");  //因为max=11,所以这句会被编译到代码里面去
#else
    printf("MAX小于0");
#endif
    return 0;
}

其他用法：
#if defined(MAX) //如果前面定义过这个宏，则编译code
    ...code...
#endif

#if !defined(MAX) //如果没定义过这个宏，则编译code
    ...code...
#endif

#ifdef MAX   //和#if defined()的用法基本一致
    ...code...
#endif

#ifndef MAX  //和#if !defined()的用法基本一致致
    ...code...
#endif



预处理#include.h

1.#include指令允许嵌套包含，比如a.h包含b.h，b.h包含c.h，但是不允许递归包含，比如 a.h 包含 b.h，b.h 包含 a.h。
2.为了解决重复编译，导致程序变慢的问题：需要在每个xx.h文件中写上：
#ifndef _ONE_H_  //如果没有被定义one.h文件，则定义one.h
#define _ONE_H_
#endif

如下栗子：
#include "one.h"
#ifndef _ONE_H_
#define _ONE_H_

void one();
#endif

// #include "two.h"
#ifndef _TWO_H_
#define _TWO_H_

// #include "one.h"
#ifndef _ONE_H_
#define _ONE_H_

void one();
#endif

void two();
#endif

// 编译后就只有两个声明，就不会有重复的声明：
void one();
void two();


外部函数：
如果在当前文件中定义的函数允许其他文件访问、调用，就称为外部函数。
C语言规定，不允许有同名的外部函数。

内部函数：
如果在当前文件中定义的函数不允许其他文件访问、调用，只能在内部使用，就称为内部函数。
C语言规定不同的源文件可以有同名的内部函数，并且互不干扰。


栗子：
在main.c中调用one.c中定义的one函数
main.c如下：
#include <stdio.h>  //include的意思相当于拷贝
#include "one.h"  //引用one.h文件，这儿.h文件是头文件的意思，是否跟one.c不一致？
int.int main(int argc, char const *argv[])
{
    void one();
    return 0;
}

one.h如下：
#include <stdio.h>
void one() //void前面省略了extern， 因为函数默认可以被外部调用
{
    printf("调用了one函数\n");
    return 0;
}


栗子：内部函数
#include <stdio.h> 
static void test();  //加上static，针对于内部函数使用，函数外部无法调用
int main(int argc, const char * argv[])
{
    test();
    return 0;
}

static void test() {
    printf("调用了test函数");
}

Note:
所谓编译，就是单独检查每个源文件的语法是否合理，并不会检查每个源文件之间的关联关系，一个源文件编译成功就生成一个目标文件。
所谓链接，就是检查目标文件的关联关系，将相关联的目标文件组合在一起，生成可执行文件。
定义和声明完全是两码事



全局变量：

// java中，可以调用在后面定义的变量：
public class Test(){
    public void test(){
        a=10;  //可以调用后面的a
    }
    int a;
}

// 然而在c语言中如此调用编译会报错，一般有两种解决方法：
1.把int a 在调用之前定义
int a;
int main(){
    a=10
    return 0;
}
2.在函数前面进行声明,需要用关键字extern
extern int a;  // 声明，这儿的extern声明，表示可以用自己文件内的全局变量，或者其他源文件的变量；
int main(){
    a=10;
    return 0; 
}
int a;  // 定义,定义的位置可以随便定


// 注意区别下面两个程序：
int a;
int main(){
    extern int a;  //这儿有extern,这其中的几个a都是全局变量
    a=10;
    return 0;
}
int a;  //可以重复定义a的值


int a;
int main(){
    int a;  //如果去掉了extern,那么这个花括号里面的a都是局部变量了，外面两个为全局变量
    a=10;
    return 0;
}
int a;  //可以重复定义a的值


note:
// 假如在另一个源文件中也有全局变量int a;，那么这两个源文件的所有全局变量int a;都代表着同一个变量。
// 如果不想其他源文件共享，相当于私有的全局变量，那么就得用static关键字来定义变量   static int a;
// extern是用来声明已经定义过而且能够访问的变量，如果外部文件变量私有化了，就不用能用  extern int a; 
// extern可以用来声明一个全局变量，但是不能用来定义变量；


类型别名： typedef

// 一般用法：
#include <stdio.h> 
typedef int Integer;  //int别名
typedef unsigned int UInterger; //unsinged int
typedef float Float; //float

int main(int argc, const char * argv[]) {
    Integer i = -10;
    UInterger ui = 11;   
    Float f = 12.39f;    
    printf("%d  %d  %.2f", i, ui, f);
    
    return 0;
}

// * 也可以在别名的基础上再起一个别名
typedef int Integer;
typedef Integer MyInteger;


typedef与指针：
#include <stdio.h>
typedef char *String;   // 给指针类型char *起别名为String
int main(int argc, const char * argv[]) {
    String str = "This is a string!";   // 相当于char *str = "This is a string!";
    printf("%s", str);   
    return 0;
}

typedef结构体：

// 以前结构体的写法
struct MyPoint { // 定义一个结构体
    float x;
    float y;
};
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    struct MyPoint p;
    p.x = 10.0f;
    p.y = 20.0f;
    
    return 0;
}

// 用别名的结构体的写法
struct MyPoint { // 定义一个结构体
    float x;
    float y;
};
// 起别名
typedef struct MyPoint Point;   //方法一
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    Point p;
    p.x = 10.0f;
    p.y = 20.0f;    
    return 0;
}

// 结构体取别名可以在定义的步骤就开始：
typedef struct MyPoint { //方法二
    float x;
    float y;
} Point;

typedef struct {  //方法三
    float x;
    float y;
} Point;


typedef与结构指针：

#include <stdio.h>
typedef struct {
    float x;
    float y;
} Point;  // 定义一个结构体并起别名

typedef Point *PP;  // 起别名，指向结构体的指针定义了别名PP
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    Point point = {10, 20};   
    // 定义指针变量
    PP p = &point;    
    // 利用指针变量访问结构体成员
    printf("x=%f，y=%f", p->x, p->y); //x=10.000000，y=20.000000 
    return 0;
}


typedef与枚举类型：


// 定义枚举类型的第一种方式：
enum Season {spring, summer, autumn, winter};
// 给枚举类型起别名
typedef enum Season Season;
// 定义枚举类型的第二种方式：
// typedef enum Season {spring, summer, autumn, winter} Season
// 定义的第三种方式：
// typedef enum {spring, summer, autumn, winter} Season;
int main(int argc, const char * argv[]) {
    // 定义枚举变量
    Season s = spring; 
    printf("%u\n", s); //这里的s为unsigned int类型  
    return 0;
}


typedef与函数指针：

#include <stdio.h>
 // 定义一个sum函数，计算a跟b的和
 int sum(int a, int b) {
     int c = a + b;
     printf("%d + %d = %d", a, b, c);
     return c;
 } 
 int main(int argc, const char * argv[]) {
     int (*p)(int, int) = sum;       // 定义一个指向sum函数的指针变量p
     // 利用指针变量p调用sum函数
     (*p)(4, 5); //9
     
     return 0;
 }

//另外一种写法：
#include <stdio.h>
 // 定义一个sum函数，计算a跟b的和
 int sum(int a, int b) {
     int c = a + b;
     printf("%d + %d = %d", a, b, c);
     return c;
 } 
 typedef int (*MySum)(int, int);//给指向函数的指针类型，起了个别名叫MySum，被指向的函数接收2个int类型的参数，返回值为int类型。
 int main(int argc, const char * argv[]) {
     // 定义一个指向sum函数的指针变量p
     MySum p = sum;
     // 利用指针变量p调用sum函数
     (*p)(4, 5);
     
     return 0;
 }


typedef与#define

typedef char *String1; //char *起了个别名String1

#define String2 char * //定义了宏String2

int main(int argc, const char * argv[]) {
    String1 str1, str2;  //定义了两个指向char类型的指针    
    String2 str3, str4;  //char *替换了Sting2的字段
    return 0;
}

// 结果：只有str1、str2、str3才是指向char类型的指针变量，str4只是个char类型的变量。
Note:
以后给类型起别名，最好使用typedef，而不是使用#define


===================================================================
typedef 举栗子：

// typedef常用系列：
#include <stdio.h>
typedef int* PINT; /* 为 int* 类型定义了一个 PINT 的别名*/
int main(){
    int x;
    PINT px = &x; /* 与“int *px=&x;”是等价的。PINT 类型其实就是 int * 类型 */
    *px = 10; /* px 就是 int*类型的变量 */
    return 0;
}


// typedef声明函数
#include <stdio.h>
void MyFun(int x); /*此处的声明也可写成：void MyFun( int )*/
typedef void (*FunType)(int); /*（★）这样只是定义一个函数指针类型*/
FunType FunP; /*然后用 FunType 类型来声明全局 FunP 变量*/

int main(int argc, char* argv[]){
    // FunType FunP; /*函数指针变量当然也是可以是局部的 ，那就请在这里声明了。 */
    MyFun(10);
    FunP = &MyFun;
    return 0;
}
void MyFun(int x){
    printf("%d\n",x);
}
/*
有了 FunType 类型后，我们就可以同样地、很方便地用 FunType 类型来
声明多个同类型的函数指针变量了。如下：
FunType FunP2;
FunType FunP3; 
*/


// typedef的应用
/*
要求：我要设计一个 CallMyFun 函数，这个函数可以通过参数中的函数
指针值不同来分别调用 MyFun1、MyFun2、MyFun3 这三个函数（注：这三个
函数的定义格式应相同）。
实现：代码如下：
*/

// 先写main函数，main中需要用到callMyfun, CallMyFun中需要用到三个fun; 四个函数都需要前面声明，声明可以重定义


#include <stdio.h>

void MyFun1(int x);
void MyFun2(int x);
void MyFun3(int x);

typedef void (*FunType)(int); // ②. 定义一个函数指针类型FunType

void CallMyFun(FunType fp,int x);

int main(int argc, char* argv[]){
    CallMyFun(MyFun1,10); /* ⑤. 通过 CallMyFun 函数分别调用三个不同的函数 */
    CallMyFun(MyFun2,20);
    CallMyFun(MyFun3,30);
}

void CallMyFun(FunType fp,int x){ /* ③. 参数fp的类型是FunType。*/
    fp(x);/* ④. 通过 fp 的指针执行传递进来的函数，注意fp所指的函数是有一个参数的。 */
}

void MyFun1(int x){/* ①. 这是个有一个参数的函数，以下两个函数也相同。 */
    printf("函数 MyFun1 中输出：%d\n",x);
}

void MyFun2(int x){
    printf("函数 MyFun2 中输出：%d\n",x);
}

void MyFun3(int x){
    printf("函数 MyFun3 中输出：%d\n",x);
}

// 函数 MyFun1 中输出：10
// 函数 MyFun2 中输出：20
// 函数 MyFun3 中输出：30



/**************************************************01/
// 函数习题：

/*
题目：提示用户输入一个正整数n，利用while循环计算并输出：1-2+3-4+5-6+7…+n的和
*/
#include <stdio.h>

int main()
{
    // 1.定义变量存储用户输入的整数
    int n = 0;
    
    // 2.判断n是否为正整数
    while (n <= 0) {
        // 2.1 提示输入
        printf("输入一个正整数：\n");
        
        // 2.2 让用户输入
        scanf("%d", &n);
    }
    
    // 3.计算阶乘
    int sum = 0; // 存储计算结果
    int current = 0; // 当前要累加的数值
    while (current < n) {
        current++;
        
        // 如果是偶数，就减
        if (current % 2 == 0) {
            sum -= current;
        } else { // 如果是奇数，就加
            sum += current;
        }
    }
    
    // 4.输出结果
    printf("%d\n", sum);
    
    return 0;
}

/**************************************************02/

/*
题目：提示用户输入一个正整数n，计算并输出n的阶乘结果：1*2*3*…*n
*/
#include <stdio.h>

int main()
{
    // 1.定义变量存储用户输入的整数
    int n = 0;
    
    // 2.判断n是否为正整数
    while (n <= 0) {
        // 2.1 提示输入
        printf("输入一个正整数：\n");
        
        // 2.2 让用户输入
        scanf("%d", &n);
    }
    
    // 3.计算阶乘
    int result = 1; // 存储计算结果
    int current = 1; // 当前的乘数
    while (current <= n) {
        result *= current; // 累乘每次的乘数
        current++; // 乘完一次就++
    }
    
    // 4.输出阶乘结果
    printf("%d! = %d\n", n, result);
    
    return 0;
}

/**************************************************03/

/*
 题目：提示用户输入一个正整数n，如果n是5，就输出下列图形，其他n值以此类推
 *
 **
 ***
 ****
 *****
*/
#include <stdio.h>

int main()
{
    // 1.定义变量存储用户输入的整数
    int n = 0;
    
    // 2.判断n是否为正整数
    while (n <= 0) {
        // 2.1 提示输入
        printf("输入一个正整数：\n");
        
        // 2.2 让用户输入
        scanf("%d", &n);
    }
    
    // 3.输出一条分隔线（跟用户的输入隔开）
    printf("-----------------\n");
    
    // 4.输出*
    for (int row = 1; row<=n; row++) { // 有多少行
        for (int col = 1; col<=row; col++) { // 每行多少个(每行的个数跟行号一样)
            printf("*");
        }
        // 输完一行后换行
        printf("\n");
    }
    return 0;
}

/**************************************************04/

/*
 题目：提示用户输入一个小于10的正整数n，如果n是5，就输出下列图形，其他n值以此类推
 1
 22
 333
 4444
 55555
*/
#include <stdio.h>

int main()
{
    // 1.定义变量存储用户输入的整数
    int n = 0;
    
    // 2.判断n是否为1~9的正整数
    while (n <= 0 || n>=10) {
        // 2.1 提示输入
        printf("输入一个1~9的正整数：\n");
        
        // 2.2 让用户输入
        scanf("%d", &n);
    }
    
    // 3.输出一条分隔线（跟用户的输入隔开）
    printf("-----------------\n");
    
    // 4.输出
    for (int row = 1; row<=n; row++) { // 有多少行
        for (int col = 1; col<=row; col++) { // 每行多少个
            printf("%d", row); // 输出行号
        }
        printf("\n");
    }
    return 0;
}

/**************************************************05/

/*
 题目：提示用户输入一个小于10的正整数n，如果n是5，就输出下列图形，其他n值以此类推
 54321
 5432
 543
 54
 5
*/
#include <stdio.h>

int main()
{
    // 1.定义变量存储用户输入的整数
    int n = 0;
    
    // 2.判断n是否为1~9的正整数
    while (n <= 0 || n>=10) {
        // 2.1 提示输入
        printf("输入一个1~9的正整数：\n");
        
        // 2.2 让用户输入
        scanf("%d", &n);
    }
    
    // 3.输出一条分隔线（跟用户的输入隔开）
    printf("-----------------\n");
    
    // 4.输出
    for (int row = 1; row <= n; row++) { // 有多少行
        for (int col = n; col >= row; col--) { // 每行多少个
            printf("%d", col);
        }
        printf("\n");
    }
    return 0;
}


/**************************************************06/

/*
 题目：
 编写一个函数int pieAdd(int n)，计算1!+2!+3!+……+n!的值（n>=1）。
 比如pieAdd(3)的返回值是1! + 2! + 3! = 1 + 1*2 + 1*2*3 = 9
*/
#include <stdio.h>

// 声明函数
int pieAdd(int n);

int main()
{
    int result = pieAdd(3);
    
    printf("%d\n", result);
    return 0;
}

// 定义函数
int pieAdd(int n)
{
    /*
     解题思路：先计算出每个数字的阶乘，再把所有的阶乘加起来
     */
    
    // 1.如果传入的n值不合理，直接返回0
    if (n<1) return 0;
    
    // 2.定义一个变量，用来记录每次阶乘相加的结果
    int sum = 0;
    
    for (int i = 1; i<=n; i++) { // 一共有多少个数字
        
        // 3.定义一个变量，记录当前数字对应的阶乘
        int multi = 1;
        for (int j=1; j<=i; j++) {
            multi *= j;
        }
        
        // 4.累加每次的阶乘
        sum += multi;
    }
    
    return sum;
}

/**************************************************07/
/*
需求：
1.公司里面假设有2个开发人员：张三、李四

2.李四负责编写一些两个整数之间的算术运算函数，包含了：加法、减法、乘法、除法

3.张三负责编写main函数，并且要用到李四编写的算术运算函数

根据上面的情景，合理设计一套程序
1> 文件个数不限
2> 文件名自拟
*/

//------------------------- lisi.c

/*
 作者：李四
 函数的定义
 */

// 加法
int sum(int num1, int num2)
{
    return num1 + num2;
}

// 减法
int minus(int num1, int num2)
{
    return num1 - num2;
}

// 乘法
int multiply(int num1, int num2)
{
    return num1 * num2;
}

// 除法
int divide(int num1, int num2)
{
    return num1 / num2;
}

//------------------------- lisi.h
/*
作者：李四
函数的声明
*/

// 加法
int sum(int num1, int num2);
// 减法
int minus(int num1, int num2);
// 乘法
int multiply(int num1, int num2);
// 除法
int divide(int num1, int num2);

//------------------------- zhangsan.c

/*
 作者：张三
 程序的入口
*/

#include "lisi.h"
#include <stdio.h>

int main()
{
    int a = 10;
    int b = 2;
    
    printf("%d + %d = %d\n", a, b, sum(a, b));
    printf("%d - %d = %d\n", a, b, minus(a, b));
    printf("%d * %d = %d\n", a, b, multiply(a, b));
    printf("%d / %d = %d\n", a, b, divide(a, b));
    
    return 0;
}

/**************************************************08/






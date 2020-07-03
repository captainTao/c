
// 单行注释
/*
 多行注释
 /* 多行注释支持嵌套*/
 */
//: 双行加冒号表示使用markup语法，跟markdown类似
//: # 一级标题
//: ## 二级标题

/*:
 # 一级标题
 ## 二级标题
 @next, @previous是系统自带的:
 [上一页](@previous)
 [下一页](@next)
 */


 /*
 
 swfit汇编语言
 -----------
 call 调用函数
 lea 地址传递
 mov 移动,赋值
 %rdi 带有%的是寄存器
 (%rdi) 带小括号的是寻找寄存器的存储空间
 je,jmp 跳转，即switch case语句中使用
 
 常用的16个寄存器
 rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp
 r8, r9, r10, r11, r12,r13, r14, r15
 
 寄存器用途:
 rax,rdx常用作函数返回值使用
 rdi, rsi, rdx, rcx, r8, r0等常用于存放函数参数
 rsp, rbp用于栈操作
 rip作为指令指针：
 存储着cpu吓一跳要执行的指令的地址
 一旦cpu读取一条指令，rip会自动指向下一条指令
 */


//import UIKit

//var str = "Hello, playground"
//print("str")
//print(str)


// print输出函数
// public func print(items: Any..., separator: String = default, terminator: String = default)

 for x in 0...10{
     print("\(x) ", terminator: "")
 }
 print()

 // 用户输入
 let theInput = readLine()

 // typealias
 // typealias newname = type
 typealias Feet = Int
 // 在swift中没有下面三个类型
 typealias Byte = Int8
 typealias Short = Int16
 typealias Long = Int32
 
 typealias Date = (year: Int, month: Int, day: Int)
 print(Date(1996,32,44).year)
 

 // Int类型在swift中是结构体，所以有以下方法：
 print(UInt8.max) // 求解UInt8的最大数
 print(Int16.min) // 求解UInt8的最大数


 // swift标准库中有定义：Void就是空元祖()
 public typealias Void = ()
 

// Boolean类型在oc中是YES,NO,在swift中是true,false

 let z = 1
 let x:Double = 1
 let y:Double = 1.0

 let string = "小马哥" // 字符串类型推断
 let character:Character = "A" // 字符类型需要标明
 
 //字面量可以直接相加：
 let result1 = 3 + 4.34353643
 
 var i = 1
 var name: String
 var Name: String? // 可选类型

 let str = "x+y= "
 let xy = x + y
 print("str + String(xy)")
 print("x + y = \(x + y)")


// 多行字符串"""
let apples = 3
let oranges = 2
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""


// 整数和浮点数可以额外添加0和下划线增加识别度
100_0000; 1_000_000.000_1; 0000123.456
 
// 强制类型转换：
 let int1: UInt16 = 2_000
 let int2: UInt8 = 1
 let int3 = int1 + UInt16(int2) // 一般把占用空间小的转换为空间大的
 
 let int = 3
 let double = 3.14343636
 let result = Double(int)+double
 let result23 = Int(double)  // 3，也可以把大的转化成小的
// let intPi = Int(pi)
 

 let num = [1,2,3]
 var names = ["i","j"]
 let dic = ["one":1, "two":2]

 let t = (1,3,5)
 t.0  // 通过.取值
 t.1


 // 包含
 let range =  ...5
 range.contains(5)

 let stringRange = "cc"..."ff"
 stringRange.contains("cd")
 stringRange.contains("fg")

 let stringRange2 = "a"..."f"
 stringRange2.contains("e")
 
 // 可选项输出：
var aa:Int? = 8
print(String(describing: aa))

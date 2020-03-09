
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


// 整数和浮点数可以额外添加0和下划线增加识别度
100_0000; 1_000_000.000_1; 0000123.456
 
// 强制类型转换：
 let int1: UInt16 = 2_000
 let int2: UInt8 = 1
 let int3 = int1 + UInt16(int2) // 一般把占用空间小的转换为空间大的
 
 let int = 3
 let double = 3.14343636
 let result = Double(int)+double
 
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
 
 /*

 // 取数组元素：
 
 // i默认为let类型，如果需要更改，则需要在变量i前面加上var
 let numbers = [1, 2, 3, 4]
 for i in numbers{
     print(i)
 }
 
 //如果不需要用i值，则用下划线代替
 for _ in numbers{
    print("hello, world!")
 }

 // 可以通过下标来取值
 let names = ["Tony", "Jack", "Sparrow", "QiQi", "Jony"]
 for name in names[0...3]{
     print(name)
 }

 // 单侧区间，一边可以理解为无穷大
 for name in names[...2]{
     print(name)
 }
 for name in names[..<2]{
     print(name)
 }
 for name in names[2...]{
     print(name)
 }
 

 // 数组步长
 for tickMark in stride(from: 3, through: 11, by: 2){
     print(tickMark) // 3...11
 }

 for e in stride(from: 3, to: 11, by: 2){
     print(e) // 3...9
 }

 // for中用where来过滤数组
 let numbers = [10, 20, 30, -10, 50, -30]
 var sum = 0
 for num in numbers where num > 0 {
     sum += num
 }
 print(sum)
 
 

 // 标签语句
 outer: for i in 1...4 {
     for k in 1...4 {
         if k == 3 {
             continue outer
         }
         if i == 3 {
             break outer
         }
         print("i = \(i), k = \(k)")
     }
 }
 
 
 // 字典为无序
 let dict = ["a": 1, "b": 2, "c": 3]
 for (key, value) in dict {
     print(key + "===" , value)
     print("\(key) = \(value)")
 }

 // while...do
 var i = 100
 while i < 100 {
     i += 1
 }
 print(i)

 // 类似do...while
 // 从swift3中取消了自增，自减的运算符
 repeat {
     i += 1
 } while i < 100
 print(i)

 // if else ..

 // if else if ..



 // switch:
 // 1.不存在隐式的贯穿：不用加break,这个是跟其他语言的区别
 // 2.支持区间匹配
 let someInt = 3
 switch someInt {
 case 0...3:
     print("0...3")
 case 3...10:
     print("3...10")
 default:
     print("default")
 }

 // 3.支持元组匹配
 // 4.值绑定
 // 5.支持where条件
 // 6.支持复合条件匹配
 let point = (1, 3)
 switch point {
 case (0,0), (1,3):
     print("(0,0)/(1,3)")
 case (_,0):
     print("x轴")
 case(0,let y):
     print("y轴坐标", y)
     print("y=\(y)")
 case let(x, y) where x == -y:
     print("x = ", x, "y =", y)
     fallthrough // 这个是贯穿的意思
 case (-2...2, -2...2):
    print("inside the square!")
 default:
     print("other")
 }
 
 // 7.switch必须能处理所有的情况
 
 // 枚举类型, switch中也可以不加default. default可以排除没有列举完的类型
 enum Answer {case right, wrong}
 let answer = Answer.right
 switch answer {
 case Answer.right:
     print("right")
 case Answer.wrong:
     print("wrong")
 }
 
 // 8.switch在oc中只支持整形，在swift中支持字符串，字符类型
 
 // 不能像其他语言那样写两个case，可以case 1, 2: 或者case1后加fallthrough
 /*
  var a = 3
  switch a {
  case 1:
  case 2:
      print("1")
  default:
      print("2")
  }
 */

 
 // continue, break用在for语句中
 let numbers = [1,2,3,4,5,6,7,8]
 for num in numbers{
     if num == 5{
         continue// break
     }
     print(num, terminator: "")
 }
 // fallthrough用在switch中
 // return用在函数中
 // throw用在try中



 let numbers = ["10", "20", "30", "-10", "50", "-kk30"]
 var sum = 0
 var index = 0
 while let num = Int(numbers[index]), num > 0 {
     sum += num
     index += 1
 }
 print(sum)

 var aa:Int? = 8
 print(String(describing: aa))

 */

// 对于字符的可选类型，条件转换可以用逗号


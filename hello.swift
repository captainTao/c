/*
Note:
1.if后面的条件可以不跟小括号，后面必须为bool类型，不能为值
2.repeat while类似do...while
3.从swift3中取消了自增，自减的运算符
4.区间运算符，开，闭区间1...3 1..<5  单侧区间1...
5.\()可以取值
6.for循环中，i默认为let类型，如果需要更改，则需要在变量i前面加上var，
  如果不需要用i值，则用下划线代替
  可以通过数组的下标来取值
7.case，default后面不能写括号，case后面可以不用写break，switch必须能处理所有的情况
8.switch在oc中只支持整形，在swift中支持字符串，字符类型
9.c++默认参数必须从右边往左边写，不能跳过，但swift允许
10.一个函数只能有一个可变参数
11.inout参数可以更改函数外面的值，可变参数不能标记为inout，inout参数不能有默认值
12.可选项，满足多个条件不能用&&，用多个if,或者逗号链接
13.可选类型：字典取值后是，类型转换后是？
14.不是可选类型：数组取出来就不是
15.枚举类型占用的空间，= 关联值（最长的一个case内存值）+ 成员值（1byte）
16.内存中，64位计算机以64位存储：0x00-0xFF为一个字节，16^2=256，可以表示256种情况
*/



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


/********************************输入输出*/
// print函数
public func print(items: Any..., separator: String = default, terminator: String = default)

for x in 0...10{
    print("\(x) ", terminator: "")
}
print()


// 用户输入
let theInput = readLine()

/********************************Int,String*/

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
 
let intPi = Int(pi)
 

 // 包含
 let range =  ...5
 range.contains(5)

 let stringRange = "cc"..."ff"
 stringRange.contains("cd")
 stringRange.contains("fg")

 let stringRange2 = "a"..."f"
 stringRange2.contains("e")


/********************************数组*/

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

 // 可以通过下标来取值，最后一个元素后面允许有逗号
 let names = ["Tony", "Jack", "Sparrow", "QiQi", "Jony"]
 for name in names[0...3]{
     print(name)
 }

 //


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
 

 // 添加
 names.append("blue paint")


 // 数组步长：
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
 
 
/*********************************/
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
 
 /*********************************/
 // 字典为无序
 let dict = ["a": 1, "b": 2, "c": 3]
 for (key, value) in dict {
     print(key + "===" , value)
     print("\(key) = \(value)")
 }
 
 // 数组和元组
let num = [1,2,3]
var names = ["i","j"]
let dic = ["one":1, "two":2]

 let t = (1,3,5)
 t.0  // 通过.取值
 t.1


/********************************循环和条件*/
// 在 if 语句中，条件必须是一个布尔表达式
// ——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地与 0 做对比。

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

// 对于字符的可选类型，条件转换可以用逗号


/********************************四则，三目，空合，区间*/


//赋值
// 常量赋值只能赋值一次
let c: Int // 定义类型名
c = 9
// 一般语言要求：常量在编译的时候，必须要有值，但swift可以
var num = 10;
num += 10;
let dd = num


let a = 5
var b = 6
b = a

let (x, y) = (1, 2)
x
y


if x == y {
    
}

// 四则运算
//+ - * /

let i = -1
-i
+i
9%4
 
// 组合运算符，比较运算符

let at = (2, "abc")
let bt = (2, "bcd")
at > bt
//元组最多能比较7个元素


// 三目、空合


let a = 1
let b = 2
let c = a > b ? "a > b" : "a <= b"

var name: String?
let realName = name != nil ? name! : "unknown"
let realN = name ?? "unknow"
print(realName)
print(realN)


// 区间、逻辑
//开区间
for id in 1..<5 {
    print(id)
}
//闭区间
for id in 1...3 {
    print(id)
}

let numbers = [1, 2, 3, 4]
for i in numbers{
    print(i)
}


/********************************函数*/
/*
  函数：

 1.可以隐式返回
 2.支持可变参数，参数默认值，参数标签，
 3.函数类型
 4.Inout参数
 */

// 形参默认是let,也只能是let 
// 无参，无返回
func hello() {
    print("hello,HH")
}
hello()
// 有参，无返回
func helloSB(person: String) {
    print("hello,\(person)")
}
helloSB(person: "Captain")

// 有参，有返回
func Greeting(person: String, isGreeted: Bool) -> String{
    return !isGreeted ? "hello,\(person)!" : "\(person) has gretted!"
}
print(Greeting(person: "Captain", isGreeted: true))
print(Greeting(person: "Lemon", isGreeted: false))

// 多参，多返回
func mult(a: Int, b: Int) -> (product: Int, sum: Int){
    return (a * b, a + b)
}
print(mult(a: 3, b: 4))



/********************************函数参数*/

// 函数隐式返回：
// 函数体内只有一个单一的表达式，那么这个函数会隐式返回,可以不用写return
func summ(v1: Int, v2: Int) -> Int {
    v1 + v2
}
summ(v1: 10, v2: 20)


// 函数的参数标签
func Greet(name person: String, from place: String) -> String{
    return "hello,\(person) from \(place)!"
}
print(Greet(name: "SongLi", from: "YiBing"))

// 用 _可以省略输入函数标签name，from, 开发过程中经常省略第一个标签


// 可以添加默认值
func Greeta(_ person: String, _ place: String = "China") -> String{
    return "hello, \(person) from \(place)!"
}
print(Greeta("Avatar", "360"))
print(Greeta("QiQi"))


// 非固定参数,一个函数只能有一个可变参数
 func sumof(numbers: Int...) -> Int {
     var sum = 0
     for number in numbers{
         sum += number
     }
     return sum
 }
 print(sumof(numbers: 42, 597, 12))
 print(sumof())


 // 紧跟在可变参数后面的参数不能省略标签
 func test(_ numbers: Int..., string: String, _ other: String){}
 test(3, 4, 5, string: "test", "other")



// 输入输出参数：
 // inout参数：可以在函数内部更改函数外面的值，本质是引用传递
 // 可变参数不能标记为inout
 // inout参数不能有默认值
 // inout参数不能是常量，字面量，需要是变量，可以被多次赋值
 var number = 10
 func change(number: inout Int) {
     number = 20
 }
 change(number: &number)
 print(number) // 20
 

 // 交换系统默认有swap()
 var a = 1
 var b = 2
 (b, a) = (a, b)
 print(a, b)



/********************************函数类型*/
// 函数类型：
 func sum(a: Int, b:Int) -> Int {
    a + b
 }   // (Int, Int) -> Int
 

// 定义变量为函数类型
 var fn: (Int, Int) -> Int = sum
 fn(2, 3) //5 调用时不需要参数标签
 

// 函数作为参数，同样需要传入函数类型
// 函数作为参数
func Sum(a:Double, b:Double) -> Double{
    return a + b
}

func Product(a:Double, b:Double) ->Double{
    return a * b
}

func MathFunc(_ Fun: (Double, Double) -> Double, figureOne a: Double, figureTwo b: Double) -> String{
    return "Result = \(Fun(a, b))"
}

print(MathFunc(Sum(a:b:), figureOne: 3.4, figureTwo: 5.2))
print(MathFunc(Product(a:b:), figureOne: 3.2, figureTwo: 2.5))
// 上面这个函数也可以写成嵌套逻辑



// 函数作为返回类型
let value = 3
func forward(_ value: Int) -> Int {
    return value + 1
}

func backforward(_ value: Int) -> Int {
    return value - 1
}

func chooseFunc(_ value: Int) -> (Int) -> Int {
    return value > 0 ? forward : backforward
}

let Function = chooseFunc(4)
print(Function(4))
print(chooseFunc(3)(-2)) //选择函数然后计算


/************************************函数重载和内联函数*/
/*
函数重载function overload
规则：
1.函数名相同
2.参数个数不同||参数类型不同||参数标签不同
Note:
默认参数和函数重载一起使用时候，编译器不会报错，（c++会报错）
可变参数，省略参数标签，函数重载一起使用时，编译器可能会报错
*/


/*
内联函数inline-function
定义:开启了编译优化，会将某些函数转换为内联函数
build setting中：debug是没有优化的，release有，想当于把函数调用变成了函数体

哪些不会被内联？
1.函数体比较长的时候
2.函数中包含递归
3.函数中有动态下发
 
在releae模式下，编译器已经开启优化，会自动决定谁需要内联，所以没必要使用 @inline
*/

// 永远不会被内联，即使开启了编译器优化
@inline(never) func test(){
    print("test")
}

// 一直会被内联
@inline(__always) func test1(){
    print("test")
}




/************************************枚举类型*/

// 枚举类型：
enum Direction {
    case north
    case south
    case west
    case east
}
// 可以写在一起，也可以分开写
enum Direction1 {
    case north, south, west, east
}

var dir = Direction.east
dir = Direction.south
dir = .west //前面已经赋值知道dir类型，后面可以用.代替

switch dir {
case .east:
    print("east")
default:
    print("others!")
}

// 关联值
// 有时候会将成员枚举值和关联的类型存储在一起
enum Score {
    case points(Int)
    case grade(Character)
}
var score = Score.grade("A")
score = .points(97)

switch score {
case let .points(n): // let类型是定义n
    print(n, "points")
case let .grade(c):
    print("grade", c)
}

enum Date {
    case digit(year: Int, mouth: Int, day: Int)
    case string(String)
}
var date = Date.digit(year: 2020, mouth: 9, day: 1)
date = .string("2020-2-20")
switch date {
case .digit(let year, let mouth, let day): // 多个参数，参数可变性写里面; 如果每个类型一样，则也可以写外面； 必要时，用var
//case let .digit(year, mouth, day):
    print(year, mouth, day)
case let .string(value): // 一个参数的，参数可变性写外边
    print(value)
}


// 原始值（Raw Values），需要是相同类型，在enum后面加入raw value的类型
// 原始值不占用枚举变量的内存
enum Grade : String {
    case perfect = "A"
    case great = "B"
    case good = "c"
    case bad = "d"
}
var gg = Grade.perfect
print(gg.rawValue)
print(Grade.perfect.rawValue)

// 隐式原始值
// 如果枚举的原始类型是Int,String, Swift会自动分配原始值
enum Season : Int {
    case spring, summer, autumn, winter
}

print(Season.spring.rawValue) // 0
print(Season.summer.rawValue) // 1
print(Season.autumn.rawValue) // 2
print(Season.winter.rawValue) // 3

enum Season1 : Int {
    case spring = 1, summer, autumn = 4, winter
}
print(Season1.spring.rawValue) //1
print(Season1.summer.rawValue) //2
print(Season1.autumn.rawValue) //4
print(Season1.winter.rawValue) //5


// 递归枚举
indirect enum ArithExpr { // indirect为递归关键字
    case number(Int)
    case sum(ArithExpr, ArithExpr)
    case difference(ArithExpr, ArithExpr)
}

//enum ArithExpr {
//    case number(Int)
//    indirect case sum(ArithExpr, ArithExpr) // 关键字indirect也可以写在里面
//    indirect case difference(ArithExpr, ArithExpr)
//}

let five = ArithExpr.number(5)
let four = ArithExpr.number(4)
let two = ArithExpr.number(2)
let sum = ArithExpr.sum(five, four) // 5, 4
let diffrence = ArithExpr.difference(sum, two) // 5, 4  <->  2

func calculate(_ expr: ArithExpr) -> Int {
    switch expr {
    case let .number(value):
        return value
    case let .sum(left, right):
        return calculate(left) + calculate(right)
    case let .difference(a, b):
        return calculate(a) - calculate(b)
    }
}

calculate(diffrence) // 5 + 4 - 2  = 7


//MemoryLayout

enum Password {
    case number (Int, Int, Int, Int) // 8 * 4   4个字节
    case string (String) // 8 * 2  2个字节
    case other // 0 无类型，不分配字节空间
}
MemoryLayout<Password>.stride // 40 分配到的内存:  32(选项中占用字节最长的一个) + 1（成员标识符 1 byte 可以表示2^8种情况）
MemoryLayout<Password>.size // 32 实际用到的内存大小
MemoryLayout<Password>.alignment // 8 对齐参数

var pwd = Password.number(9, 8, 7, 6)
pwd = .other
MemoryLayout.stride(ofValue: pwd) // 40
MemoryLayout.size(ofValue: pwd) // 33
MemoryLayout.alignment(ofValue: pwd)  // 8


enum TestEnum {
    case test
}
MemoryLayout<TestEnum>.stride // 0 分配到的内存,因为初始化没有指定test类型
MemoryLayout<TestEnum>.size // 1 实际用到的内存大小
MemoryLayout<TestEnum>.alignment // 1 对齐参数


enum TestEnum: Int {
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
}
// 1个字节存储成员值
// N个字节存储关联值（N取决于内存占用最大的关联值），任何一个case的关联值都共用这个N歌字节
// 共用体
var e = TestEnum.test1(1, 2, 3)
// 大端存储：
// 
// 小端模式存储：高高低低（从做往右内存地址越来越高，放的数据对应高位数据；）
// 0x00 00 00 00 00 00 01

// e的存储形式：
// 01 00 00 00 00 00 00 00  
// 02 00 00 00 00 00 00 00  
// 03 00 00 00 00 00 00 00  
// 00                      --> 这个存储的是成员值
// 00 00 00 00 00 00 00    --> 内存补齐

e = .test2(4, 5)
// e的存储形式：
// 04 00 00 00 00 00 00 00  
// 05 00 00 00 00 00 00 00  
// 00 00 00 00 00 00 00 00  
// 01
// 00 00 00 00 00 00 00

e = .test3(6)
// e的存储形式：
// 04 00 00 00 00 00 00 00  
// 05 00 00 00 00 00 00 00  
// 00 00 00 00 00 00 00 00  
// 01
// 00 00 00 00 00 00 00


e = .test4(6)
// e的存储形式：
// 04 00 00 00 00 00 00 00  
// 05 00 00 00 00 00 00 00  
// 00 00 00 00 00 00 00 00  
// 01
// 00 00 00 00 00 00 00

/************************************类*/

// 类
class Shape {
    var numberOfSlides = 0
    // 初始化方法，初始化的时候，需要传入初始化参数
    // 初始化方法，也是构造方法
    init(_ numberOfSliders: Int) {
        self.numberOfSlides = numberOfSliders
    }
    func Description() -> String {
        return "A shape of \(self.numberOfSlides)!"
    }
}

//let shape = Shape(3)
//shape.numberOfSlides = 5
//print(shape.Description())

// 可选链式调用
var shape: Shape? = Shape(3)
shape = nil
// 为可选类型的时候，对象后面要加?
print(shape?.Description())

//继承
class nameShape: Shape {
    let name: String
    var dot: Int
    init(_ name: String, numberOfSliders: Int, dot: Int) {
        self.name = name
        self.dot = dot
        super.init(numberOfSliders)
    }
    // 重写需要保持： 返回值类型
    override func Description() -> String {
        return "A \(self.dot) dot and \(self.numberOfSlides) sliders with the name: \(self.name) shape!"
    }
}

var ccshape = nameShape("kk", numberOfSliders: 7, dot: 6)
//var ccshape = nameShape(name: "cc", numberOfSliders: 7, dot: 3)
//ccshape.name = "salanghei" // 常量不能更改
ccshape.dot = 4
print(ccshape.dot)
print(ccshape.Description())


/************************************UIKit*/

 // 可以l预览一个view, vc
 import UIKit
 import PlaygroundSupport

 let view = UIView()
 view.frame = CGRect(x: 0, y:0, width: 200, height: 200)
 view.backgroundColor = UIColor.green
 PlaygroundPage.current.liveView = view

 let imageView = UIImageView(image: UIImage(named: "logo.png"))
 PlaygroundPage.current.liveView = imageView

 let vc = UITableViewController()
 vc.view.backgroundColor = UIColor.lightGray
 PlaygroundPage.current.liveView = vc


/************************************可选项*/

// 在类型后面加一个问号，定义一个可选项
// 可选项初始化默认值为nil, 也可以赋值为nil
var name: String? = "Jack"
name = nil

var age: Int? // 默认nil
age = 10
age = nil

var array = [1, 15,40, 29]
func get(_ index: Int) -> Int? {
    if index < 0 || index >= array.count {
        return nil
    }
    return array[index]
}
print(get(1))
print(get(-1))
print(get(-4) ?? 3)


/ 解包：
 // 取出被包装的数据，解包用!
 var age1: Int? = 10
 var ageInt: Int = age1!
 ageInt += 10
 
 // 对nil 的可选项解包会产生运行时错误
 // Fatal error: Unexpectedly found nil while unwrapping an Optional value
 // var age: Int?
 // age!

 // 隐式解包,类型后面加！，可以避免每次都要去解包
 let num1: Int! = 10
 let num2: Int! = num1
 
 let num3: Int! = nil
 //Fatal error: Unexpectedly found nil while .....
 


 let number = Int("kk123") // 这里number是可选类型，可以通过编译器提示查看
 if number != nil {
    // print("转换成功：\(number)")
    // 可选项用下面这个转换为字符串
    print("转换成功：\(String(describing: number))")
 } else {
     print("转换失败")
 }


/************************************可选项值绑定*/
// 可选值绑定
// 自动绑定，有值则赋值，并返回true. 无值则返回false
if let number = Int("kkk123") {
    print("转换成功：\(number)")
} else {
    print("转换失败")
}


enum Season: Int {
    case spring = 1, summer, autumn, winter
}

if let season = Season(rawValue: 4) {
    switch season {
    case .spring:
        print("spring")
    case .winter:
        print("winter")
    default:
        print("other")
    }
} else {
    print("no such reason")
}


// 下面两种写法等价：
if let first = Int("4") {
    if let second = Int("42") {
        if first < second && second < 100 {
            print("\(first) < \(second) < 100")
        }
    }
}

if let first = Int("4"), let second = Int("42"), first < second && second < 100 {
    print("\(first) < \(second) < 100")
}


 // 可选项绑定用于在数组中：
 var strs = ["10", "20", "adb", "-20", "30"]
 var index = 0
 var sum = 0
 while let num = Int(strs[index]), num > 0 {
     sum += num
     index += 1
 }
 print(sum)



 // 空合并运算
/*
 a ?? b
 a是可选项，b可以是或者不是可选项
 a,b 存储类型相同
 最终结果:类型，取决于b, 值取决于a是否为nil
*/

 let a: Int? = 1
 let b: Int? = 2
 let c = a ?? b  // Int?, Optional(1)
 
 let a1: Int? = nil
 let b1: Int? = 2
 let c1 = a1 ?? b1 // Int?, Optional(2)
 
 let a2: Int? = nil
 let b2: Int? = nil
 let c2 = a1 ?? b1 // Int?, nil
 
 let a3: Int? = 1
 let b3: Int = 2
 let c3 = a1 ?? b1 // Int, 1

 let a4: Int? = nil
 let b4: Int = 2
 let c4 = a1 ?? b1 // Int, 2


// ？？跟if let配合使用
// 类似 if a != nil || b != nil
 let a5: Int? = nil
 let b5: Int? = 2
 if let c = a5 ?? b5 {
    print(c)
 }
 
// 类似if a != nil && b != nil
 if let c = a, let d = b {
    print(c)
    print(d)
 }



/*
 guard语句：
 guard 条件 else {
    // do something
    // return, break, continue, throw error
 }
 1.guard条件为false时，就会执行大括号里面的代码，为true的时候，跳过guard语句
 2.特别适合做“提前退出”
 3.guard括号里的的常量，变量也能在外层作用域中使用
 */

/*
 字符串插值
 */
var age: Int? = 10
//print("age is \(age)")// 会报错
// 下面三种都可以解决报错的问题
print("age is \(age!)")
print("age is \(String(describing: age))")
print("age is \(age ?? 0)")

// 多重可选项
/*
 var num1: Int? = 10
 var num2: Int?? = num1
 var num3: Int?? = 10
 print(num2 == num3) // true
 */

// 可以使用用lldb指令frame variable -R或者 fr v -R查看区别
var num1: Int? = nil
var num2: Int?? = num1
var num3: Int?? = nil
print(num2 == num3) // false
(num2 ?? 1) ?? 2  // 2
(num3 ?? 1) ?? 2  //1





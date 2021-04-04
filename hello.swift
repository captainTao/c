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


 /*
 swift包含了c和oc的所有基础数据类型，int, double, float, bool, string,
 除此之外，还提供了集合类型：Array, Set, Dictionary
 其次还增加了高阶数据类型：元组tuple
 增加了可选类型Optional
 增加了区间运算符a...b  a..<b
 */



/*****************************************************输入输出*/
// print函数
public func print(items: Any..., separator: String = default, terminator: String = default)

for x in 0...10{
    print("\(x) ", terminator: "")
}
print()


// 可选项输出：
var aa:Int? = 8
print(String(describing: aa))


// 用户输入
let theInput = readLine()


/*
 字符串插值
 */
var age: Int? = 10
//print("age is \(age)")// 会报错
// 下面三种都可以解决报错的问题
print("age is \(age!)")
print("age is \(String(describing: age))")
print("age is \(age ?? 0)")



/*****************************************************Int,String*/

 //一行定义多个变量，设置变量类型
 var x = 0.0, y = 0.0, z = 0.0
 var welcomeMessage: String
 var red, green, blue: Double


// 不同进制表示
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17


/*
如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp 的乘积：

1.25e2 表示 1.25 × 10^2，等于 125.0。
1.25e-2 表示 1.25 × 10^-2，等于 0.0125。
如果一个十六进制数的指数为 exp，那这个数相当于基数和2^exp 的乘积：

0xFp2 表示 15 × 2^2，等于 60.0。
0xFp-2 表示 15 × 2^-2，等于 3.75。
*/

// 在32位平台上，Int 和 Int32 长度相同。
// 在64位平台上，Int 和 Int64 长度相同。

// 一般不使用UInt
// 使用Int, 优先Double，其次Float, 类型推荐也会被推断为Double


// typealias:
// typealias newname = type
typealias Feet = Int
// 在swift中没有下面三个类型
typealias Byte = Int8    // 8bit
typealias Short = Int16 // short是2个byte,16bit; int是4byte,32bit
typealias Long = Int32 //？long应该是8个字节，64bit; 所以这里是Int64?

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

var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
emptyString.isEmpty                // isEmpty来判断是否为空

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

 // 对字符串进行遍历,会打印出单个字符
 for char in "Dog!" {
     print(char)
 }


// 连接字符串
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// 也可以使用+=
var instruction = "look over"
instruction += string2
// 也可以使用.append()
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

// 对字符串进行拆分数组
var badStart = """
one
two
"""
print(badStart.split(separator: "\n"))


/*****************************************************数组*/

// 初始化数组和字典：
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 初始化
let array = [Int](arrayLiteral: 1,2,4,5)
for i in array{
    print(i)
}

// 初始化相同的元素：
var list = Array (repeating: 3.0, count: 4)
var anotherList = Array(repeating: 2.5, count: 3)
// 数组可以直接相加来添加元素, 同理也可以使用+=
print(list + anotherList)
// 数组的长度.count
// .isEmpty来判断是否为空


// 初始化时候字面量标明类型：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
let catString: [Character] = []

// 通过for..in来遍历数组和字典

// shoppingList = [] 不能这样定义，必须制定类型？
// occupations = [:]


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
 
 // 通过enumerated()来遍历
 for (index, value) in list.enumerated() {
    print("list[\(index)] = \(value)")
 }

 // 可以通过下标来取值，最后一个元素后面允许有逗号
 let names = ["Tony", "Jack", "Sparrow", "QiQi", "Jony"]
 for name in names[0...3]{ // for name in names{..}
     print(name)
 }

 // 0...3    [0,3]
 // 0..<3    [0,3)


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
 
 // 单侧区间也可以用来赋值
 let range = ...5
 range.contains(7)   // false
 range.contains(4)   // true
 range.contains(-1)  // true


 // 添加
 names.append("blue paint")
 names.insert(ele, at index)

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
 
 
/*****************************************************标签语句*/
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
 
 /*****************************************************字典,set 和元组*/
 /*
   使用自定义的类型作为集合值的类型或者是字典键的类型，需要遵循Hashable协议
   一个字典的 Key 类型必须遵循 Hashable 协议，就像Set的值类型。
 */ 


 // []可以创建数组和字典，最后一个元素后面都允许有个逗号，
 let num = [1,2,3]
 var names = ["i","j"]
 let dic = ["one":1, "two":2]

 
 // 创建为空字典：
 var namesOfIntegers = [Int: String]()

 // 字典为无序
 let dict = ["a": 1, "b": 2, "c": 3]
 for (key, value) in dict {
     print(key + "===" , value)
     print("\(key) = \(value)")
 }
 
/*
字典方法
.isEmpty()
.count

设置value：
dict[key] = value   // 返回value
dict.updateValue(Value, forKey: key) // 返回旧值，如果没有旧值返回nil

移除
dict[key] = nil
dict.removeValue(forKey: key) // 返回value/nil

dict.keys
dict.values
*/


// 求出一个二级字典中的最大值，字典是无序的
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)






// Set:
// --与数组的区别是：没有重复的数据
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []
// letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] // 也可以通过字面量来推断


/*
set.insert("xx")
set.count
set.isEmpty
set.contains
set.remove
for..in 遍历
set.sorted


交，a.intersection(b)
并，a.union(b)
对称差分，a.symmetricDifference(b)
减去， a.subtracting(b)


==                 两个集合的元素是否相等

.isSubset(of:)     为子集
.isSuperset(of:)   为父集

.isStrictSubset(of:)       为子集且不相等
.isStrictSuperset(of:)     为父集且不相等

.isDisjoint(with:)   是否没有交集

*/



// oc不支持元组，swift支持 
// 元组数据可以为不同类型
let http404Error = (404, "Not Found")
// 忽略的部分用下划线
let (justTheStatusCode, _) = http404Error
print("justTheStatusCode：\(justTheStatusCode)")


let t = (1,3,5)
t.0  // 通过.取值
t.1

// 你可以在定义元组的时候给单个元素命名,可以用名字来取值
let http200Status = (statusCode: 200, description: "OK") // 字典用的是[]
http200Status.description


/*****************************************************循环和条件*/

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


// 对于字符的可选类型，条件转换可以用逗号
 let numbers = ["10", "20", "30", "-10", "50", "-kk30"]
 var sum = 0
 var index = 0
 while let num = Int(numbers[index]), num > 0 {
     sum += num
     index += 1
 }
 print(sum)

/*
控制转移语句：
continue
break
fallthrough
return
throw
*/


/*
 if #available (平台名称 版本号, ..., *)
 平台名： iOS，macOS，watchOS 和 tvOS
 最后一个参数，*，是必须的，表示：版本号高于你的设备指定的最低版本时，if 语句的代码块将会运行
 */

if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
    print("hahha")
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
    print("hehehe")
}

/*****************************************************四则，三目，空合，区间*/


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

/*
 var a = 0
 a+=2
 ==
 !=
 < >
 === 恒等
 !== 不恒等
 */


//元组最多能比较7个元素
let at = (2, "abc")
let bt = (2, "bcd")
at > bt



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


/*****************************************************函数*/
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



/*****************************************************函数参数*/

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



/*****************************************************函数类型*/
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


/*****************************************************函数闭包*/
var numbers = [20, 19, 7, 12]
// numbers.map({
//     (number: Int) -> Int in
//     let result = 3 * number
//     return result
// })


let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)


// 通过参数位置
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// [20, 19, 12, 7]



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


// 闭包表达式语法
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// 因为可以类型推断，上面的表达式可以写成：
//省略类型，箭头，括号
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } ) 
//单行表达式可以省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 } )
//通过运算符方法
reversedNames = names.sorted(by: >)


/*
swift跟java刚好相反：

s1-s2  (s1>s2)     
swift:降序   java: 升序

*/


/*
尾随闭包:
---------
闭包表达式可以放在函数sort的外面：
reversedNames = names.sorted() { $0 > $1 }
如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
reversedNames = names.sorted { $0 > $1 }

例如下面map函数，后没有()，直接跟尾随闭包
*/
 
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        print(output)
        number /= 10
    } while number > 0
    return output
}




// 值捕获
// 闭包是引用类型
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() //10

incrementByTen() //20

incrementByTen() //30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() //7

incrementByTen() //40

incrementBySeven() //14



/*
 逃逸闭包:
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
 在使用闭包参数名之前标注 @escaping，指明这个闭包是允许“逃逸”出这个函数的。
 逃逸闭包显式调用self
 非逃逸闭包隐式调用self
 */

var completionHandlers: [() -> Void] = []

// 返回函数闭包
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)  
}

// 返回函数值
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure() 
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } //显式调用self
        someFunctionWithNonescapingClosure { x = 200 }  //隐式调用self
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) //200


completionHandlers.first?()
print(instance.x) //100



// 自动闭包：
// ——-------
// 闭包如何延迟求值：
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) //5

let customerProvider = { customersInLine.remove(at: 0) } //它的类型为 () -> String，不是String
print(customersInLine.count) //5

print("Now serving \(customerProvider())!") //Now serving Chris!
print(customersInLine.count) //4


// 将闭包用作参数传递
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } ) //Now serving Alex


// 参数标记为 @autoclosure 来接受一个自动闭包。
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) //Now serving Ewa!,这儿省略了大括号



// 如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。
// customersInLine = ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.") // Collected 2 closures

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
//Now serving Barry!
//Now serving Daniella!



/*****************************************************函数重载和内联函数*/
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




/*****************************************************枚举类型*/

// 枚举类型：
// 与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。比如下面0,1,2,3
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
// 当使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为 0。
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

let testSeason = Season1(rawValue: 5) //通过原始值创建变量，testSeason为可选类型Season1？


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




/*****************************************************类*/

// 类
class Shape {
    var numberOfSlides = 0
    // 初始化方法，初始化的时候，需要传入初始化参数
    // 初始化方法，也是构造方法
    init(_ numberOfSliders: Int) {
        self.numberOfSlides = numberOfSliders
    }
    deinit {
        // 对象释放之前的一些清理工作
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




/*****************************************************结构体和类*/

/*
结构体和类对比
Swift 中结构体和类有很多共同点。两者都可以：

定义属性用于存储值
定义方法用于提供功能
定义下标操作用于通过下标语法访问它们的值
定义构造器用于设置初始值
通过扩展以增加默认实现之外的功能
遵循协议以提供某种标准功能
更多信息请参见 属性、方法、下标、构造过程、扩展 和 协议。

与结构体相比，类还有如下的附加功能：

继承允许一个类继承另一个类的特征
类型转换允许在运行时检查和解释一个类实例的类型
析构器允许一个类实例释放任何其所被分配的资源
引用计数允许对一个类的多次引用
*/

struct SomeStructure {
    // 在这里定义结构体
}
class SomeClass {
    // 在这里定义类
}

/*
使用 UpperCamelCase 这种方式来命名类型（如这里的 SomeClass 和 SomeStructure）
以便符合标准 Swift 类型的大写命名风格（如 String，Int 和 Bool）。

请使用 lowerCamelCase 这种方式来命名属性和方法（如 frameRate 和 incrementCount），以便和类型名区分。

*/

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String? //name会被默认赋值为nil
}

// 创建实例：
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 获取属性：
someResolution.width
someVideoMode.resolution.width
// 赋值
someVideoMode.resolution.width = 1280
// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
let vga = Resolution(width: 640, height: 480)

/*
值类型:

实际上，Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，其底层也是使用结构体实现的。

Swift 中所有的结构体和枚举类型都是值类型。
*/


/*
引用类型：

结构体重新赋值给另一个结构体会复制一份，
而类中一对象重新赋值给另外一个对象，则会共享一个内存，修改值也会改变之前的值

是三个等号
相同（===）表示两个类类型（class type）的常量或者变量引用同一个类实例。
不相同（!==）
等于(==) 表示两个实例的值“相等”或“等价”，判定时要遵照设计者定义的评判标准。
*/



/*****************************************************属性*/

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 2 // 不能修改length, 因为前面为let

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6  // 不能修改rangeOfFourItems，因为赋值给了常量let

// 但let后面是个引用类型的话（类实例对象），是可以修改的，因为let记录的是引用地址，不是对象的值




// 延时加载存储属性lazy:
// -------------------
/*
属性声明前加lazy:
必须使用var字段，因为let在构造之前必须有值

全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
局部范围的常量和变量从不延迟计算。

*/ 
// 




class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // ...这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()  
    var data = [String]()
    // ...这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建
print(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了
// 输出“data.txt”


// 计算属性：
// setter和getter方法
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        /*
         get {
             let centerX = origin.x + (size.width / 2)
             let centerY = origin.y + (size.height / 2)
             return Point(x: centerX, y: centerY)
         }
         set(newCenter) {
             origin.x = newCenter.x - (size.width / 2)
             origin.y = newCenter.y - (size.height / 2)
         }
         */
        // 简化版：单一表达式可以省略return
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        // 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print(initialSquareCenter)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 打印“square.origin is now at (10.0, 10.0)”



/*
只读计算属性:
只有get,无set
只读计算属性的声明可以去掉 get 关键字和花括号：
*/ 
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    // 这儿省略了get,也可以省略掉return
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”


/*
属性观察器：

willSet 在新的值被设置之前调用
didSet 在新的值被设置之后调用

在父类初始化方法调用之后，在子类构造器中给父类的属性赋值时，会调用父类属性的 willSet 和 didSet 观察器。
而在父类初始化方法调用之前，给子类的属性赋值时不会调用子类属性的观察器。 //没读懂

*/

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) { // 这儿不用参数的话，默认形参是newValue
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步



/*
属性包装器：
*/
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
// 打印 "10"

rectangle.height = 24
print(rectangle.height)
// 打印 "12"


/*
上面TwelveOrLess的扩展版SmallNumber，可以设定最大值和被包装值
*/ 
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// 不带参数
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// 0 0


// 一个参数的初始化两种方式
struct UnitRectangle {
    @SmallNumber var height: Int = 13
    @SmallNumber(wrappedValue: 8) var width: Int
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// 8 12


// 两个参数初始化
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 80) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 90) var width: Int
    // 也可以这样赋值：
    // @SmallNumber(maximum: 9) var width: Int = 2
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// 2 3

narrowRectangle.height = 85
narrowRectangle.width = 85
print(narrowRectangle.height, narrowRectangle.width)
// 80 85



/*
属性包装器呈现另外一个值：

这个没太懂怎么关联出另外一个值？？？
*/ 
@propertyWrapper
struct SmallNumber {
    private var number = 0
    var projectedValue = false
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.someNumber)// 4
print(someStructure.$someNumber)
// 打印 "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// 打印 "true"

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

var testsize = SizedRectangle()
testsize.resize(to: Size.small)
// 直接返回是否被修改过




// static 存储型属性：
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


print(SomeStructure.storedTypeProperty)
// 打印“Some value.”
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 打印“Another value.”
print(SomeEnumeration.computedTypeProperty)
// 打印“6”
print(SomeClass.computedTypeProperty)
// 打印“27”



// 声道模拟音量
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)


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


/*****************************************************可选项*/

/*
Swift 的nil 和 Objective-C 中的nil 并不一样。
在 Objective-C 中，nil 是一个指向不存在对象的指针。
在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
*/

if convertedNumber != nil {
    print("convertedNumber: \(convertedNumber!).")
}

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


// 解包：
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


/*****************************************************可选项值绑定*/
// 可选值绑定两种方式: 
/*
if let ..else

optional ?? defaultValue

*/
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


/*****************************************************空合并运算*/
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



/*****************************************************异常处理*/
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



// 错误处理：

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}


do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


// 另一种处理错误的方式使用 try? 将结果转换为可选的。
// 如果函数抛出错误，该错误会被抛弃并且结果为 nil。否则，结果会是一个包含函数返回值的可选值。

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// 断言：

// 当条件为false的时候，才执行，关键词有: guard, assert, precondition 


// assert:

// 因为 age < 0，所以断言会触发
// 当表达式的结果为 false 的时候这条信息会被显示：
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
assert(age >= 0) // 不需要断言信息就可以这么写，后面忽略掉



// 使用 assertionFailure(_:file:line:) 函数来表明断言失败了，直接抛出错误信息。
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}



// precondition:

// 当表达式的结果为 false 的时候这条信息会被显示：
// 在一个下标的实现里...
precondition(index > 0, "Index must be greater than zero.")


// 同理：preconditionFailure(_:file:line:) 方法来表明出现了一个错误，
// 例如，switch 进入了 default 分支，但是所有的有效值应该被任意一个其他分支（非 default 分支）处理。


/*
注意：

如果你使用 unchecked 模式（-Ounchecked）编译代码，先决条件将不会进行检查。编译器假设所有的先决条件总是为 true（真），他将优化你的代码。然而，fatalError(_:file:line:) 函数总是中断执行，无论你怎么进行优化设定。

你能使用 fatalError(_:file:line:) 函数在设计原型和早期开发阶段，这个阶段只有方法的声明，但是没有具体实现，你可以在方法体中写上 fatalError("Unimplemented")作为具体实现。因为 fatalError 不会像断言和先决条件那样被优化掉，所以你可以确保当代码执行到一个没有被实现的方法时，程序会被中断。
*/



// 用Error协议来表示错误：
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}



// defer：
// defer是函数最后执行的代码，无论函数是否抛错，都会被执行
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    // defer是函数最后执行的代码，无论函数是否抛错，都会被执行
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



/*****************************************************协议和扩展*/

// 类、枚举和结构体都可以遵循协议。
//
// protocol: //类似java的接口

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}


// extension: //来为现有的类型添加功能
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)



// 泛型：
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}


// 可以通过where来限定协议，父类，是否相等
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
makeArray(repeating: "knock", numberOfTimes: 4)
//: [Previous](@previous)
//: [Next](@next)
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



enum Beverage: CaseIterable {  //遵循CaseIterable协议
    case coffee, tea, juice
}
// Beverage.allCases可以访问Beverage枚举所有成员的集合
let numberOfChoices = Beverage.allCases.count //3
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee, tea, juice




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


// 原始值（Raw Values），需要是相同类型
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



enum TestEnum1 {
    case test
}
MemoryLayout<TestEnum1>.stride // 0 分配到的内存,因为初始化没有指定test类型
MemoryLayout<TestEnum1>.size // 1 实际用到的内存大小
MemoryLayout<TestEnum1>.alignment // 1 对齐参数



enum TestEnum {
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
// e的存储形式：
// 01 00 00 00 00 00 00 00
// 02 00 00 00 00 00 00 00
// 03 00 00 00 00 00 00 00
// 00
// 00 00 00 00 00 00 00

e = .test2(4, 5)
// e的存储形式：
// 04 00 00 00 00 00 00 00
// 05 00 00 00 00 00 00 00
// 00 00 00 00 00 00 00 00
// 01
// 00 00 00 00 00 00 00

// 大端存储：
//
// 小端存储：高高低低
// 0x00 00 00 00 00 00 01

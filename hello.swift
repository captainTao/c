// print函数
public func print(items: Any..., separator: String = default, terminator: String = default)

for x in 0...10{
    print("\(x) ", terminator: "")
}
print()
// 用户输入
let theInput = readLine()

typealias newname = type
typealias Feet = Int


let a = 1
let x:Double = 1
let y:Double = 1.0

var i = 1
var name: String

var Name: String?

let str = "x+y= "
let xy = x + y

print("str + String(xy)")
print("x + y = \(x + y)")

let num = [1,2,3]
var names = ["i","j"]
let dic = ["one":1, "two":2]

let t = (1,3,5)
t.0
t.1


//赋值
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
repeat {
    i += 1
} while i < 100
print(i)

// if else ..

// if else if ..



// switch:
// 1.不存在隐式的贯穿：不用加break,这个是q跟其他语言的区别
// 2.区间匹配
let someInt = 3
switch someInt {
case 0...3:
    print("0...3")
case 3...10:
    print("3...10")
default:
    print("default")
}

// 3.支持y元组
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
default:
    print("other")
}

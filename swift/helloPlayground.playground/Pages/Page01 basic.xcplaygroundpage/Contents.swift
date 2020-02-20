//import UIKit

//var str = "Hello, playground"
//print("str")
//print(str)

/*
 let z = 1
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

*/

/*
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
9/4
 
 */


// 组合运算符，比较运算符
//var a = 0
//a+=2
//==
//!=
//< >



/*
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
*/



/*
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
 */

// continue, break用在for语句中
//let numbers = [1,2,3,4,5,6,7,8]
//for num in numbers{
//    if num == 5{
//        continue// break
//    }
//    print(num, terminator: "")
//}
// fallthrough用在switch中
// return用在函数中
// throw用在try中


/*
// 函数
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

// 非固定参数
func sumof(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
print(sumof(numbers: 42, 597, 12))
print(sumof())

*/

/*
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
 */

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

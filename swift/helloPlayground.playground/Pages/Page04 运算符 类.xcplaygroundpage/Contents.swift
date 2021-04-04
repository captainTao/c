//: [Previous](@previous)

//: [Next](@next)



//赋值
let f = 5
var d = 6
d = f

let (x, y) = (1, 2)
x
y

// if条件后面的小括号可以省略：
// if后面只能是bool类型，不能放值，比如if 3 {...}
if x == y {
    
}

// 四则运算
//+ - * /

let i = -1
-i
+i
9%4
9/4
 

// 组合运算符，比较运算符
/*
 var a = 0
 a+=2
 ==
 !=
 < >
 ===
 !==
 */


let at = (2, "abc")
let bt = (2, "bcd")
at > bt
// 元组最多能比较7个元素
 
// 元组取数据
at.1
at.0

// 可以直接通过key来取值
 let httpstatus = (statusCode: 200, discription: "OK")
 print("The status code is \(httpstatus.statusCode)")
 

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
// 开区间
for id in 1..<5 {
    print(id)
}
// 闭区间
for id in 1...3 {
    print(id)
}



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
// print(shape?.Description())
print(shape?.Description() ?? "No Description!")




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


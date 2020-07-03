
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

//var shape = Shape(3)
//shape.numberOfSlides = 5
//print(shape.Description())


// 可选链式调用
var shape: Shape? = Shape(3)
shape = nil
// 为可选类型的时候，对象后面要加?
// print(shape?.Description())
print(shape?.Description() ?? "No Description!")

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

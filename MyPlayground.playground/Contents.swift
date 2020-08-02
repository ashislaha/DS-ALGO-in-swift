import UIKit

var view1: UIView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 10)))
var view2: UIView = UIView(frame: .zero)
var view3: UIView = UIView()
var view4: UIView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))

view4.isHidden = true

let stack = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
[view1, view2, view3, view4].forEach { stack.addArrangedSubview($0) }


print("subviews count = ", stack.subviews.count)
print("arrange subviews count = ",stack.arrangedSubviews.count)

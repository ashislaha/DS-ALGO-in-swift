//: Playground - noun: a place where people can play

/*
  calculate the sum of all the leaf nodes in a binary tree
 
 */


class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(val : Int) {
        data = val
        left = nil
        right = nil
    }
}

class BinaryTree {

    var root : Node?
    var sum : Int = 0
    
    // calculate the sum
    public func sumLeaves(root : Node?) {
        
        guard let root = root , let rootData = root.data else { return }
        
        if root.left == nil && root.right == nil {
            sum += rootData
        } else {
            sumLeaves(root: root.left)
            sumLeaves(root: root.right)
        }
    }
}



let bt = BinaryTree()
bt.root = Node(val: 1)
bt.root?.left = Node(val: 2)
bt.root?.right = Node(val: 3)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.right = Node(val: 5)
bt.root?.right?.left = Node(val: 6)
bt.root?.right?.right = Node(val: 7)
bt.root?.right?.right?.right = Node(val: 10)

bt.sumLeaves(root: bt.root)
print("Total Leaf sum = \(bt.sum)")






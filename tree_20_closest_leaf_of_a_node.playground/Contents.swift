//: Playground - noun: a place where people can play

/*
 
 Given a tree : find out the closet leaf node distance from a given node
 
         A
        / \
       B   C
          / \
         E   F
        / \  /\
       G   H I J
       /   / /  \
      M   N  K   L
 
 closet(C) = B distance = 2
 closest(E) = (M,N) distance = 2
 
 */

class Node {
    var data : String?
    var left : Node?
    var right : Node?
    
    init(val : String) {
        data = val
        left = nil
        right = nil
    }
}

class BinaryTree {
    
    var root : Node?
    var ancestor : [Node] = []
    
    // print the tree
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? "")
        inorder(root: root.right)
    }
    
    // finding into the descendents
    public func closetDown(root : Node?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil { return 0 } // leaf node
        return 1 + min(closetDown(root:root.left), closetDown(root: root.right))
    }
    
    // find the closest of a node
    public func closest(root : Node? , key : String, index : Int) -> Int {
        guard let root = root else { return 0 }
        
        // check that the "key" is the root node or not
        if let data = root.data, data == key {
            // find into the descedents
            var downCount = closetDown(root: root)
            
            // find into the ancestors
            for i in stride(from: index-1, through: 0, by: -1){
                downCount = min(downCount, index - i + closetDown(root: ancestor[i]))
            }
            return downCount
        } else {
            // key != data
            ancestor.append(root)
            return 1 + min (closest(root: root.left, key: key, index: index+1), closest(root: root.right, key: key, index: index+1))
        }
    }
}

// create a binary tree
let bt = BinaryTree()
bt.root = Node(val: "A")
bt.root?.left = Node(val: "B")
bt.root?.right = Node(val: "C")
bt.root?.right?.left = Node(val: "E")
bt.root?.right?.right = Node(val: "F")
bt.root?.right?.left?.left = Node(val: "G")
bt.root?.right?.left?.right = Node(val: "H")
bt.root?.right?.right?.left = Node(val: "I")
bt.root?.right?.right?.right = Node(val: "J")
bt.root?.right?.left?.left?.left = Node(val: "M")
bt.root?.right?.left?.right?.left = Node(val: "N")
bt.root?.right?.right?.left?.left = Node(val: "K")
bt.root?.right?.right?.right?.right = Node(val: "L")

// print the inorder
bt.inorder(root: bt.root)

// closet node of BT
var key = "C"
print("\nCloset of \(key) : \(bt.closest(root: bt.root, key: key, index: 0))")
key = "E"
print("\nCloset of \(key) : \(bt.closest(root: bt.root, key: key, index: 0))")
key = "A"
print("\nCloset of \(key) : \(bt.closest(root: bt.root, key: key, index: 0))")


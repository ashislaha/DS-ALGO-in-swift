//: Playground - noun: a place where people can play


/*
     find the minimum height of a tree
             1
            / \
           2   3
          / \  /\
         4   5 6 7
        /     /   \
       8     11    9
        \
         10
 
 min height = 3 (1->3->6) or (1->2->5)
 
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
    
    // find min height
    public func findMinHeight(root : Node?) -> Int {
        guard let root = root else { return 0 }
        
        let left = findMinHeight(root: root.left)
        let right = findMinHeight(root: root.right)
        
        return min(left, right) + 1
    }
    
   // inorder traversal
    public func preOrder(root : Node?) {
        guard let root = root else { return }
        print(root.data ?? -1)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
}

let bt = BinaryTree()
bt.root = Node(val: 1)
bt.root?.left = Node(val: 2)
bt.root?.right = Node(val: 3)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.right = Node(val: 5)
bt.root?.right?.left = Node(val: 6)
bt.root?.right?.left?.left = Node(val: 11)
bt.root?.right?.right = Node(val: 7)
bt.root?.left?.left?.left = Node(val: 8)
bt.root?.left?.left?.left?.right = Node(val: 10)
bt.root?.right?.right?.right = Node(val: 9)

// print the tree
bt.preOrder(root: bt.root)

let minHeight = bt.findMinHeight(root: bt.root)
print("Min Height = \(minHeight)")









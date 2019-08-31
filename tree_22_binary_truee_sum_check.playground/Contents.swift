import UIKit

class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(val: Int) {
        value = val
    }
}

class BinaryTree {
    var root: Node?
    
    // given as an input
    public func createTree1() {
        root = Node(val: 10)
        
        root?.left = Node(val: 5)
        root?.right = Node(val: 4)
        
        root?.left?.left = Node(val: 3)
        
        root?.left?.left?.left = Node(val: 1)
        root?.left?.left?.right = Node(val: 2)
        
        root?.right?.left = Node(val: 1)
        root?.right?.right = Node(val: 2)
    }
    
    public func createTree2() {
        root = Node(val: 10)
        
        root?.left = Node(val: 5)
        root?.right = Node(val: 4)
        
        root?.left?.left = Node(val: 7)
        
        root?.left?.left?.left = Node(val: 3)
        root?.left?.left?.right = Node(val: 2)
        
        root?.right?.left = Node(val: 2)
    }
    
    func checkSum(root: Node?) -> Bool {
        guard let root = root else { return true }
        
        if root.value >= (root.right?.value ?? 0) + (root.left?.value ?? 0) {
            return checkSum(root: root.left) && checkSum(root: root.right)
        } else {
            return false
        }
    }
}

// test
let binaryTree = BinaryTree()

binaryTree.createTree1()
let output1 = binaryTree.checkSum(root: binaryTree.root)
print(output1)

binaryTree.createTree2()
let output2 = binaryTree.checkSum(root: binaryTree.root)
print(output2)




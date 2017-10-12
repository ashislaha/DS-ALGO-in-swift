//: A UIKit based Playground for presenting user interface
  
/*
     print a tree vertical wise
 
             1
         2      3
     4      5 6    7
 
 printing = [ 4 ] ,  [ 2 ] , [1, 5, 6], [3] , [7]
 
 the concept is calculating the horizontal distance from root node
 
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

class Value {
    var min : Int = 0
    var max : Int = 0
}

class BinaryTree {
    
    var root : Node?
    var val = Value()
    
    // calculate minmax based on horizontal distance from root node
    public func getMinMax(root : Node? , min : Value, max : Value, hd : Int ) {
        guard let root = root else { return }
        
        if hd < min.min { min.min = hd }
        else if hd > max.max { max.max = hd }
        getMinMax(root: root.left, min: min, max: max, hd: hd-1)
        getMinMax(root: root.right, min: min, max: max, hd: hd+1)
    }
    
    // print vertical lines nodes
    public func printVerticalLine(root : Node? , vertical_line : Int, hd : Int) {
        
        guard let root = root  else { return }
        
        if vertical_line == hd { print(root.data ?? -1) }
        printVerticalLine(root: root.left, vertical_line: vertical_line, hd: hd-1)
        printVerticalLine(root: root.right, vertical_line: vertical_line, hd: hd+1)
    }
    
    //print Verical look of entire tree
    public func printEntireTree(root : Node?) {
        guard let root = root  else { return }
        
        // get min max
        getMinMax(root: root, min: val, max: val, hd: 0) // hd = 0 for root node
        
        // loop from min to max
        for i in val.min...val.max {
            printVerticalLine(root: root, vertical_line: i, hd: 0)
        }
    }
    
    //preorder traversal
    public func preorder(root : Node?){
        guard let root = root else { return }
        print(root.data ?? -1 , terminator : " ")
        preorder(root: root.left)
        preorder(root: root.right)
    }
}

let bt = BinaryTree()
bt.root = nil

// insert some nodes into binary tree
bt.root = Node(val: 1)
bt.root?.left = Node(val: 2)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.right = Node(val: 5)
bt.root?.right = Node(val: 3)
bt.root?.right?.left = Node(val: 6)
bt.root?.right?.right = Node(val: 7)

// print the tree
bt.preorder(root: bt.root)

bt.printEntireTree(root: bt.root)







//: Playground - noun: a place where people can play

/*
 
 construct a binary tree from inorder and preorder traversal
 let inOrder = [4,2,5,1,6,3]
 let preOrder = [1,2,4,5,3,6]
 
      1
     / \
    2   3
   / \  /
  4  5  6
 
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
    var preIndex : Int = 0
    
    // create a binary tree
    public func createTree(In :[Int], Pre : [Int], start : Int, end : Int) -> Node? {
        
        guard In.count > 0 && start <= end else { return nil }
        
        // create root node
        let root = Node(val: Pre[preIndex])
        preIndex += 1
        
        // find root into inorder traversal array
        let inIndex = search(In: In, start: start, end: end, root: root)
        
        // divide into left and right tree
        root.left = createTree(In: In, Pre: Pre, start: start, end: inIndex-1)
        root.right = createTree(In: In, Pre: Pre, start: inIndex+1, end: end)
        return root
    }
    
    public func search(In : [Int], start : Int, end : Int, root : Node) -> Int {
        guard let data = root.data else { return 0 }
        var i = start
        while i < end {
            if data == In[i] { break }
            i += 1
        }
        return i
    }
    
    //print tree
    public func postOrder(root : Node?) {
        guard let root = root, let rootData = root.data else { return }
        postOrder(root: root.left)
        postOrder(root: root.right)
        print(rootData)
    }
    
    public func preOrder(root : Node?) {
        guard let root = root, let rootData = root.data else { return }
        print(rootData)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
}

let bt = BinaryTree()
let inOrder = [4,2,5,1,6,3]
let preOrder = [1,2,4,5,3,6]
bt.root = bt.createTree(In: inOrder, Pre: preOrder, start: 0, end: inOrder.count-1)
print("PostOrder :")
bt.postOrder(root: bt.root)
print("PreOrder :")
bt.preOrder(root: bt.root)





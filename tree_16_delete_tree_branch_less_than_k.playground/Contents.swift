//: Playground - noun: a place where people can play

/*
     Delete a tree having branch length  value less than k
 
         1
       /    \
     2        3
   /   \        \
  4     5        6
 /               /
7               8
 
 k = 4 , 1->2->5 will be deleted because length is 3 . SO node (5) will be deleted.
 
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
    
    // check the level of the node & if level < k then delete
    public func deleteUnderLevel(root : Node? , level : Int, k : Int) -> Node? {
        guard let root = root , let rootData = root.data else { return nil }
        
        deleteUnderLevel(root: root.left, level: level+1, k: k)
        deleteUnderLevel(root: root.right, level: level+1, k: k)
        
        if root.left == nil && root.right == nil && level < k {
            print("deleted item : \(rootData)")
            return nil
        }
        return root
    }
    
    // inorder traversal
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? -1)
        inorder(root: root.right)
    }
}

let bt = BinaryTree()
bt.root = Node(val: 1)
bt.root?.left = Node(val: 2)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.right = Node(val: 5)
bt.root?.left?.left?.left = Node(val: 7)
bt.root?.right = Node(val: 3)
bt.root?.right?.right = Node(val: 6)
bt.root?.right?.right?.left = Node(val: 8)

// Inorder traversal
print("Before Delete inorder:")
bt.inorder(root: bt.root)

// delete the k = 4
bt.root = bt.deleteUnderLevel(root: bt.root, level: 1, k: 4)
//bt.inorder(root: bt.root)









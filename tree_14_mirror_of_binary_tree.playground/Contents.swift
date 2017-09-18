//: Playground - noun: a place where people can play

/*
create a mirror of a binary tree .
 
     1               1
    / \             / \
   2   3   ->      3   2
  / \                  /\
 4  5                 5  4
 
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
    
    // create a mirror tree of BT
    public func mirror(root : Node?) -> Node? {
        guard let root = root else { return nil }
        
        let left = mirror(root: root.left)
        let right = mirror(root: root.right)
        
        // swap left and right
        root.left = right
        root.right = left
        return root
    }
    
    // inorder traversal of tree
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
bt.root?.right = Node(val: 3)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.right = Node(val: 5)

print("Inorder traversal :")
bt.inorder(root: bt.root)

print("Inorder after Mirroring :")
bt.mirror(root: bt.root)
bt.inorder(root: bt.root)



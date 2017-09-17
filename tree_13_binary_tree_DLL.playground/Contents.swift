//: Playground - noun: a place where people can play

/*
  Convert a Binary tree into Double linked list which shold be in inorder fashion.
         1
        / \
       2   3
      / \  /
     4   5 6
 
 inorder - [4,2,5,1,6,3]
 
 */


class LinkedNode {
    var data : Int?
    var prev : LinkedNode?
    var next : LinkedNode?
    
    init(val : Int) {
        data = val
        next = nil
        prev = nil
    }
}

class TreeNode {
    var data : Int?
    var left : TreeNode?
    var right : TreeNode?
    
    init(val : Int) {
        data = val
        left = nil
        right = nil
    }
}


class BinaryTree {
    
    var root : TreeNode?
    var inorder : [Int] = []
    var prev : TreeNode?
    
    //MARK:- Approach 1 : BASIC BRUTE FORCE APPROACH :
    
    // do inorder traversal and return the node in each step
    public func inorder(root : TreeNode?) {
        guard let root = root, let rootData = root.data else { return }
        
        inorder(root: root.left)
        inorder.append(rootData)
        inorder(root: root.right)
    }
    
    // create a Double linked list based on inorder array
    public func createDoubleLinkedList(arr : [Int]) -> LinkedNode? {
        guard arr.count > 0 else { return nil }
        var root = LinkedNode(val: arr.first ?? -1)
        
        for i in 1..<arr.count {
            let node = LinkedNode(val: arr[i])
            node.next = root
            node.prev = root.prev
            root.prev = node
            root = node
        }
        return root
    }
    
    // print the list
    public func printList(root : LinkedNode?) {
        guard let root = root else { return }
        var temp : LinkedNode? = root
        while temp != nil {
            print(temp?.data ?? -1)
            temp = temp?.next
        }
    }
    
    //MARK:- Approach 2 : Using fixing left and right pointers
    
    public func convertTreeIntoDLL(root : TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        fixingLeftPointers(root: root)
        return fixingRightPointers(root: root)
    }
    
    // fixing prev (left) pointers of tree
    public func fixingLeftPointers(root : TreeNode?) {
        guard let root = root else { return }
        
        // traverse inorder and change the left pointer
        fixingLeftPointers(root: root.left)
        root.left = prev
        prev = root
        fixingLeftPointers(root: root.right)
    }
    
    // fixing the next (right) pointers of tree
    public func fixingRightPointers(root : TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        // start from last node of DLL
        var temp : TreeNode? = root
        while temp?.right != nil {
            temp = temp?.right
        }
        
        // change the right pointer of each node
        while temp != nil && temp?.left != nil {
            let leftNode = temp?.left
            leftNode?.right = temp
            temp = leftNode
        }
        
        return temp
    }
    
    // print the DLL
    public func printDLL(root : TreeNode?) {
        guard let root = root else { return }
        
        var tempNode : TreeNode? = root
        while let temp = tempNode {
            print(temp.data ?? -1)
            tempNode = temp.right
        }
    }
    
    //MARK:- Approach 3 : Fixing left and right at the same time : more easiest approach
    
    var previous : TreeNode?
    var head : TreeNode?
    
    public func BTtoDLL(root : TreeNode?) {
        guard let root = root else { return }
        BTtoDLL(root: root.left)
        
        if previous == nil { // update the head node of DLL
            head = root
        } else { // update pointers
            previous?.right = root
            root.left = previous
        }
        // update the previous pointer
        previous = root
        
        BTtoDLL(root: root.right)
    }
}

let bt = BinaryTree()
bt.root = TreeNode(val: 1)
bt.root?.left = TreeNode(val: 2)
bt.root?.left?.left = TreeNode(val: 4)
bt.root?.left?.right =  TreeNode(val: 5)
bt.root?.right = TreeNode(val: 3)
bt.root?.right?.left = TreeNode(val: 6)

// Approach 1 :
bt.inorder(root: bt.root)
if let linkedRoot = bt.createDoubleLinkedList(arr: bt.inorder.reversed()) {
    print("Print the DLL in approach 1 :")
    bt.printList(root: linkedRoot)
}

// Approach 2
let rootNode = bt.convertTreeIntoDLL(root: bt.root)
print("\nPrint the DLL in approach 2 :")
bt.printDLL(root: rootNode)

// Approach 3 :
bt.root = nil
bt.root = TreeNode(val: 10)
bt.root?.left = TreeNode(val: 20)
bt.root?.left?.left = TreeNode(val: 40)
bt.root?.left?.right =  TreeNode(val: 50)
bt.root?.right = TreeNode(val: 30)
bt.root?.right?.left = TreeNode(val: 60)

bt.BTtoDLL(root: bt.root)
print("\nPrint the DLL in Approach 3 :")
bt.printDLL(root: bt.head)




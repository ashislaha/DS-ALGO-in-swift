//: Playground - noun: a place where people can play

/*
 
 create a Balanced BST like AVL tree from Normal BST.
 
 - Do Inorder traversal & stored into an array. O(n) time
 - Create Balanced BST from Sorted Array using recusrion. O(n) time.
 
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

class BST {
    
    var root : Node?
    var inorderArr : [Int] = []
    
    // insertion of BST
    public func insertion(root : Node?, data : Int) -> Node {
        guard let root = root , let rootData = root.data else { return Node(val: data) }
        
        if data < rootData {
            root.left = insertion(root: root.left, data: data)
        } else if data > rootData {
            root.right = insertion(root: root.right, data: data)
        }
        return root
    }
    
    // inorder traversal
    public func inorder(root : Node?) {
        guard let root = root  else { return }
        inorder(root: root.left)
        inorderArr.append(root.data ?? -1)
        inorder(root: root.right)
    }
    
    // preorder of BST
    public func preOrder(root : Node?) {
        guard let root = root else { return }
        print(root.data ?? -1)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    
    // convert into balanced BST from inorder array
    public func convertIntoBalancedBST(arr : [Int], low : Int, high : Int) -> Node? {
        guard arr.count > 0 && low <= high else { return nil }
        
        let middle = (low + high) / 2
        let root = Node(val: arr[middle])
        root.left = convertIntoBalancedBST(arr: arr, low: low, high: middle-1)
        root.right = convertIntoBalancedBST(arr: arr, low: middle+1, high: high)
        return root
    }
    
}

let bst = BST()
bst.root = nil

let arr = [1,2,3,4]
for item in arr {
    bst.root = bst.insertion(root: bst.root, data: item)
}
bst.inorder(root: bst.root)
print(bst.inorderArr)

// Do Balance BST
print("Balance BST :")
bst.root = bst.convertIntoBalancedBST(arr: bst.inorderArr, low: 0, high: bst.inorderArr.count-1)
bst.preOrder(root: bst.root)



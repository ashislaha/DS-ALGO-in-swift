//: Playground - noun: a place where people can play


/*
 
 create BST tree from Preorder traversal of the tree.
 like :  [10, 5, 1, 7, 40, 35]
             10
            /  \
           5   40
          / \  /
         1   7 35
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
    var index1 : Int = 0 // for approach 1
    var index2 : Int = 0 // for approach 2
    
    // create BST from Preorder traversal array
    
    // approach 1 : Using Range of min , max
    public func createBSTtree(arr : [Int], key : Int, min : Int, max : Int) -> Node? {
        guard arr.count > 0 || index1 < arr.count  else { return nil }
        
        let newNode = Node(val: key)
        
        if key > min && key < max {
            index1 += 1
            if index1 < arr.count {
                newNode.left = createBSTtree(arr: arr, key: arr[index1], min: min, max: key-1)
                newNode.right = createBSTtree(arr: arr, key: arr[index1], min: key+1, max: max)
            }
        }
        return newNode
    }
    
    
    
    // approach 2 :
    public func createTree(arr : [Int], low : Int, high : Int) -> Node? {
        // check the arr
        guard arr.count > 0 else { return nil }
        
        let newNode = Node(val : arr[index1])
        index2 += 1
        
        if arr.count == 1 || low <= high {
            print("Single Element ")
            return newNode
            
        } else if arr.count > 1 && index2 < arr.count {
            
            print("index2 < arr.count")
            // find out the next element which is greater than arr[0]
            var i = 1
            while let data = newNode.data, i < arr.count {
                if arr[i] > data {
                    print("index2 : \(i)")
                    break
                }
                i += 1
            }
            // break into 2 parts w.r.t. i index1
            newNode.left = createTree(arr: arr,low: low, high: i-1)
            newNode.right = createTree(arr: arr, low: i, high: high)
            return newNode
        }
        return newNode
    }
    
    
    
    // inorder traversal
    public func inorder(root : Node?) {
        guard let root = root  else {
            return
        }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator : " ")
        inorder(root: root.right)
    }
    
}

let bst = BST()
let arr = [10,5,1,7,40,35]
bst.root = bst.createTree(arr:arr , low: 0, high: arr.count-1)
bst.inorder(root: bst.root)

// approach 1
bst.root = nil
//bst.root = bst.createBSTtree(arr: arr, key: arr[0], min: Int.min, max: Int.max)
bst.inorder(root: bst.root)





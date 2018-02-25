//: Playground - noun: a place where people can play

/*
 
 Top view of a tree :
 
         1(hd=0)
        / \
(hd=-1)2   3(hd=1)
        \
         4(hd=0)
          \
           5(hd=1)
            \
             6(hd=2)
            /
           7(hd=1)
 
 output : [1,2,3,6]
 Time Complexity = O(tree_size)
 
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

class QItem {
    var node : Node?
    var hd : Int? // Horizontal distance from root node
    init(node : Node, hd : Int) {
        self.node = node
        self.hd = hd
    }
}

// maintain a Queue
class Queue {
    
    private var arr : [QItem] = []
    
    // add into the Queue
    public func add(item : QItem) { arr.append(item) }
    
    // remove from Queue
    public func remove() -> QItem? { return arr.removeFirst() }
    
    // isEmpty
    public func isEmpty() -> Bool { return arr.isEmpty }
}

class BinaryTree {
    
    var root : Node?
    
    // print the top View of a tree
    public func topView(root : Node?) {
        guard let root = root else { return } // base condition
        
        // create a HashSet, which contains the hd track record
        var hashSet = Set<Int>()
        
        // create a Queue
        let Q = Queue()
        
        // add root into the Queue
        Q.add(item: QItem(node: root, hd: 0))
        
        while !Q.isEmpty() {
            
            // pop the element from Queue
            if let element = Q.remove(), let hd = element.hd {
                
                if !hashSet.contains(hd) { // hashSet does not contain hd
                    print(element.node?.data ?? -1)
                    hashSet.insert(hd) // add hd into Hashset
                }
                
                // insert the element of left and right tree of removed element into Queue
                if let left = element.node?.left  {
                    Q.add(item: QItem(node: left, hd: hd-1))
                }
                
                if let right = element.node?.right {
                    Q.add(item: QItem(node: right, hd: hd+1))
                }
            }
        }
    }
    
}

let bt = BinaryTree()
bt.root = Node(val: 1)
bt.root?.left = Node(val: 2)
bt.root?.right = Node(val: 3)
bt.root?.left?.right = Node(val: 4)
bt.root?.left?.right?.right = Node(val: 5)
bt.root?.left?.right?.right?.right = Node(val: 6)
bt.root?.left?.right?.right?.right?.left = Node(val: 7)
print("Top View of tree")
bt.topView(root: bt.root)





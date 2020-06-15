import UIKit


class Node{
    let value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class DFS {
    
    var root: Node?
    var visited: [Bool] = []
    var totalNodes: Int = 0
    var adjacentList: [Node] = []
    var parents: [Int: Int] = [:]
    
    
    // init
    init(array: [Int]) {
        visited = Array<Bool>(repeating: false, count: array.count)
        stack = Array<Bool>(repeating: false, count: array.count)
        totalNodes = array.count
        for each in array {
            adjacentList.append(Node(value: each))
        }
    }
    
    // push a node to adjacent list
    public func push(listNode: Node, newValue: Int) {
        let node = Node(value: newValue)
        node.next = listNode.next
        listNode.next = node
    }
    
    // create an edge
    public func edge(a: Int, b: Int) {
        guard a < totalNodes && b < totalNodes else { return }
        push(listNode: adjacentList[a], newValue: b)
    }
    
    // run DFS
    public func dfs(value: Int) {
        
        if !visited[value] {
            visited[value] = true
            print(value)
        }
        
        // iterate through adjacency list
        var nextNode = adjacentList[value].next
        while let next = nextNode {
            if !visited[next.value] {
                // capture parents
                parents[next.value] = value
                dfs(value: next.value)
            }
            nextNode = next.next
        }
    }
    
    // cycle detection of a graph
    var stack: [Bool] = []
    public func cycledetection(value: Int) -> Bool {
        print("##### called: \(value)")
        if !visited[value] {
            visited[value] = true
            stack[value] = true
            print(value)
        }
        
        // traverse the adjacency list
        var nextNode = adjacentList[value].next
        while let currentNode = nextNode {
            if !visited[currentNode.value] {
                parents[currentNode.value] = value
                return cycledetection(value: currentNode.value)
            } else if parents[value] != currentNode.value && stack[currentNode.value] {
                // there is back edge exists
                // value is not parent of currentNode and currentNode is present in the stack. so there is a back-edge exists from node to ancestor.
                print("currently processing node: \(currentNode.value)")
                return true
            }
            nextNode = currentNode.next
        }
        stack[value] = false
        return false
        
    }
    
}

let dfs = DFS(array: [0,1,2,3,4,5,6])

// create the graph
[(0,1), (1,0), (1,3), (3,4), (3,1), (4,5), (4,3), (5,6), (5,2), (5,4), (6,5), (2,5)].forEach { dfs.edge(a: $0.0, b: $0.1)}

for i in 0..<dfs.totalNodes {
    //dfs.dfs(value: i)
    if dfs.cycledetection(value: i) {
        print("detect a cycle")
        break
    }
}






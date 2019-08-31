//: Playground - noun: a place where people can play

// Do topological sorting


class Node {
    let data : Int?
    var next : Node?
    
    init(val : Int) {
        data = val
        next = nil
    }
}

class Topological {
    
    private var vertices : Int = 0
    private var visited : [Bool] = []
    private var stack : [Node] = []
    private var adj : [Node] = [] // adjacency list
    
    init(arr : [Int]) {
        vertices = arr.count
        visited = Array<Bool>(repeating: false, count: vertices)
        for each in arr {
            adj.append(Node(val: each))
        }
    }
    
    // add edge
    public func addEdge(e : Int, v : Int) {
        guard e < vertices && v < vertices else { return }
        push(head: adj[e], val: v)
    }
    
    // push to adj list
    private func push(head : Node, val : Int) {
        let node = Node(val: val)
        node.next = head.next
        head.next = node
    }
    
    // do topological
    private func topologicalUtil(start : Int){
        
        visited[start] = true
        var next = adj[start].next
        while let n = next, let data = n.data {
            if !visited[data] {
                topologicalUtil(start: data)
            }
            next = n.next
        }
        stack.append(adj[start])
    }
    
    public func topological() {
        for index in visited.indices where !visited[index] {
            topologicalUtil(start: index)
        }
    }
    
    // print adj list
    public func printAdjList() {
        adj.forEach {
            print("List for node : \($0.data ?? -1)")
            printList(node: $0)
        }
    }
    
    private func printList(node: Node?) {
        guard let node = node else { return }
        print(node.data ?? "-1")
        printList(node: node.next)
    }
    
    // print the stack
    public func printStack() {
        print("\nTopological sort :")
        for i in stride(from: stack.count-1, through: 0, by: -1) {
            print(stack[i].data ?? -1)
        }
    }
}


let arr = [0,1,2,3,4,5]
let topo = Topological(arr: arr)

// add edge
topo.addEdge(e: 5, v: 2)
topo.addEdge(e: 2, v: 3)
topo.addEdge(e: 5, v: 0)
topo.addEdge(e: 4, v: 0)
topo.addEdge(e: 4, v: 1)
topo.addEdge(e: 1, v: 3)

// print adj list
topo.printAdjList()

// do topological
topo.topological()
topo.printStack()






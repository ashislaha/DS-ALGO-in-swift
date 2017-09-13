//: Playground - noun: a place where people can play

import UIKit

class Node {
    var data : Int?
    var next : Node?
    
    init(val : Int) {
        data = val
        next = nil
    }
}

class Graph {
    
    var totalVertex : Int = 0
    var adj : [Node] = []
    var visited : [Bool] = []
    
    init(vertices : [Int]) {
        totalVertex = vertices.count
        for each in vertices {
            adj.append(Node(val: each))
            visited.append(false)
        }
    }
    
    // push to the adj list
    public func pushToList(node : Node?, data : Int) {
        guard let node = node else { return }
        let newNode = Node(val: data)
        newNode.next = node.next
        node.next = newNode
    }
    
    // create an edge between u, v
    public func addEdge(u : Int, v : Int) {
        guard u < totalVertex && v < totalVertex else { return }
        let node = adj[u]
        pushToList(node: node, data: v)
    }
    
    // DFS
    public func DFSUtil(start : Int) {
        
        // add it in visited list
        if !visited[start] { print("\(start)" , terminator : " ") }
        visited[start] = true
        
        // looping through the adjacency list
        var node = adj[start]
        while let next = node.next , let data = next.data , !visited[data] {
            DFSUtil(start: data)
            node = next
        }
    }
    
    public func DFS() {
        for i in 0..<totalVertex {
            DFSUtil(start: i)
        }
    }
}

let graph = Graph(vertices: [0,1,2,3,4,5,6,7])
graph.addEdge(u: 0, v: 1)
graph.addEdge(u: 0, v: 2)
graph.addEdge(u: 1, v: 0)
graph.addEdge(u: 1, v: 3)
graph.addEdge(u: 2, v: 0)
graph.addEdge(u: 2, v: 3)
graph.addEdge(u: 3, v: 4)
graph.addEdge(u: 3, v: 5)

graph.addEdge(u: 6, v: 7) // disconnected graph

graph.DFS()



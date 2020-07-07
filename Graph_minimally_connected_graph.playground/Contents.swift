import UIKit

/*

A minimally connected graph is a graph when by removing a single edge the grpah is no more connected. how to chechk whether a grpah is minimally connected or not?

-- simple apply BFS and see whether it contains a cycle or not.

-- If it contains a cycle / back-edge then it's not a minimally connected graph.
-- If there is no cycle / back-edge then it's minimally connected graph

- a binary tree is a minimally connected graph.

*/

class Node {
	let value: String
	var next: Node?
	
	init(value: String) {
		self.value = value
	}
}

class Graph {
	
	var isVisited: [String: Bool] = [:]
	var parents: [String: String] = [:]
	var adjacentList: [String: Node] = [:]
	
	init(nodes: [String]) {
		
		for each in nodes {
			let node = Node(value: each)
			adjacentList[each] = node
			isVisited[each] = false
		}
	}
	
	func addEdge(vertex1: String, vertex2: String) {
		guard let fromNode = adjacentList[vertex1] else {
			print("vertex does not exists in the graph")
			return
		}
		let toNode = Node(value: vertex2)
		toNode.next = fromNode.next
		fromNode.next = toNode
	}
	
	var Q: [Node] = []
	func isMinimalConnectedGraph(start: String) -> Bool {
		
		let node = Node(value: start)
		Q.append(node)
		isVisited[start] = true
		
		while !Q.isEmpty {
			
			// pop from the Queue
			let processingNode = Q.removeFirst()
			print("\nprocessing node .... ", processingNode.value)
			
			// go through the adjacency list
			var rootNode: Node? = adjacentList[processingNode.value]?.next
			while let adjacentNode = rootNode {
				
				print("adjacent node = \(adjacentNode.value) and isVisited: \(isVisited[adjacentNode.value] ?? false)")
				
				// if not visited then add to the Q
				let visited = isVisited[adjacentNode.value] ?? false
				if !visited {
					Q.append(adjacentNode)
					parents[adjacentNode.value] = processingNode.value
					isVisited[adjacentNode.value] = true
					
				} else {
				
					// if visited -- check with parent node
					if let parentNodeValue = parents[adjacentNode.value], parentNodeValue != processingNode.value {
						// there is a back-edge
						// a cycle is detected which means the graph is not minimally conncected graph
						return false
					}
				}
				
				// move to the next adjacent node
				rootNode = rootNode?.next
			}
		}
		
		return true
	}
	
	func printAdjacentList() {
		print("Adjacency List => ")
		for (_, value) in adjacentList {
			var node: Node? = value
			while node != nil {
				print(node?.value ?? "", terminator: "")
				node = node?.next
			}
			print()
		}
	}
	
}

let graph = Graph(nodes: ["A", "B", "C", "D"])
graph.addEdge(vertex1: "A", vertex2: "B")
graph.addEdge(vertex1: "A", vertex2: "C")
graph.addEdge(vertex1: "B", vertex2: "D")
//graph.addEdge(vertex1: "C", vertex2: "D") // by adding this edge, the graph will not a minimally connected graph.

graph.printAdjacentList()

let minimallyConnectedGraph = graph.isMinimalConnectedGraph(start: "A")
print("parents ==> ", graph.parents)
print(minimallyConnectedGraph)




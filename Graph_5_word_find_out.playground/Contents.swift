import UIKit

/*

	let's define the problem:

	given start = "dog" and end = "cat" and a set of strings = { "dot", "dat", "dop", "cat" }

	Rule: you can move to another word when the number of changes between two words is one like dog --> dot as 'g' is moving to 't'

	how to reach ==> "dog" --> "dot" --> "dat" --> "cat" (return true ) -- show the path

	But if the provider strings are = { "dot", "dat", "tod", "dar"}
	dog --> dot --> dat --> dar --> no soultion (return false )

*/

class Node {
	let value: String
	var next: Node?
	
	init(value: String) {
		self.value = value
	}
}


class WordFind {
	
	var parents: [String: String] = [:] // used for backtracking
	
	
	public func isSingleLetterChange(first: String, second: String) -> Bool {
		
		guard first.count == second.count else { return false }
		
		var isSinglePlaceChange = false
		
		
		let startIndex = first.startIndex
		
		for i in 0..<first.count {
			
			let ithIndex = first.index(startIndex, offsetBy: i)
			let jthIndex = first.index(startIndex, offsetBy: i+1)
			
			let charA = first[ithIndex..<jthIndex] // Substring - it is more efficient as it used the the same memory and does not allocate new memory.
			let charB = second[ithIndex..<jthIndex] // Substring
			
			if charA == charB { continue }
			else if !isSinglePlaceChange { // first time there is a mismatch between two letters in first and second string
				isSinglePlaceChange = true
				
			} else { // multiple letter changes
				isSinglePlaceChange = false
				break // should not process further
			}
		}
		
		return isSinglePlaceChange
	}
	
	func createAdjacencyList(words: [String]) -> [String: Node] {
		
		var results: [String: Node] = [:]
		
		for first in words {
			
			print("\n")
			
			let currentNode = Node(value: first)
			for second in words {
				
				let isSingleCharChange = isSingleLetterChange(first: first, second: second)
				print(first,second, isSingleCharChange)
				
				if isSingleCharChange {
					let adjNode = Node(value: second)
					adjNode.next = currentNode.next
					currentNode.next = adjNode
				}
			}
			results[first] = currentNode
		}
		
		return results
	}
	
	func traverse(start: String, end: String, words: [String]) -> Bool {
		
		guard !words.isEmpty else { return false }
		
		var newWords = words
		newWords.insert(start, at: 0)
		
		let adjList = createAdjacencyList(words: newWords)
		
		var visited: [String: Bool] = [:]
		for each in newWords {
			visited[each] = false
		}
		
		// do the BFS traversal
		let node = Node(value: start)
		var Q: [Node] = []
		Q.append(node)
		
		while !Q.isEmpty {
			
			let processingdNode = Q.removeFirst()
			visited[processingdNode.value] = true
			
			// traverse through adjacent list
			var adjNode = adjList[processingdNode.value]
			
			// we need adjacent nodes calculation here
			while let unwrappedAdjNode = adjNode {
				
				// check whether the next is the "end" node or not
				if unwrappedAdjNode.value == end {
					parents[unwrappedAdjNode.value] = processingdNode.value
					return true
				}
				
				if let isVisited = visited[unwrappedAdjNode.value], !isVisited {
					Q.append(unwrappedAdjNode)
					parents[unwrappedAdjNode.value] = processingdNode.value
				}
				adjNode = unwrappedAdjNode.next
			}
		}
		
		return false
	}
	
	func showPath(start: String, end: String) {
		
		var child = end
		while let parent = parents[child] {
			print("\(child) <-- ", terminator: "")
			child = parent
		}
		print("\(start)", terminator: "")
	}
}

let obj = WordFind()
let find = obj.traverse(start: "dog", end: "cat", words: ["dot", "dat", "dop", "cat"])
print("path exists --> ", find)

if find {
	print("show the path")
	obj.showPath(start: "dog", end: "cat")
}

let find2 = obj.traverse(start: "dog", end: "cat", words: ["dot", "dat", "dop", "bat"])
print("path exists -->", find2)
if find2 {
	print("show the path")
	obj.showPath(start: "dog", end: "cat")
}


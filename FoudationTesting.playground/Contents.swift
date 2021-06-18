import UIKit

// ---------------------------------------------------------- //
/// Experiment on Set
// ----------------------------------------------------------//

print("--------------Set----------------")

var intSet = Set<Int>([2,3,4,3]) // set can remove duplicate element.

// insert <-- we can insert another distinct element into set
intSet.insert(5)
print(intSet)

// remove <-- we can remove an element from set
intSet.remove(3)
print(intSet)

// search an element
let isContain1 = intSet.contains(6)
print("contains", isContain1)

let isContain2 = intSet.contains(2)
print("contains", isContain2)

// isSubset of another
let evenSet: Set<Int> = [2, 4]
let isSubset = evenSet.isSubset(of: intSet)
print("isSubset of", isSubset)

// similarly we can check isSuperSet(of:) of another set
// we can check whether two set are disjoint or not.
// (disjoint means -- 1. do intersection between two set and 2. it should be empty)

// intersection of two set
let oddSet: Set<Int> = [1, 3, 5]
let intersectionSet = oddSet.intersection(intSet)
print("intersection result", intersectionSet)

// union of two set
let unionSet = oddSet.union(intSet)
print("Union of two set", unionSet)


// we can apply filter on set
// Ask - extract only even numbers in union set
let filteredSet = unionSet.filter{ $0 % 2 == 0 }
print("filtered result", filteredSet)



// ----------------------------------------------------------//
/// Experiment on Dictionary
// ----------------------------------------------------------//


print("--------------Dictionary----------------")

// create a dictionary and insert some element
var dict: [Int: String] = [:]

dict[1] = "a"
dict[2] = "b"







// ----------------------------------------------------------//
/// Experiment on string
// ----------------------------------------------------------//

print("--------------String----------------")

extension StringProtocol {
	var asciiValues: [UInt8?] {
		return compactMap { $0.isASCII ? $0.asciiValue: nil } // each Character has an ascii value
	}
}
print("Ascii value of ABC -->", "ABC".asciiValues)


// how to get each char in a string?

// Approach - 1 - using compactMap()
let inputString = "abcdef"
print("Output in using CompactMap ---->")
inputString.compactMap { print ($0) }


// Approcah - 2: Using index
print("Output using index ----->")
for i in 0..<inputString.count {
	let index = inputString.index(inputString.startIndex, offsetBy: i)
	print(inputString[index])
}

// Approach - 3: using a For loop
print("Using a for loop --->")
for eachChar in inputString {
	print(eachChar)
}

// substring of a string using Index
let index1 = inputString.index(inputString.startIndex, offsetBy: 2)
let index2 = inputString.index(inputString.startIndex, offsetBy: 4)
let substring = inputString[index1...index2]
print("substring of inputString --->", substring)


// divide string into multiple short string



// replace a particular char in string with another char/string




// ----------------------------------------------------------//
/// Experiment on Array
// ----------------------------------------------------------//

print("--------------Array----------------")
var intArray: [Int] = [1,2,3,4,5,6]
print("size of that array", intArray.count) // size of that array

// push_back into array
intArray.append(7)
print("after push_back", intArray)

// get an element in an array
let index = 4
if index < intArray.count {
	print(intArray[index])
}

// remove from an index
if index < intArray.count {
	let removedElement = intArray.remove(at: index)
	print("removed \(removedElement) in position \(index) ---> ", intArray)
}

// insert at index
if index < intArray.count {
	intArray.insert(100, at: index)
	print("insert 100 at index: \(index) ---> ", intArray)
}

// construct an array with default false value
let boolArray = Array<Bool>(repeating: false, count: 10)
print(boolArray)


// array contains a element or not - O(n) complexity
let is5Contain = intArray.contains(5)
print("is 5 contains --> ", is5Contain)

// sort an array
let sortedArray = intArray.sorted()
print("sorted array", sortedArray)

// in-place sorting
print("in place sorting -- before -->", intArray)
intArray.sort()
print("in place sorting -- after -->", intArray)


// printing an array from end
print("stride the arrary from end to begin ---> stride(from: to: by:)")
for i in stride(from: intArray.count-1, to: -1, by: -1) {
	print(intArray[i])
}

// OR we can use stride(from: through: by:) method
print("stride the arrary from end to begin --> stride(from: through: by:)")
for i in stride(from: intArray.count-1, through: 0, by: -1) {
	print(intArray[i])
}


// ----------------------------------------------------------//
/// DFS
// ----------------------------------------------------------//

print("--------------DFS----------------")
class Node {
	let value: Int
	var next: Node?
	
	init(value: Int) {
		
		self.value = value
		self.next = nil
	}
	
}

class Graph {
	
	init(values: [Int]) {
		
		for each in values {
			visited[each] = false
		}
		totalVertex = values.count
	}
	
	public func edge(u: Int, v: Int) {
		
		guard let adjVertex = adj[u] else {
			
			let vertex = Node(value: v)
			adj[u] = vertex
			return
			
		}
		
		let vertex = Node(value: v)
		vertex.next = adjVertex
		adj[u] = vertex
	}
	
	// private apis
	var parent: [Int: Int] = [:]
	var visited: [Int: Bool] = [:]
	var adj: [Int: Node] = [:]
	private let totalVertex: Int
	
	func dfs(start: Int) {
		
		// 1. make it visited
		visited[start] = true
		print(start)
		
		// 2. loop through the ajd vertices
		
		var adjVertex = adj[start]
		while let nextVertex = adjVertex {
			let value = nextVertex.value
			if let visited = visited[value], !visited {
				parent[value] = start
				dfs(start: value)
			}
			adjVertex = nextVertex.next
			
		}
	}
}


let graph = Graph(values: [20, 30, 25, 35])
graph.edge(u: 20, v: 30)
graph.edge(u: 30, v: 25)
graph.edge(u: 25, v: 35)
graph.edge(u: 20, v: 25)
graph.edge(u: 20, v: 35)

// 20 --> 30 --> 25 --> 35
// 20 --> 25
// 20 --> 35

graph.dfs(start: 20)
print(graph.parent)

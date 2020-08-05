import Foundation

func flip(arr: inout [Int], k: Int) {
	
	// put a variable at 0 and kth position and start swapping until it crossed each other
	
	var begin = 0
	var end = k
	
	while begin < end {
		let temp = arr[begin]
		arr[begin] = arr[end]
		arr[end] = temp
		begin += 1
		end -= 1
	}
}

func getIndexOfLargestElement(arr: [Int], size: Int) -> Int {
	
	guard !arr.isEmpty else { return -1 }
	
	let endIndex = min(arr.count, size)
	var maxElement = arr[0]
	var maxElementIndex = 0
	var index = 1
	
	while index < endIndex {
		if arr[index] > maxElement {
			maxElement = arr[index]
			maxElementIndex = index
		}
		index += 1
	}
	
	return maxElementIndex
}

func pancakeSort(arr: [Int]) -> [Int] {
	
	guard !arr.isEmpty else { return [] }
	
	var result = arr
	
	// choose the highest element in the array - k th index
	// flip(arr, k) -- so that the highest element comes to the front
	// flip(arr, size-1) - so that the highest element goes to the end -- similar to selection sorting
	// decrease the size and perform the same operation
	
	var size = result.count
	while size > 1 {
		
		// choose largest
		let index = getIndexOfLargestElement(arr: result, size: size)
		
		// flip(arr, index)
		flip(arr: &result, k: index)
		
		// flip(arr, size-1)
		flip(arr: &result, k: size-1)
		
		size -= 1
	}
	
	return result
}

let array = [3,2,4,5,1,6]
print(pancakeSort(arr: array))

// basic sorting
var sorted = array.sorted()
print(sorted)

let d = log2(256.0)
print(d)
let e = d/2
print(e)
print( e.truncatingRemainder(dividingBy: 1.0) == 0.0)




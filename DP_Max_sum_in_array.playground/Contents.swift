import UIKit

/*

	as the array is 2n size, we have to find out the max sum of n elements in either direction

	you can choose (0,n), (1, n-1)...(0,n) elements.

	return the maximum sum

	given:
	input array = [100,1,2,20,30,40]

	left prefix array => [0, 100, 101, 103]
	right postfix array => 	[90, 70, 40, 0]
	max = 170 (100+70 = 100 + 40 + 30)

*/

func maxSum(numbers: [Int]) -> Int {
	
	guard !numbers.isEmpty else { return 0 }
	
	let n = numbers.count / 2
	
	// calculate left array - optimised
	var left_arr: [Int] = Array<Int>(repeating: 0, count: n+1)
	var right_arr: [Int] = Array<Int>(repeating: 0, count: n+1)
	
	for i in 0..<n {
		left_arr[i+1] = left_arr[i] + numbers[i]
	}
	print(left_arr)
	
	for i in 0..<n {
		right_arr[n-1-i] = right_arr[n-i] + numbers[(2*n)-1-i]
	}
	print(right_arr)
	
	var max_element = Int.min
	for i in 0..<n {
		let value = left_arr[i] + right_arr[i]
		if value > max_element {
			max_element = value
		}
	}
	return max_element
}

let array = [100,1,2,20,30,40]
print(maxSum(numbers: array))


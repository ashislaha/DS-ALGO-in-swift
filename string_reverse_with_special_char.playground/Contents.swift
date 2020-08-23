import Foundation

func reverseString(input: String) -> String {
	
	guard !input.isEmpty else { return input }
	
	// process it
	
	// take two counter --> low and high and
	// 1. move those counter when we encounter char (low +=1, high -= 1)
	// 2. if str[low] is not char then move only low
	// 3. if str[high] is not char then move only high (--high)

	var array = Array(input) // as swift does not allow subscript
	var low = 0
	var high = array.count-1
	
	let alphabet = CharacterSet.alphanumerics
	
	while low < high {
		
		let isLowAlphabet = String(array[low]).rangeOfCharacter(from: alphabet) != nil
		let isHighAlphabet = String(array[high]).rangeOfCharacter(from: alphabet) != nil
		
		if isLowAlphabet && isHighAlphabet {
			array.swapAt(low, high)
			low = low + 1
			high = high - 1
		} else {
			
			if !isLowAlphabet { low += 1 }
			else { high -= 1 }
		}
	}
	
	return String(array)
}

let input = "a,b$c"
print(input, " --> ", reverseString(input: input))






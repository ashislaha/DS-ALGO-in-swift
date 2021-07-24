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

let aSet: Set<Character> = ["a", "b", "c"]
let bSet: Set<Character> = ["a", "c", "b", "d"]
let resultSet = bSet.subtracting(aSet)
print(resultSet)

// Two sets are identical, we can apply == as they are conforming to equatable protocol
if aSet == bSet {
	print("both are identical set")
} else {
	print("both are not identical set")
}



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
let bigString = "I am ashis. I am living in Hyderabad."
let components = bigString.components(separatedBy: " ")
print(components)

let words = ["abcd", "efg", "hijklm", "nopqrst"]
let resultString = words.joined(separator: ",")
print(resultString)


// divide and join using CharacterSet
let letterCharacterSet = CharacterSet.letters
let invertedCharacterSet = letterCharacterSet.inverted

let customCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
let invertedCustomCharset = customCharacterSet.inverted


let randomSentence = "I am working $$ at% microsoft ## . I want to filter @$ this s   tring into a sentence"
let refinedSentence = randomSentence.components(separatedBy: invertedCharacterSet)
print(refinedSentence)

let refinedSentence2 = randomSentence.components(separatedBy: invertedCustomCharset)
print(refinedSentence2.joined(separator: ""))


// replace a particular char in string with another char/string

let replaceString = "I am happy $"
let resultReplaceString = replaceString.replacingOccurrences(of: "$", with: "")
print(resultReplaceString)




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

// copy the entire array at the end of another array
let tempArray:[Int] = [1,2,3,4]
var resultArr: [Int] = [10,20,30]
resultArr.append(contentsOf: tempArray)


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


// can we compare two array

let array1 = [1,2,3,4]
let array2 = [2,3,4,1]

if array1 == array2 {
	print("both array are same")
} else {
	print("both array are not same")
}


let set1 = Set(array1)
let set2 = Set(array2)

if set1 == set2 {
	print("both set are same")
} else {
	print("both set are not same")
}


// shuffle -- apply rand function
let shuffleInputArr = [1, 2,3,4,5]
var systemRandomNumberGenerator = SystemRandomNumberGenerator()
let shuffledArray = shuffleInputArr.shuffled(using: &systemRandomNumberGenerator)

let randomNumer = Int(arc4random()) % shuffleInputArr.count // between 0 to count-1
print(randomNumer)



// ---------------------------------------------------------- //
/// Experiment on Protocol
// ----------------------------------------------------------//


print("--------------Protocol----------------")


protocol Person: AnyObject {
	var name: String {get set}
	var country: String { get set}
}

class BobPerson: Person {
	var country: String
	var name: String
	
	init(name: String, country: String) {
		self.name = name
		self.country = country
	}
}

class AadharPerson {
	weak var person: Person? // protocol should be class type to use weak var, it must conform "AnyObject"
	
	init(person: Person) {
		self.person = person
	}
}

let bob = BobPerson(name: "Bob", country: "India")
let aadhar = AadharPerson(person: bob)




@objc protocol Television: AnyObject {
	var name: String {get set}
	
	@objc optional func isSupport4K() -> Bool
}

class TelevisionBaseClass: Television {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

class AppleTV: TelevisionBaseClass {
	
	override init(name: String) {
		super.init(name: name)
	}
	
	func isSupport4K() -> Bool {
		return true
	}
}

class SamsungTV: TelevisionBaseClass {
	override init(name: String) {
		super.init(name: name)
	}
	
	func isSupport4K() -> Bool {
		return false
	}
}

let appleTv = AppleTV(name: "Apple")
let samsungTV = SamsungTV(name: "Samsung")

func testFuntion(television: Television) {
	print(television.name)
	print("supporting 4k -->", television.isSupport4K?() ?? false)
}

testFuntion(television: appleTv)
testFuntion(television: samsungTV)





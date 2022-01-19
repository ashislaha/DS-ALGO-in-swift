import UIKit

// dispatch once in swift
// using lazy closure execution or static let clsoure
class StaticOnceTest {
	
	static let test2 = {
		print("Test " + $0 + " \($1)")
	}("mediaHSL", 5)
	
	lazy var closure: () = {
		test(entryPoint: $0, videos: $1)
	}("see all" , 4)
	
	private func test(entryPoint: String, videos: Int) {
		print("Test " + entryPoint + " \(videos)")
	}
}

print("Test-1")
let a = StaticOnceTest()
a.closure
a.closure
a.closure
a.closure
StaticOnceTest.test2
StaticOnceTest.test2
StaticOnceTest.test2
StaticOnceTest.test2

print("Test-2")
let aa = StaticOnceTest()
aa.closure
aa.closure
aa.closure
aa.closure

extension Date {

	/// convert date into String
	/// - Returns: String in MMM, d, yyyy format (e.g. Oct 8, 2013)
	public func dateToStringInddMMMyyyy() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd MMM yyyy"
		return dateFormatter.string(from: self)
	}
}

let outputDate = Date().dateToStringInddMMMyyyy()
print(outputDate)



// ---------------------------------------------------------- //
/// Experiment on seralisation and de-serialisation
// ----------------------------------------------------------//

let postBodyDict: [String: Any] = [
	"subject":"Lets go For Party",
	"body":[
		"contentType":"HTML",
		"content":"Does mid month work for you?"
	],
	"start": [
		"dateTime": "2021-10-15T12:00:00",
		"timeZone": "Pacific Standard Time"
	],
	"end": [
		"dateTime": "2021-10-15T14:00:00",
		"timeZone": "Pacific Standard Time"
	],
	"location": [
		"displayName":"Ashis's Event Creation"
	],
	"attendees" : [
		[
			"emailAddress": [
				"address":"aslaha@microsoft.com",
				"name":"Ashis Laha"
			],
			
			"type": "required"
		],
		[
			"emailAddress": [
				"address":"ropal@microsoft.com",
				"name":"Roli Pal"
			],
			
			"type": "required"
		],
		[
			"emailAddress": [
				"address":"npasricha@microsoft.com",
				"name":"Neelu Pasricha"
			],
			
			"type": "required"
		]
	],
	"isOnlineMeeting": true
]

// seralise it
let data = try? JSONSerialization.data(withJSONObject: postBodyDict, options: .prettyPrinted)


// de-seralize it
let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
print(jsonObj!)


// ---------------------------------------------------------- //
/// Experiment -- UserDefault,
// ----------------------------------------------------------//


let printDate = Date()
print("\(printDate)")

let userDefaults = UserDefaults.standard
let value = userDefaults.bool(forKey: "test")

if value == false {
	print("no entry there OR insert false before")
}



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
let oddSet: Set<Int> = [1, 3, 5, -1]

let minValue = oddSet.min()
let maxValue = oddSet.max()

let intersectionSet = oddSet.intersection(intSet)
print("intersection result", intersectionSet)

// union of two set
let unionSet = oddSet.union(intSet)
print("Union of two set", unionSet)


// we can apply filter on set
// Ask - extract only even numbers in union set
let filteredSet = unionSet.filter{ $0 % 2 == 0 }
print("filtered result", filteredSet)




// ---------------------------------------------------------- //
/// Experiment on OptionSet
// ----------------------------------------------------------//

struct Direction: OptionSet {
	
	let rawValue: Int
	static let north = Direction(rawValue: 1<<1)
	static let south = Direction(rawValue: 1<<2)
	static let west = Direction(rawValue: 1<<3)
	static let east = Direction(rawValue: 1<<4)
	
	static let all: Direction = [.north, .south, .east, .west]
}

let northOnlyDirection: Direction = .north
let allDirection: Direction = .all



// ----------------------------------------------------------//
/// Experiment on Dictionary
// ----------------------------------------------------------//


print("--------------Dictionary----------------")

// create a dictionary and insert some element
var dict: [Int: String] = [:]

dict[1] = "a"
dict[2] = "b"

var dict1 = ["a": "1", "b": "2", "c":"3"]
let dict2 = ["b": "2", "a": "1"]
let dict3 = ["a": "1", "b": "2"]

if dict1 == dict2 {
	print("dict1 and dict2 are same dict")
} else {
	print("dict1 and dict3 are different dict")
}

if dict1 == dict3 {
	print("dict1 and dict3 are same dict")
} else {
	print("dict1 and dict3 are different dict")
}

// remove an entry in dictionary
dict1.removeValue(forKey: "a")
print(dict1)

// property observer of a dict
var testDict: [Int: Int] = [:] {
	didSet {
		print(testDict)
	}
}
testDict[1] = 10
testDict[2] = 20

// ----------------------------------------------------------//
/// Experiment on string
// ----------------------------------------------------------//

let testLink = "https://www.google.com?a=b"
let url = URL(string: testLink)!
let extensionString = url.pathExtension


print("--------------DateComponents Formatter----------------")

let input3: TimeInterval = 26
let input4: TimeInterval = 66
let input5: TimeInterval = 3766

let formatter3 = DateComponentsFormatter()
formatter3.unitsStyle = .positional
formatter3.zeroFormattingBehavior = .pad // if you want "0" padding on first params
if input5 < 3600 {
	formatter3.allowedUnits = [.minute, .second]
} else {
	formatter3.allowedUnits = [.hour, .minute, .second]
}
let outputString3 = formatter3.string(from: input5)!
print(outputString3)

//formatter.allowedUnits = [.hour, .minute, .second]

print("--------------String----------------")

extension StringProtocol {
	var asciiValues: [UInt8?] {
		return compactMap { $0.isASCII ? $0.asciiValue: nil } // each Character has an ascii value
	}
}
print("Ascii value of ABC -->", "ABC".asciiValues)


// String is a value type, you cannot put a weak referece on value type
// Compilation error - 'weak' is only applied to class and class-bound protocol types

/* weak */ var dummyString: String? = "abc"
var anotherString = dummyString // creates an another copy
anotherString = "de" // can assign a new value
print(dummyString, anotherString) // Optional("abc") Optional("de")


// how to get each char in a string?

// Approach - 1 - using compactMap()
let inputString = "abcdef"
print("Output in using CompactMap ---->")
var newInputStrings: [Character] = []
inputString.compactMap { newInputStrings.append($0) }
print(newInputStrings)


// Approcah - 2: Using index
// It has peformance impact to use index, so try to avoid this method as much as possible.
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
// It has peformance impact to use index, so try to avoid this method as much as possible.
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


// convert a number into a binrary representation
let bits = String(10, radix: 2)
print(bits)

// findout abs() between two number diff
let diff = abs(13.5-15.6)
print(diff)


let name: NSString = "abcd efgh.mp4"
let fileExtension = name.pathExtension
print(fileExtension)


// ----------------------------------------------------------//
/// Experiment on Array
// ----------------------------------------------------------//

print("--------------Array----------------")
var intArray: [Int] = [1,2,3,4,5,6, -2]
print("size of that array", intArray.count) // size of that array

// array with specific size
var capacityArr = Array<Int>(repeating: 0, count: 10) // array with 10 size initialised with 0

let minElement = intArray.min() // min() and max() is available for set
let maxElement = intArray.max()

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


let testOne = [2,1,2,3,1]
let testTwo = testOne + [4]
print(testTwo)


let droppedElement = testOne.dropFirst(1)
print(droppedElement)



// Range operator in array
let range = 1...3
for i in range {
	print(i)
}


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


/// Explore few protocols

/// Equatable


/// Comparable


/// Hashable



/// Sequence
// sequence is a list of values which you can step through at a time. Example -- For in loop increamenting by 1
// array contains() method goes via linear search and it is coming from sequence protocol.


/// Collection
// a collection is a sequence whose elements can be accessed multiple times and can be accessed by indexed subscript.
// array is a collection
// Collection protocol inherits from sequence protocol

// A slice of original collection can share the original space
let sentence = "The good person"
if let index = sentence.firstIndex(of: " ") {
	let firstWord = sentence[sentence.startIndex..<index] // [..<index] is same as it.
	print(firstWord)
}

/// slice
// a slice is a view of subsequence of elements of an another collection. It uses the original collectio space.
// to create a slice takes o(1) time
// it contains the start and end indices of the view and base collection



/// Bidirectional collection
// a collection that supports both backward and forward movement/traversal



// ---------------------------------------------------------- //
/// Experiment on Struct
// ----------------------------------------------------------//

class Road {
	let name: String
	let length: Double
	
	init(name: String, length: Double) {
		self.name = name
		self.length = length
	}
}

struct Address {
	
	let road: Road
	let landMark: String	
}


// ---------------------------------------------------------- //
// High order functions
// ----------------------------------------------------------//

let TwoDArray: [[Character]] = [["A", "B", "C"], ["X", "Y", "Z"]]
let OneDArray = TwoDArray.flatMap { $0 }
print(OneDArray)


// find out whether "M" is present in that 2D array
let isMPresent = OneDArray.filter { $0 == "M" }
print("is M present? ", !isMPresent.isEmpty)


// concat all the characters into a single string
let concatResult = OneDArray.reduce("Final result = ") { partialResult, ch in
	return partialResult + String(ch) // string concat partialResult + ch and save it partialResult for re-use.
}
print(concatResult)


protocol VideoViewController: AnyObject {
	
	func selfReference() -> UIViewController
	
	func updateUI()
	
}

class SeeAllController: UIViewController {
	
	weak var videoViewController: VideoViewController?
	
	func addView() {
		
		if let childView = videoViewController?.selfReference().view {
			view.addSubview(childView)
		}
	}
	
	func registerNotification() {
		// listen to a notification
		// data is common for both child controller, inform them once we receive a new data.
	}
	
	func handleNotification() {
		
		videoViewController?.updateUI()
	}
	
	
}

class TableController: UIViewController, VideoViewController {
	
	func selfReference() -> UIViewController { return self }
	
	func updateUI() {
		//
	}
}

class CollectionController: UIViewController, VideoViewController {
	
	func selfReference() -> UIViewController { return self }
	
	func updateUI() {
		
	}
}

// common viewModel which will handle all sort of common data handling logic



import UIKit

/*

	given: nested dictionary

	[
		"key": 3,

		"foo": [
					"a": 5,
					"b": 6,
					"bar": [
								"c": 7,
								"d": 8
							]
			]
	]

output:

[
	"key": 3,
	"foo.a": 5,
	"foo.b": 6,
	"foo.bar.c": 7,
	"foo.bar.d": 8
]

how to solve it?

let's think about a small chunk:
[
	"a": 5,
	"b": [
		"c": 6
		]
]

in the above example -- we are traversing through each element in the dictionary

1. if it is a value -- just copy it to the result dictionary
2. if it is an another dictionary call the same method with extra information (pass namespace to its down-layer)

*/


class NestedDictionary {
	
	var resultDict: [String: Int] = [:]
	
	func process(keypath: String, dict: [String: Any]) {
		
		for (key, value) in dict {
			
			
			if let intValue = value as? Int { // 1. if it a key, add it to the result dict
				resultDict[keypath + key] = intValue
				
			} else if let nestedDict = value as? [String: Any] { // 2. if is an another dict
				process(keypath: keypath + key + ".", dict: nestedDict)
			}
		}
	}
}

let obj = NestedDictionary()
let testDict: [String: Any] = [
	"key": 3,
	"foo": [
		"a": 5,
		"b": 6,
		"bar": [
			"c": 7,
			"d": 8
		]
	]
]
obj.process(keypath: "", dict: testDict)
print(obj.resultDict)

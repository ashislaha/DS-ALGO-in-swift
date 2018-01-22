//: Playground - noun: a place where people can play

import Foundation


// Element must have either value or childDictionary, not at the same time

class Element {
    var value : [Int]?
    var childDictionary : Dictionary<String, Element>?
    
    init(value : [Int]?, childKey : String?, childValue : Element? ) {
        self.value = value
        self.childDictionary = nil
        
        if let childKey = childKey, let childValue = childValue {
            var dict = Dictionary<String, Element>()
            dict[childKey] = childValue
            childDictionary = dict
        }
    }
}


class JsonCreator {
    
    private var root : Element?
    
    /* output is like
     {
            "a" : {
                    "b" : {
                            "c" : [1,2]
                         },
            "d" : {
                    "c" : 3
                        }
                },
            "f" : {
                    "e" : 10
                }
     }
     */
    
    private let jsonInput = [
        "a>b>c=1",
        "a>b>c=2",
        "d>c=3",
        "f>e=10",
        "a>b=20",  // Invalid, Node(b) has Child, cannot insert the value
        "a>b>c>d=11" // Invalid , Node(c) has value, but trying to insert child, invalid case
    ]
    
    public func create() {
        root = Element(value: nil, childKey: nil, childValue: nil) // root one
        createJSON(input: jsonInput)
        print("\n\n Output \n\n")
        printJson(root: root)
    }
    
    private func createJSON(input : [String]) {
        
        let rootJson = root
        
        for each in input {
            print("\n---------------------- New Input ----------------------\n")
            // split the string into 2 parts
            let parts = each.components(separatedBy: "=")
            
            if parts.count > 1 { // go through the hierarchy
                
                let literals = parts[0].filter{ $0 != ">" }
                print(literals)
                
                var traversal = rootJson
                var char : Character!
                var hasError = false
                
                // literals
                for i in 0..<literals.count {
                    char = literals[literals.index(literals.startIndex, offsetBy: i)]
                    print("Processing : \(char!)")
                    
                    if let _ = traversal?.value {
                        print("ERROR : Node has value, but trying to insert child, invalid case")
                        hasError = true
                        break
                        
                    } else if traversal?.childDictionary == nil {
                        print("Child is Empty : Do Insertion")
                        let node = Element(value: nil, childKey:nil , childValue: nil)
                        var dict = Dictionary<String, Element>()
                        dict[String(char)] = node
                        traversal?.childDictionary = dict
                        traversal = node // update traversal
                        
                    } else if let isChildPresent = traversal?.childDictionary?.keys.contains(String(char)), !isChildPresent {
                        print("Child is not Empty, but not present in the hierary, Do Insertion")
                        let node = Element(value: nil, childKey:nil , childValue: nil)
                        traversal?.childDictionary?[String(char)] = node
                        traversal = node // update traversal
                        
                    } else {
                        print("Child is not Empty, but present in the hierary: NO Insertion, only traverse ")
                        if let updateTraversal =  traversal?.childDictionary?[String(char)] {
                            traversal = updateTraversal // update traversal
                        }
                    }
                }
                
                // Value
                if let _ = char, let val = Int(parts[1]), !hasError {
                    print("value : \(val)")
                    
                    if let _ = traversal?.childDictionary {
                        print("ERROR : Node has Child, cannot insert the value")
                    } else {
                        print("Append the value")
                        if let _ = traversal?.value {
                            traversal?.value?.append(val)
                        } else {
                            traversal?.value = [val]
                        }
                    }
                }
                root = rootJson // update root for every input
            }
        }
    }
    
    private func printJson(root : Element?) {
        if let childDictionary = root?.childDictionary {
            for each in childDictionary {
                print("{ \(each.key) : ", terminator : "")
                printJson(root: each.value)
                print("}")
            }
        }
        
        if let values = root?.value {
            print("\(values)")
        }
    }
}

let jsonCreateObj = JsonCreator()
jsonCreateObj.create()



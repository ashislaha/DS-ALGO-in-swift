//: Playground - noun: a place where people can play

protocol Container {
    associatedtype Item   // The associated type is not specified until the protocol is adopted.
    mutating func appending(item : Item)
    var count : Int { get }
    subscript(i : Int)-> Item { get }
}

// Any type that conforms the protocol, must specify the type.
struct Stack<Element> : Container {
    var items : [Element] = []
    mutating func push(item : Element) { items.append(item) }
    mutating func pop() -> Element { return items.removeLast() }
    
    // conforming Container protocol
    typealias Item  = Element
    mutating func appending(item: Element) {
        push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i:Int) -> Element {
        return items[i]
    }
}

// Extension with Generic where clause
extension Stack where Item : Equatable {
    func isTop(item : Item) -> Bool {
        guard !items.isEmpty else { return false }
        guard let lastItem = items.last else { return false }
        return lastItem == item // == coming from Equatable protocol
    }
}

// Testing
let intStack = Stack(items: [1,2,3])
print(intStack.count)
print(intStack.isTop(item: 2))

let strStack = Stack(items: ["A","B","C"])
print(strStack.items)

// Extension of Int 
extension Int {
    enum Kind {
        case positive, negative, zero
    }
    var kind : Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0 :
            return .positive
        default:
            return .negative
        }
    }
}

print(5.kind)
print(0.kind)
let num = -1
print(num.kind)




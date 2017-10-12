//: Playground - noun: a place where people can play


// Create a Snake and ladder games

class QItem {
    var distance : Int = 0
    var vertex : Int = 0
    init(dist : Int, v : Int) {
        distance = dist
        vertex = v
    }
}

class SnakeAndLadder {
   
    public func getDiceThrowns(moves : [Int]) -> Int {
        
        guard !moves.isEmpty else { return 0 }
        let positions = moves.count
        var visited = Array<Bool>(repeating: false, count: positions)
        var Q : [QItem] = []
        
        //make the root as visited
        visited[0] = true
        var qItem = QItem(dist: 0, v: 0)
        Q.append(qItem) // appending into a Queue
        
        // looping through the Queue
        while !Q.isEmpty {
            qItem = Q.removeFirst()
            let v = qItem.vertex
            let dist = qItem.distance
            
            // base case
            if v == positions-1 { break }
            
            // traverse next 6 positions as dice gives 6 options
            for i in 1...6 where v+i < positions {
                if !visited[v+i] {  // if not visited
                    visited[v+i] = true
                    let newItem = QItem(dist: dist+1, v: v+i)
                    if moves[v+i] != -1 { //  ladder and snake present
                        newItem.vertex = moves[v+i]
                    }
                    Q.append(newItem)
                }
            }
        }
        return qItem.distance
    }
}

let sl = SnakeAndLadder()
var moves = Array<Int>(repeating: -1, count: 30)
// Ladders
moves[2] = 21
moves[4] = 7
moves[10] = 25
moves[19] = 28;
// Snakes
moves[26] = 0
moves[20] = 8
moves[16] = 3
moves[18] = 6
print(moves)
let results = sl.getDiceThrowns(moves: moves)
print(results)






/*
    you have a deck of cards. Two players have stacks. Compare their stack using max suits.
 
 */

public func solution(_ A :  String, _ B :  String) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    let orderedChars = ["A","K","Q","J","T","9","8","7","6","5","4","3","2"]
    var results : Int = 0
    
    if A.characters.count == B.characters.count {
        
        for i in 0..<A.characters.count {
            // check each pair
            let char1 = A[A.index(A.startIndex, offsetBy: i)]
            let char2 = B[B.index(B.startIndex, offsetBy: i)]
            
            if let index1 = orderedChars.index(of: String(char1)), let index2 = orderedChars.index(of: String(char2)) {
                if index1 < index2 {
                    results += 1
                }
            }
        }
    }
    
    return results
}

print("Solution1")
print(solution("AJ86QK", "JJ653K"))


/*
    Find out the position of k in sentence of "(" and ")" where the equal of "(" present left hand side of k with ")" in right hand side of k
 
 */

public func solution2(_ S : String) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    // if S contains only opening /  closing brackets then return the chars in string
    let opening = "("
    let closing = ")"
    var result : Int = 0
    
    if S.characters.contains(Character(opening)) && S.characters.contains(Character(closing)) {
        // Traverse the S string 
        
        var left : Int = 0
        var right : Int = S.characters.count-1
        
        while left < right {
            let open = S[S.index(S.startIndex, offsetBy: left)]
            let close = S[S.index(S.startIndex, offsetBy: right)]
            
            // 3 scenario 
            
            if String(open) == opening && String(close) == closing {
                left += 1
                right -= 1
                result = left
            } else if String(open) == opening && String(close) != closing {
                right -= 1
                result = left + 1
            } else if String(open) != opening && String(close) == closing {
                left += 1
                result = left + 1
            }
        }
    
    } else { // only one kind of brackets is present
        
        result = S.characters.count
    
    }
    
    return result
}
print("Solution2")
print(solution2("(("))



/*
    Find out max number of words in a sentence.
*/


public func solution3(_ S : String) -> Int {
    // write your code in Swift 3.0 (Linux)
    var maxWords : Int = 0
    
    // Divide into sentences 
    // Each Sentence, divide into words & compare with previous senentence words count
    
    var S = S
    if !S.isEmpty {
        
        let seperator = [".","?","!"]
        let space = " "
        var spacePositions : [Int] = [] // to reduce the worst-time complexity in O(n) time , extra space complexity = O(maxWords)
        
        // let's traverse S
        S.append(".")
        
        var start : Int = 0
        var end : Int = 0
        
        while end < S.characters.count {
            
            // find out Sentences
            
            let eachChar = S[S.index(S.startIndex, offsetBy: end)]
            if seperator.contains(String(eachChar)) {
                
                // A sentence present from start to end index
                // Count Words in the sentence
                spacePositions.append(end)
                print("Positions : \(spacePositions)")
                
                var words : [String] = []
                for i in 0..<spacePositions.count {
                    
                    // from start to spacePosition[i] is an word & also check the validity of a word (at least one char)
                    
                    let startingWordIndex = S.index(S.startIndex, offsetBy: start)
                    let endingWordIndex = S.index(S.startIndex, offsetBy: spacePositions[i])
                    let word = S[startingWordIndex..<endingWordIndex]
                    
                    if word.characters.count > 0 { // Word validity
                        words.append(String(word))
                    }
                    start = spacePositions[i]+1
                }
                
                // check maxWords
                if words.count > maxWords {
                    maxWords = words.count
                }
                print(words)
                
                // update spacePositions
                spacePositions = []
                end += 1
            } else {
                if String(eachChar) == space {
                    spacePositions.append(end)
                }
                end += 1
            }
        }
    }
    return maxWords
}

print("Solution3")
print(solution3("I like swift. I am from Bangalore."))

import UIKit

/**
	given - S number of stacks
		- You can perform N of pop operations at most. (you can few than N)
		- maximise the sum of top elements in the stack.
Example:

	S = {  { 2,6,4,5} , { 1,6,15,10} }
	N = 3

let's say if N = 0 then sum = 2 + 1 = 3 (as there is nothing to pop)
	if N =1 then sum = max { 3 (optimal valud when N =0),  6+1 (pop from 1st stack), 2+6 (pop from 2nd stack) } = 8
	similarly we can do for N = 2 and so on N = 3

OR

we can solve the above with another approach: think we have given a single stack and solve it for single stack with N = 3.
then proceed to next Stack with previous optimized result.

apply N = 3 to first stack what will be sum value:
stack 1 =>  dp { 2, 6, 6, 6 }
	2 when N = 0 <-- no pop on stack 1
	6 when N = 1 <-- at most 1 pop on stack 1 => max (2,6) where 2 is from previous result and 6 is after popping 1 on stack 1
	6 when N = 2 <-- at most 2 pops on stack 1 => max(6, 4) where 6 is from previous result and 4 is after poping 2 on stack 1
	6 when N = 3 <-- at most 3 pops on stack 1 => max(6, 5) where 6 is from previous result and 5 is after popping 3 on stack 1

stack 2 => { 1,6,15,10}
	when N = 0 sum = 2 + 1 = 3 where 2 is coming from stack 1 dp[0] and 1 is stack 2 top
	when N = 1 sum = max ( 2 + 6, 6 + 1) = 8, 2+6 means 2 <-- stack 1 dp[0] and 6 is stack2[1] and 6+1 means stack1 dp[1] and 1 is stack2[0]
	when N = 2, sum = max(1+6, 6+6, 15+2) = 17
	when N = 3, sum = max(1+6, 6+6, 15+6, 10+2) = 21

i <-- stack and j <-- pop ops
dp[i][j] = for k=0->j { max( stack[i][k] + dp[i-1][j-k]) }

*/


func calculateMaxSum(stacks: [[Int]], numberOfPopUps: Int) -> Int {
	
	guard !stacks.isEmpty else { return 0 }
	
	var N = numberOfPopUps
	let stackSize = stacks[0].count
	if numberOfPopUps >= stackSize {
		N = stackSize - 1
	}
	
	var lookup: [[Int]] = [] // initialise with 0 arrays with default value
	for each in stacks {
		let array = Array<Int>(repeating: 0, count: each.count)
		lookup.append(array)
	}
	
	// let's calculate max sum
	for i in 0..<stacks.count {
		for j in 0..<stackSize {
			
			if i == 0 { // first stack
				lookup[i][j] = j == 0 ? stacks[i][j]: max(lookup[i][j-1], stacks[i][j])
				
			} else {
				
				// let's calculate the sum
				// use previous dp result and current stack value
				for k in 0...j {
					let sum = stacks[i][k] + lookup[i-1][j-k]
					lookup[i][j] = max(lookup[i][j], sum)
				}
			}
		}
	}
	
	print(lookup)
	return lookup[stacks.count-1][N]
}


let stacks = [[2,6,4,5], [1,6,15,10]]
let sum = calculateMaxSum(stacks: stacks, numberOfPopUps: 3)
print(sum)


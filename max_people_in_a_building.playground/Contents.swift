import UIKit


/*
	given - an array of record

	[ 	{"timestamp": 1, count: 5, "type": "enter"}, // people = 5
		{"timestamp": 3, count: 2, "type": "enter"}, // people = 7
		{"timestamp": 6, count: 3, "type": "exit"}, // people = 4
		{"timestamp": 7, count: 1, "type": "exit"}, // people = 3
		{"timestamp": 9, count: 15, "type": "enter"}, // people = 18
		{"timestamp": 13, count: 2, "type": "exit"}, // people = 16
		{"timestamp": 16, count: 8, "type": "exit"}, // people = 8
		{"timestamp": 18, count: 8, "type": "enter"} // people = 0
	]

determine which time the number was max in the building - (timestamp - 9 to 13), people = 18

*/


class Building {
	
	var record: [String: Int] = [
		"people": 0,
		"max": 0,
		"entry": 0,
		"exit": 0
	]
	
	func processRequests(_ requests: [[String: Any]] ) {
		
		guard !requests.isEmpty else { return }
		
		for requestDict in requests {
			
			if let type = requestDict["type"] as? String {
				
				let people = record["people"] ?? 0
				let max = record["max"] ?? 0
				let count = requestDict["count"] as? Int ?? 0
				let timestamp = requestDict["timestamp"] as? Int ?? 0
				
				//print(record)
				
				if type == "enter" {  // if it is entry
					
					// update count
					record["people"] = people + count
					
					if people + count > max { // update entry field
						record["entry"] = timestamp
						record["max"] = people + count
					}
					
				} else if type == "exit" { // if it is exit
					
					// check whether it is max people time gap or not
					if people == max {
						record["exit"] = timestamp
					}
					
					// update the count
					record["people"] = people - count
				}
			}
			
		}
		
		print(record)
	}
	
}

let building = Building()
let requests: [[String: Any]] = [ ["timestamp": 1, "count": 5, "type": "enter"], // people = 5
	["timestamp": 3, "count": 2, "type": "enter"], // people = 7
	["timestamp": 6, "count": 3, "type": "exit"], // people = 4
	["timestamp": 7, "count": 1, "type": "exit"], // people = 3
	["timestamp": 9, "count": 15, "type": "enter"], // people = 18
	["timestamp": 13, "count": 2, "type": "exit"], // people = 16
	["timestamp": 16, "count": 8, "type": "exit"], // people = 8
	["timestamp": 18, "count": 8, "type": "exit"] // people = 0
]
building.processRequests(requests)


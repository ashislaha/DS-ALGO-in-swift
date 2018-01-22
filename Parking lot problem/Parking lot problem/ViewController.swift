
import UIKit

/*
 
 Problem defination :
 
 1) The parking lot has multiple levels. Each level has multiple rows of spots.
 2) The parking lot can park motorcycles, cars, and buses.
 3) The parking lot has motorcycle spots, compact spots, and large spots.
 4) A motorcycle can park in any spot.
 5) A car can park in either a single compact spot or a single large spot.
 6) A bus can park in five large spots that are consecutive and within the same row. It cannot park in small spots.
 
 */

enum SpotType {
    case small, medium, big
}

enum VehicleType {
    case bike, car, bus
}

//MARK: Parking Spot Architecture

class Spot {
    
    private var type : SpotType = .small
    private var fill : Bool = false
    private var number : (level : Int, row : Int, spot : Int) =  (0,0,0)
    
    init(spotType : SpotType, spotNumber : (Int,Int, Int)) {
        type = spotType
        number = spotNumber
    }
    
    public func isAvailable() -> Bool {
        return !fill
    }
    
    public func makeFill() {
        fill = true
    }
    
    public func getType() -> SpotType {
        return type
    }
    
    public func getNumber() -> (Int,Int,Int) {
        return number
    }
}

class ParkingSpots {
    
    private var levels : Int = 0 // number of levels
    private var rows : Int = 0  // number of rows per level
    private var spots : Int = 0  // number of spots per row
    private var structure : [[[Spot]]] = [] // [level][row][spot]
    
    init(levels : Int, rows : Int, spots : Int, spotsArray : [[[Spot]]]) {
        self.levels = levels
        self.rows  = rows
        self.spots = spots
        structure = spotsArray
    }
    
    public func isSpotAvailable(level : Int, row : Int, spot : Int ) -> Bool {
        return structure[level][row][spot].isAvailable()
    }
    
    public func makeSpotFill(level : Int, row : Int, spot : Int) {
        structure[level][row][spot].makeFill()
    }
}

//MARK: Vehicle

class Vehicle {
    
    var type : VehicleType = .bike
    var space : Int = 1
    var allowedSpotType : [SpotType] = []
    
    private var spots : [Spot] = []
    
    init(vehicleType : VehicleType, spaceReqired : Int, allowedSpotType : [SpotType] ) {
        type = vehicleType
        space = spaceReqired
        self.allowedSpotType = allowedSpotType
    }
    
    public func assignSpots(spots : [Spot] ) {
        self.spots = spots
    }
    
    public func getSpots() -> [Spot] {
        return spots
    }
}

class Motocycle : Vehicle {
    init() {
        super.init(vehicleType: .bike, spaceReqired: 1, allowedSpotType: [.small,.medium,.big])
    }
}

class Car : Vehicle {
    init() {
        super.init(vehicleType: .car, spaceReqired: 1, allowedSpotType: [.medium,.big])
    }
}

class Bus : Vehicle {
    init() {
        super.init(vehicleType: .bus, spaceReqired: 5, allowedSpotType: [.big])
    }
}

//MARK: Parking Manager

class ParkingManager {
    
    
    let input : [[[SpotType]]] = [
    [
        [.small, .small, .small, .small, .small, .medium]
    ]
    ]
    
}





class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

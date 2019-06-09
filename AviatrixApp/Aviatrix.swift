//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var author = ""
    var data = AviatrixData()
    var location = "St. Louis"
    var distanceTraveled = 0
    let maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var refuelAmount = 0.0
    var fuelCost = 0.0
    
    init(programAuthor : String) {
        author = programAuthor
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() {
        refuelAmount = Double(maxFuel) - fuelLevel
        fuelLevel = Double(maxFuel)
        
        fuelCost += refuelAmount * plane.data.fuelPrices[plane.location]!
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(location: location, target: destination)
        location = destination
        
        fuelLevel -= Double(distanceTraveled) / milesPerGallon
    }
    
    func distanceTo(location : String, target : String) -> Int {
        return data.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}

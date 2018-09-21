//
//  Car.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation


struct Car: Decodable {
    struct Entity {
        static let EntityName = "CarEntity"
        static let addressColumn = "address"
        static let coordinatesColumn = "coordinates"
        static let engineTypeColumn = "engineType"
        static let exteriorColumn = "exterior"
        static let fuelColumn = "fuel"
        static let interiorColumn = "interior"
        static let nameColumn = "name"
        static let vinColumn = "vin"
    }
    
    let address: String
    let coordinates: [Double]
    let engineType: String
    let exterior: String
    let fuel: Int
    let interior: String
    let name: String
    let vin: String
}


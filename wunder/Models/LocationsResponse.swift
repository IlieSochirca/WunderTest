//
//  LocationsResponse.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation

struct LocationsResponse: Decodable {
    let placemarks: [Car]
}

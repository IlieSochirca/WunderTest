//
//  Configuration.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation

struct API {
    
    private init() {}
    
    private static let BaseUrl: String = "https://s3-us-west-2.amazonaws.com"
    
    static var cars: String {
        return BaseUrl + "/wunderbucket/locations.json"
    }
}

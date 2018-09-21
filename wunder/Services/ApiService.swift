//
//  ApiService.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    
    static let sharedInstance: ApiService = ApiService()
    
    private init() {}
    
    func fetchCarList(comletion: @escaping ([Car]?) -> Void){
        Alamofire.request(API.cars)
            .responseJSON { (response) in
                comletion(self.decode(type: LocationsResponse.self, data: response.data)?.placemarks)
        }
    }
    
    private func decode<T>(type: T.Type, data: Data?) -> T? where T: Decodable {
        guard let data = data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        return try? decoder.decode(T.self, from: data)
    }
    
}

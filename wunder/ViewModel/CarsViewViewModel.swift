//
//  CarsViewViewModel.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CarsViewViewModel {
    
    private let apiService: ApiService
    
    private let carRepository = CarRepository()
    
    var carsList: [Car] = []
    
    var didLoadData: (() -> ())?
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func fetchData() {
        
        carsList = carRepository.getDataFromDb()
        
        guard carsList.isEmpty else {
            didLoadData?()
            return
        }
        apiService.fetchCarList { [weak self] (cars) in
            guard let cars = cars else {
                return
            }
            self?.carRepository.saveDataToDb(cars: cars)

            guard let data = self?.carRepository.getDataFromDb() else {
                return
            }
            self?.carsList = data
            self?.didLoadData?()
        }
    }
    
    var carsCount:Int {
        return carsList.count
    }
    
    func carAt(indexPath:IndexPath) -> Car {
        return carsList[indexPath.row]
    }
}

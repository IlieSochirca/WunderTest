//
//  CarRepository.swift
//  wunder
//
//  Created by Ilie Sochirca on 21/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CarRepository{
    
    func saveDataToDb(cars:[Car]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        for car in cars {
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: Car.Entity.EntityName, in: context)
            let newCar = NSManagedObject(entity: entity!, insertInto: context)
            newCar.setValue(car.address, forKey: Car.Entity.addressColumn)
            newCar.setValue(car.coordinates, forKey: Car.Entity.coordinatesColumn)
            newCar.setValue(car.engineType, forKey: Car.Entity.engineTypeColumn)
            newCar.setValue(car.exterior, forKey: Car.Entity.exteriorColumn)
            newCar.setValue(car.fuel, forKey: Car.Entity.fuelColumn)
            newCar.setValue(car.interior, forKey: Car.Entity.interiorColumn)
            newCar.setValue(car.name, forKey: Car.Entity.nameColumn)
            newCar.setValue(car.vin, forKey: Car.Entity.vinColumn)
            
            do {
                try context.save()
            } catch {
                print("Fail saving")
            }
            
        }
    }
    
    func getDataFromDb() -> [Car] {
        
        var cars: [Car] = []
        
        let managedContext =
            AppDelegate.shared.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: Car.Entity.EntityName)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            result.forEach { (nsObject) in
                let car = Car.init(address: nsObject.value(forKey: Car.Entity.addressColumn) as! String,
                                   coordinates: nsObject.value(forKey: Car.Entity.coordinatesColumn) as! [Double],
                                   engineType: nsObject.value(forKey: Car.Entity.engineTypeColumn) as! String,
                                   exterior: nsObject.value(forKey: Car.Entity.exteriorColumn) as! String,
                                   fuel: nsObject.value(forKey: Car.Entity.fuelColumn) as! Int,
                                   interior: nsObject.value(forKey: Car.Entity.interiorColumn) as! String,
                                   name: nsObject.value(forKey: Car.Entity.nameColumn) as! String,
                                   vin: nsObject.value(forKey: Car.Entity.vinColumn) as! String
                )
                cars.append(car)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return cars
    }

}

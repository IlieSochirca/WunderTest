//
//  CarDetailViewController.swift
//  wunder
//
//  Created by Ilie Sochirca on 20/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {

    var carDetail:Car!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var engineTypeLbl: UILabel!
    
    @IBOutlet weak var fuelLbl: UILabel!
    
    @IBOutlet weak var interiorLbl: UILabel!
    
    @IBOutlet weak var exteriorLbl: UILabel!
    
    @IBOutlet weak var vinLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Car Details"
        self.updateDetails()
        // Do any additional setup after loading the view.
    }


    func updateDetails(){
        nameLbl.text = carDetail.name
        addressLbl.text = carDetail.address
        engineTypeLbl.text = carDetail.engineType
        fuelLbl.text = String(carDetail.fuel)
        interiorLbl.text = carDetail.interior
        exteriorLbl.text = carDetail.exterior
        vinLbl.text = carDetail.vin
        
        
        
    }
    
}

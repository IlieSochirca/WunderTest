//
//  ViewController.swift
//  wunder
//
//  Created by Ilie Sochirca on 18/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import UIKit

class CarTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: CarsViewViewModel = CarsViewViewModel(apiService: ApiService.sharedInstance)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wunder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show on Map", style: .plain, target: self, action: #selector(showMap))
        
        viewModel.didLoadData = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.carsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! CarUITableViewCell
        cell.nameLabel.text = viewModel.carAt(indexPath: indexPath).name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "carDetailVC") as! CarDetailViewController
        carDetailVC.carDetail = viewModel.carAt(indexPath: indexPath)
        self.navigationController?.pushViewController(carDetailVC, animated: true)
    }
    
    @objc func showMap(){
        let mapVc = self.storyboard?.instantiateViewController(withIdentifier: "mapVC") as! MapViewController
        mapVc.cars = viewModel.carsList
        self.navigationController?.pushViewController(mapVc, animated: true)
    }
    
}


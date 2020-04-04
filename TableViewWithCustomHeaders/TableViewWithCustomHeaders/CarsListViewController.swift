//
//  CarsListViewController.swift
//  TableViewWithCustomHeaders
//
//  Created by Cesar Brenes on 4/4/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class CarsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cars = [CarBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registersCustomCells()
        fillCarsArray()
    }
    
    func fillCarsArray() {
        let totoyaModels = [CarModel(name: "Yaris", year: 2012, engine: .gasoline),CarModel(name: "Corolla", year: 2020, engine: .diesel), CarModel(name: "Prius", year: 2021, engine: .electric)]
        cars.append(CarBrand(name: "Toyota", country: "Japon", models: totoyaModels))
        let chevroletModels = [CarModel(name: "Camaro", year: 2019, engine: .gasoline),CarModel(name: "Colorado", year: 2020, engine: .diesel)]
        cars.append(CarBrand(name: "Chevrolet", country: "USA", models: chevroletModels))
        let bmwModels = [CarModel(name: "X6", year: 2021, engine: .diesel)]
        cars.append(CarBrand(name: "BMW", country: "Alemania", models: bmwModels))
    }
    
    func registersCustomCells() {
        tableView.register(UINib(resource: R.nib.modelCarTableViewCell), forCellReuseIdentifier: R.nib.modelCarTableViewCell.name)
        tableView.register(UINib(resource: R.nib.carBrandHeaderView), forHeaderFooterViewReuseIdentifier: R.nib.carBrandHeaderView.name)
    }
}

extension CarsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars[section].models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.modelCarTableViewCell.name) as? ModelCarTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(model: cars[indexPath.section].models[indexPath.row])
        return cell
    }
    
    //METODOS NECESARIOS PARA EL HEADER
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.carBrandHeaderView.name) as? CarBrandHeaderView else {
            return UIView()
        }
        cell.setupCell(carBrand: cars[section])
        return cell
    }
}

//
//  CarBrandHeaderView.swift
//  TableViewWithCustomHeaders
//
//  Created by Cesar Brenes on 4/4/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class CarBrandHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    func setupCell(carBrand: CarBrand) {
        nameLabel.text = carBrand.name
        countryLabel.text = carBrand.country
    }
}

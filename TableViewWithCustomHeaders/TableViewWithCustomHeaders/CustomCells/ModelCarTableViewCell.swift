//
//  ModelCarTableViewCell.swift
//  TableViewWithCustomHeaders
//
//  Created by Cesar Brenes on 4/4/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class ModelCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var engineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func setupCell(model: CarModel) {
        nameLabel.text = "Modelo: \(model.name)"
        yearLabel.text = "Año de fabricación \(model.year)"
        switch model.engine {
        case .diesel:
            engineLabel.text = "Motor: Diesel"
        case .gasoline:
            engineLabel.text = "Motor: Gasolina"
        case .electric:
            engineLabel.text = "Motor: Eléctrico"
        }
    }
}

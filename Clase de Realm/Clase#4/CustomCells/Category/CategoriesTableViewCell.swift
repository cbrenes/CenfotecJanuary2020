//
//  CategoriesTableViewCell.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    

    func setupCell(category: Category) {
        titleLabel.text = category.name
        categoryImageView.image = UIImage(named: category.imageName)
    }
    
}

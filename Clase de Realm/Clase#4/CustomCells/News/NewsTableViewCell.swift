//
//  NewsTableViewCell.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setupCell(news: News) {
        titleLabel.text = news.title
        dateLabel.text = news.date.getFormatted(dateStyle: .short, timeStyle: .long)
    }
}

//
//  CustomTableViewCell.swift
//  RestApiExample
//
//  Created by Cesar Brenes on 4/25/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(meme: Meme) {
        if let imageURL = URL(string: meme.image) {
            memeImageView.kf.indicatorType = .activity
            let processor = DownsamplingImageProcessor(size: memeImageView.frame.size)
            let placeHolderImage = R.image.default()
            memeImageView.kf.setImage(with: imageURL, placeholder: placeHolderImage, options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage])
        }
        topTitleLabel.text = meme.topText
        bottomTitleLabel.text = meme.bottomText
    }
}

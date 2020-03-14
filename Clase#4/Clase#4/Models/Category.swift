//
//  Category.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation


class Category {
    
    var identifier =  NSUUID().uuidString
    var name: String
    var imageName: String
    var news: [News]
    
    init(name: String, imageName: String, news: [News]) {
        self.name = name
        self.imageName = imageName
        self.news = news
    }
}

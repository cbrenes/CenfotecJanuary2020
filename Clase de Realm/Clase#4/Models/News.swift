//
//  News.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import RealmSwift

class News: Object {
    @objc dynamic var date = Date()
    @objc dynamic var title = ""
    @objc dynamic var descriptionNews = ""

    let categories = LinkingObjects(fromType: Category.self, property: "news")
    
    convenience init(title: String, descriptionNews: String) {
        self.init()
        self.title = title
        self.descriptionNews = descriptionNews
    }
}

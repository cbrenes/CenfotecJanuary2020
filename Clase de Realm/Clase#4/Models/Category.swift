//
//  Category.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var imageName = ""
    
    let news = List<News>()
    
    convenience init(name: String, imageName:String){
        self.init()
        self.name = name
        self.imageName = imageName
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }
}

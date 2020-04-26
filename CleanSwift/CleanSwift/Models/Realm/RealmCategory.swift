//
//  RealmCategory.swift
//  CleanSwift
//
//  Created by Cesar Brenes on 4/25/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategory: Object {
    
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var imageName = ""
    
    let news = List<RealmNews>()
    
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
    
    convenience init(category: Category) {
        self.init()
        identifier = category.identifier
        name = category.name
        imageName = category.imageName
        for newsObject in category.news {
            news.append(RealmNews(news: newsObject))
        }
    }
        
    func toCategory() -> Category {
        return Category(identifier: identifier, name: name, imageName: imageName, news: news.map({$0.toNews()}))
    }
}

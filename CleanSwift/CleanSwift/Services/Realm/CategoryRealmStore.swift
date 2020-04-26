//
//  CategoryRealmStore.swift
//  CleanSwift
//
//  Created by Cesar Brenes on 4/25/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryRealmStore: CategoryStoreProcol {
    
    func insert(category: Category, completionHandler: () -> Void) {
        let category = RealmCategory(category: category)
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(category, update: .all)
            }
            completionHandler()
        } catch {
            print("Realm falló por alguna razón")
            completionHandler()
        }
    }
    
    func fetchAll(completionHandler: ([Category]) -> Void) {
        let realm = try? Realm()
        var categories = [Category]()
        guard let  realmCategories =  realm?.objects(RealmCategory.self) else {
            completionHandler(categories)
            return
        }
        for realmCategory in realmCategories {
            categories.append(realmCategory.toCategory())
        }
        completionHandler(categories)
    }
}


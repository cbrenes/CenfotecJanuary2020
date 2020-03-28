//
//  RealmManager.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/28/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    func insertCategory(name: String, imageName: String) {
        let category = Category(name: name, imageName: imageName)
        do {
            //let realm = try! Realm() esto es incorrecto xq esta haciendo un forze unwrap, si por alguna razon es nulo, la aplicación se va a caer
            let realm = try Realm()
            try realm.write {
                realm.add(category, update: .all)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func addNewsToCategory(news: News, category: Category) {
        do {
            //let realm = try! Realm() esto es incorrecto xq esta haciendo un forze unwrap, si por alguna razon es nulo, la aplicación se va a caer
            let realm = try Realm()
            try realm.write {
                category.news.append(news)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    //Obtiene todas las categorias de forma syncrona
    func getAllCategories() -> Results<Category>? {
        let realm = try? Realm()
        return realm?.objects(Category.self)
    }
    
    //Obtiene todas las categorias de forma asyncrona
    func getAllCategories(completionHandler:(_ categories: Results<Category>?) -> Void) {
        completionHandler(getAllCategories())
    }
}

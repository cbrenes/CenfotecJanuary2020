//
//  CategoryMemoryStore.swift
//  CleanSwift
//
//  Created by Cesar Brenes on 4/25/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation

class CategoryMemoryStore: CategoryStoreProcol {
    func insert(category: Category, completionHandler: () -> Void) {
        completionHandler()
    }
    
    func fetchAll(completionHandler: ([Category]) -> Void) {
        let categories = [Category(name: "test1", imageName: "test1", news: [News]()),
                          Category(name: "test2", imageName: "test2", news: [News]()),
                          Category(name: "test3", imageName: "test3", news: [News]()),
                          Category(name: "test4", imageName: "test4", news: [News]()),
                          Category(name: "test5", imageName: "test5", news: [News]()),
                          Category(name: "test6", imageName: "test6", news: [News]()),
                          Category(name: "test7", imageName: "test7", news: [News]()),
                          Category(name: "test8", imageName: "test8", news: [News]())]
        completionHandler(categories)
    }
}

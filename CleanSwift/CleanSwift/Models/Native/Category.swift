//
//  Category.swift
//  CleanSwift
//
//  Created by Cesar Brenes on 4/25/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation

struct Category {
    var identifier = NSUUID().uuidString
    var name: String
    var imageName: String
    var news: [News]
}

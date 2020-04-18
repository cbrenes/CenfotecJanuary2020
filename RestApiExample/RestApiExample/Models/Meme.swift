//
//  Meme.swift
//  RestApiExample
//
//  Created by Cesar Brenes on 4/18/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation


struct MemeKeys {
    static let id = "ID"
    static let bottomText = "bottomText"
    static let image = "image"
    static let name = "name"
    static let rank = "rank"
    static let tags = "tags"
    static let topText = "topText"
}


struct Meme {
    var id: Int
    var bottomText: String
    var image: String
    var name: String
    var rank: Int
    var tags: [String]
    var topText: String
}

extension Meme {
    init(dictionary: [String: Any]) {
        id = dictionary[MemeKeys.id] as? Int ?? -1
        bottomText = dictionary[MemeKeys.bottomText] as? String ?? ""
        image = dictionary[MemeKeys.image] as? String ?? ""
        name = dictionary[MemeKeys.name] as? String ?? ""
        rank = dictionary[MemeKeys.rank] as? Int ?? -1
        topText = dictionary[MemeKeys.topText] as? String ?? ""
        tags = (dictionary[MemeKeys.tags] as? String ?? "").components(separatedBy: ",")
    }
}

//
//  CarModel.swift
//  TableViewWithCustomHeaders
//
//  Created by Cesar Brenes on 4/4/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation

struct CarModel {
    
    enum EngineType {
        case gasoline
        case diesel
        case electric
    }
    
    var name: String
    var year: Int
    var engine: EngineType
}

//
//  Pression.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct Pression {
    var seaLevel: Int?
    
    init() {
    }
}

extension Pression: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.seaLevel = try? map.value("niveau_de_la_mer")
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.seaLevel   >>> map["niveau_de_la_mer"]
    }
}

//
//  Humidity.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct Humidity {
    var twoM: Double?
    
    init() {
    }
}

extension Humidity: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.twoM = try? map.value("2m")
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.twoM   >>> map["2m"]
    }
}

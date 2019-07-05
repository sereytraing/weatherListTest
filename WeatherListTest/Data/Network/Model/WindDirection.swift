//
//  WindDirection.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct WindDirection {
    var tenM: Double?
    
    init() {
    }
}

extension WindDirection: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.tenM = try? map.value("10m")
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.tenM   >>> map["10m"]
    }
}

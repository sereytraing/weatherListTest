//
//  Nebulosite.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct Nebulosite {
    var high: Int?
    var medium: Int?
    var low: Int?
    var total: Int?
    
    init() {
    }
}

extension Nebulosite: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.high = try? map.value("haute")
        self.medium = try? map.value("moyenne")
        self.low = try? map.value("basse")
        self.total = try? map.value("totale")
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.high   >>> map["haute"]
        self.medium   >>> map["moyenne"]
        self.low   >>> map["basse"]
        self.total   >>> map["totale"]
    }
}

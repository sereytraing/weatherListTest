//
//  Temperature.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct Temperature {
    var twoM: Double?
    var sol: Double?
    var fiveHundredhPa: Double?
    var eightFiftyhPa: Double?
    
    init() {
    }
}

extension Temperature: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.twoM = try? map.value("2m")
        self.sol = try? map.value("sol")
        self.fiveHundredhPa = try? map.value("500hPa")
        self.eightFiftyhPa = try? map.value("850hPa")
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.twoM   >>> map["2m"]
        self.sol   >>> map["sol"]
        self.fiveHundredhPa   >>> map["500hPa"]
        self.eightFiftyhPa   >>> map["850hPa"]
    }
}

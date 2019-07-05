//
//  Weather.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct Weather {
    var temperature: Temperature?
    var pression: Pression?
    var rain: Int?
    var convectiveRain: Int?
    var humidity: Humidity?
    var averageWind: AverageWind?
    var rafaleWind: RafaleWind?
    var windDirection: WindDirection?
    var isoZero: Int?
    var snowRisk: String?
    var cape: Int?
    var nebulosite: Nebulosite?
    
    var date: String?
    var hour: String?
    
    init() {
    }
}

extension Weather: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.temperature = try? map.value("temperature") as Temperature
        self.pression = try? map.value("pression") as Pression
        self.rain = try? map.value("pluie")
        self.convectiveRain = try? map.value("pluie_convective")
        self.humidity = try? map.value("humidite") as Humidity
        self.averageWind = try? map.value("vent_moyen") as AverageWind
        self.rafaleWind = try? map.value("vent_rafales") as RafaleWind
        self.windDirection = try? map.value("vent_direction") as WindDirection
        self.isoZero = try? map.value("iso_zero")
        self.snowRisk = try? map.value("risque_neige")
        self.cape = try? map.value("cape")
        self.nebulosite = try? map.value("nebulosite") as Nebulosite
    }
    
    // Object -> JSON
    func mapping(map: Map) {
        self.temperature   >>> map["temperature"]
        self.pression   >>> map["pression"]
        self.rain   >>> map["pluie"]
        self.convectiveRain   >>> map["pluie_convective"]
        self.humidity   >>> map["humidite"]
        self.averageWind   >>> map["vent_moyen"]
        self.rafaleWind   >>> map["vent_rafales"]
        self.windDirection   >>> map["vent_direction"]
        self.isoZero   >>> map["iso_zero"]
        self.snowRisk   >>> map["risque_neige"]
        self.cape   >>> map["cape"]
        self.nebulosite   >>> map["nebulosite"]
    }
}


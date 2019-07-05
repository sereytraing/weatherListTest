//
//  WeatherRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class WeatherRealm: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var temperature: TemperatureRealm?
    @objc dynamic var pression: PressionRealm?
    @objc dynamic var rain: Int = 0
    @objc dynamic var convectiveRain: Int = 0
    @objc dynamic var humidity: HumidityRealm?
    @objc dynamic var averageWind: AverageWindRealm?
    @objc dynamic var rafaleWind: RafaleWindRealm?
    @objc dynamic var windDirection: WindDirectionRealm?
    @objc dynamic var isoZero: Int = 0
    @objc dynamic var snowRisk: String = ""
    @objc dynamic var cape: Int = 0
    @objc dynamic var nebulosite: NebulositeRealm?
    
    @objc dynamic var date: String = ""
    @objc dynamic var hour: String = ""
    @objc dynamic var dateHour: String = ""
    
    override static func primaryKey() -> String? {
        return "dateHour"
    }
    
    convenience init(weather: Weather) {
        self.init()
        
        self.temperature = TemperatureRealm(temp: weather.temperature)
        self.pression = PressionRealm(pression: weather.pression)
        self.rain = weather.rain ?? 0
        self.convectiveRain = weather.convectiveRain ?? 0
        self.humidity = HumidityRealm(humidity: weather.humidity)
        self.averageWind = AverageWindRealm(averageWind: weather.averageWind) 
        self.rafaleWind = RafaleWindRealm(rafaleWind: weather.rafaleWind) 
        self.windDirection = WindDirectionRealm(windDirection: weather.windDirection) 
        self.isoZero = weather.isoZero ?? 0
        self.snowRisk = weather.snowRisk ?? ""
        self.cape = weather.cape ?? 0
        self.nebulosite = NebulositeRealm(nebulosite: weather.nebulosite)
        self.date = weather.date ?? ""
        self.hour = weather.hour ?? ""
        self.dateHour = date + hour
    }
}

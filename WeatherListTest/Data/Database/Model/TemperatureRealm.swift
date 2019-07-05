//
//  Temperature.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class TemperatureRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var twoM: Double = 0.0
    @objc dynamic var sol: Double = 0.0
    @objc dynamic var fiveHundredhPa: Double = 0.0
    @objc dynamic var eightFiftyhPa: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(temp: Temperature?) {
        self.init()
        self.twoM = temp?.twoM ?? 0.0
        self.sol = temp?.sol ?? 0.0
        self.fiveHundredhPa = temp?.fiveHundredhPa ?? 0.0
        self.eightFiftyhPa = temp?.eightFiftyhPa ?? 0.0
    }
}

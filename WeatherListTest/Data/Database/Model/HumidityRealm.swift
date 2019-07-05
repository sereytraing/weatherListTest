//
//  HumidityRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class HumidityRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var twoM: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(humidity: Humidity?) {
        self.init()
        self.twoM = humidity?.twoM ?? 0.0
    }
}

//
//  WindDirectionRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class WindDirectionRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tenM: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(windDirection: WindDirection?) {
        self.init()
        self.tenM = windDirection?.tenM ?? 0.0
    }
}

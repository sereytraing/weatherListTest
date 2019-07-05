//
//  RafaleWindRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class RafaleWindRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tenM: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(rafaleWind: RafaleWind?) {
        self.init()
        self.tenM = rafaleWind?.tenM ?? 0.0
    }
}

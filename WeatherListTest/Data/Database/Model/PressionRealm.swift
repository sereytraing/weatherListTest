//
//  Pression.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class PressionRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var seaLevel: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(pression: Pression?) {
        self.init()
        self.seaLevel = pression?.seaLevel ?? 0
    }
}

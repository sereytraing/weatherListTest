//
//  NebulositeRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class NebulositeRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var high: Int = 0
    @objc dynamic var medium: Int = 0
    @objc dynamic var low: Int = 0
    @objc dynamic var total: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(nebulosite: Nebulosite?) {
        self.init()
        self.high = nebulosite?.high ?? 0
        self.medium = nebulosite?.medium ?? 0
        self.low = nebulosite?.low ?? 0
        self.total = nebulosite?.total ?? 0
    }
}
